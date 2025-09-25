package com.by.gateway.filter;

import com.by.common.constant.JwtConstant;
import com.by.gateway.utils.JwtUtils;
import com.by.gateway.utils.RedisUtils;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Component
public class JwtAuthenticationFilter extends OncePerRequestFilter {
    
    @Autowired
    private JwtUtils jwtUtils;
    
    @Autowired
    private RedisUtils redisUtils;

    private final List<String> excludeUrls = Arrays.asList(
            "/api/", "/doc.html", "/webjars/", "/v3/api-docs/",
            "/swagger-ui/", "/swagger-resources/", "/swagger-ui.html"
    );



    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain chain) throws ServletException, IOException {


        String requestUri = request.getRequestURI();
        // 如果是白名单路径，直接放行
        if (excludeUrls.stream().anyMatch(requestUri::startsWith)) {
            chain.doFilter(request, response);
            return;
        }

        String token = getTokenFromRequest(request);

        if (token != null) {

            // 解析token并验证有效性
            if (!jwtUtils.validateToken(token)) {
                sendUnauthorizedResponse(response, "令牌无效，请重新登录");
                return;
            }
            // 解析token
            Long userId = jwtUtils.getUserIdFromToken(token);
            String username = jwtUtils.getUsernameFromToken(token);

            if (userId != null && username != null && SecurityContextHolder.getContext().getAuthentication() == null) {
                // 验证Redis中的token是否一致，不一致则表示过期
                String userTokenKey = JwtConstant.USER_TOKEN_PREFIX + userId;
                String redisToken = redisUtils.getToken(userTokenKey);
                if (redisToken == null) {
                    sendUnauthorizedResponse(response, "登录已过期，请重新登录");
                    return;
                }
                System.out.println(redisToken);
                if (token.equals(redisToken)) {
                    // 设置用户认证信息
                    UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(
                            userId, null, new ArrayList<>());
                    authentication.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
                    SecurityContextHolder.getContext().setAuthentication(authentication);

                    // 设置请求属性，方便后续使用
                    request.setAttribute("userId", userId);
                    request.setAttribute("username", username);
                }
            }
        }

        chain.doFilter(request, response);
    }

    private String getTokenFromRequest(HttpServletRequest request) {
        String bearerToken = request.getHeader(JwtConstant.HEADER_AUTHORIZATION);
        if (bearerToken != null && bearerToken.startsWith(JwtConstant.TOKEN_PREFIX)) {
            return bearerToken.substring(JwtConstant.TOKEN_PREFIX.length());
        }
        return null;
    }

    private void sendUnauthorizedResponse(HttpServletResponse response, String message) throws IOException {
        response.setContentType("application/json;charset=UTF-8");
        response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
        PrintWriter writer = response.getWriter();
        writer.write("{\"code\": 401, \"message\": \"" + message + "\", \"data\": null}");
        writer.flush();
        writer.close();
    }
}
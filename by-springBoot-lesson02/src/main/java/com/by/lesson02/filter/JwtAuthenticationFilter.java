package com.by.lesson02.filter;

/**
 * @author bandd
 * @date2026年02月28日10:33
 */

import com.alibaba.fastjson.JSON;
import com.by.lesson02.entity.ByUser;
import com.by.lesson02.result.Result;
import com.by.lesson02.result.ResultCode;
import com.by.lesson02.service.ByUserService;
import com.by.lesson02.service.TokenService;
import com.by.lesson02.utils.UserContextHolder;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.List;

/**
 * JWT 认证过滤器：校验 Token 并将当前用户放入 UserContextHolder
 * 登录、刷新 Token、Swagger 等路径不校验
 */
@Component
@Order(1)
public class JwtAuthenticationFilter extends OncePerRequestFilter {

    @Autowired
    private TokenService tokenService;
    @Autowired
    private ByUserService byUserService;

    @Value("${jwt.header:Authorization}")
    private String headerName;
    @Value("${jwt.prefix:Bearer }")
    private String tokenPrefix;

    /**
     * 不需要 Token 的路径前缀
     */
    private static final List<String> SKIP_PATHS = List.of(
            "/byUser/login",
            "/byUser/refreshToken",
            "/byUser/logout",
            "/doc.html",
            "/webjars/",
            "/v3/api-docs",
            "/swagger-resources"
    );

    @Override
    protected boolean shouldNotFilter(HttpServletRequest request) {
        String path = request.getRequestURI();
        return SKIP_PATHS.stream().anyMatch(path::startsWith);
    }

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response,
                                    FilterChain filterChain) throws ServletException, IOException {
        try {
            String token = resolveToken(request);
            if (!StringUtils.hasText(token)) {
                writeUnauthorized(response, ResultCode.UNAUTHORIZED.getCode(), ResultCode.UNAUTHORIZED.getMessage());
                return;
            }
            String userId = tokenService.validateAndGetUserId(token);
            if (userId == null) {
                writeUnauthorized(response, ResultCode.TOKEN_EXPIRED.getCode(), ResultCode.TOKEN_EXPIRED.getMessage());
                return;
            }
            ByUser user = byUserService.getById(userId);
            if (user == null) {
                writeUnauthorized(response, ResultCode.TOKEN_INVALID.getCode(), ResultCode.TOKEN_INVALID.getMessage());
                return;
            }
            user.setPassword(null);
            UserContextHolder.setUser(user);
            filterChain.doFilter(request, response);
        } finally {
            UserContextHolder.clear();
        }
    }

    private String resolveToken(HttpServletRequest request) {
        String value = request.getHeader(headerName);
        if (!StringUtils.hasText(value) || !value.startsWith(tokenPrefix)) {
            return null;
        }
        return value.substring(tokenPrefix.length()).trim();
    }

    private void writeUnauthorized(HttpServletResponse response, int code, String message) throws IOException {
        response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
        response.setContentType("application/json;charset=UTF-8");
        response.setCharacterEncoding(StandardCharsets.UTF_8.name());
        Result<?> result = Result.fail(code, message);
        response.getWriter().write(JSON.toJSONString(result));
    }
}

//package com.by.upms.filter;
//
//import com.by.upms.utils.JwtUtils;
//import com.by.upms.utils.RedisUtils;
//import jakarta.servlet.FilterChain;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
//import org.springframework.security.core.context.SecurityContextHolder;
//import org.springframework.security.core.userdetails.UserDetails;
//import org.springframework.security.core.userdetails.UserDetailsService;
//import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
//import org.springframework.stereotype.Component;
//import org.springframework.web.filter.OncePerRequestFilter;
//
//import java.io.IOException;
//
//@Component
//public class JwtAuthenticationFilter extends OncePerRequestFilter {
//
//    @Autowired
//    private JwtUtils jwtUtils;
//
//    @Autowired
//    private RedisUtils redisUtils;
//
//    @Autowired
//    private UserDetailsService userDetailsService;
//
//    @Override
//    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response,
//                                    FilterChain filterChain) throws ServletException, IOException {
//        // 1. 从请求头中获取token
//        String authorizationHeader = request.getHeader("Authorization");
//        String token = null;
//        String username = null;
//
//        if (authorizationHeader != null && authorizationHeader.startsWith("Bearer ")) {
//            token = authorizationHeader.substring(7);
//            try {
//                username = jwtUtils.extractUsername(token);
//            } catch (Exception e) {
//                logger.error("无法提取用户名: {}");
//            }
//        }
//
//        // 2. 验证token并设置认证信息
//        if (username != null && SecurityContextHolder.getContext().getAuthentication() == null) {
//            // 验证token是否有效且存在于Redis中
//            if (JwtUtils.isTokenValid(token, username) && redisUtils.hasToken(username, token)) {
//                UserDetails userDetails = userDetailsService.loadUserByUsername(username);
//                UsernamePasswordAuthenticationToken authenticationToken =
//                        new UsernamePasswordAuthenticationToken(userDetails, null, userDetails.getAuthorities());
//                authenticationToken.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
//                SecurityContextHolder.getContext().setAuthentication(authenticationToken);
//            }
//        }
//
//        // 继续过滤链
//        filterChain.doFilter(request, response);
//    }
//}
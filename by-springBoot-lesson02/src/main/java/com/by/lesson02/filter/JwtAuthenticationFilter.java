package com.by.lesson02.filter;

/**
 * @author bandd
 * @date2026年02月28日10:33
 */

import com.alibaba.fastjson.JSON;
import com.by.lesson02.config.JwtProperties;
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
    @Autowired
    private JwtProperties jwtProperties;

    /**
     * 判断当前请求是否需要跳过认证过滤。
     * <p>
     * 这里使用 {@code startsWith} 做前缀匹配，便于把一组相关资源（如 Swagger 静态资源）
     * 统一配置成一个前缀，而不必枚举每个具体路径。
     */
    @Override
    protected boolean shouldNotFilter(HttpServletRequest request) {
        String path = request.getRequestURI();
        List<String> skipPaths = jwtProperties.getSkipPaths();
        return skipPaths != null && skipPaths.stream().anyMatch(path::startsWith);
    }

    /**
     * 认证主流程：
     * <p>
     * - 从请求头解析 accessToken（约定为 {@code Authorization: Bearer xxx}）。<br>
     * - 校验 JWT 签名/过期，并额外检查 Redis 是否仍存在该 token（支持退出/踢下线）。<br>
     * - 校验通过后把当前用户放入 {@link UserContextHolder}，方便后续业务读取。<br>
     * <p>
     * 注意：必须在 {@code finally} 中清理 ThreadLocal，避免线程复用导致的“串号”问题。
     */
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

    /**
     * 从请求头中解析 Bearer Token。
     * <p>
     * 解析规则通过配置 {@code jwt.header} 与 {@code jwt.prefix} 统一管理，便于前后端约定变更。
     *
     * @return 解析成功返回 token（不含前缀），否则返回 null
     */
    private String resolveToken(HttpServletRequest request) {
        String headerName = jwtProperties.getHeader();
        String tokenPrefix = jwtProperties.getPrefix();
        String value = request.getHeader(headerName);
        if (!StringUtils.hasText(value) || !value.startsWith(tokenPrefix)) {
            return null;
        }
        return value.substring(tokenPrefix.length()).trim();
    }

    /**
     * 认证失败时的统一返回。
     * <p>
     * 这里直接返回 JSON 结构，便于前端统一拦截 401 并触发刷新 token / 跳转登录等策略。
     */
    private void writeUnauthorized(HttpServletResponse response, int code, String message) throws IOException {
        response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
        response.setContentType("application/json;charset=UTF-8");
        response.setCharacterEncoding(StandardCharsets.UTF_8.name());
        Result<?> result = Result.fail(code, message);
        response.getWriter().write(JSON.toJSONString(result));
    }
}

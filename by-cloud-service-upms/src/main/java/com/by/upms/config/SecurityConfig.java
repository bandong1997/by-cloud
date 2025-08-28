package com.by.upms.config;

import com.by.upms.entity.SysUser;
import com.by.upms.filter.JwtAuthenticationFilter;
import com.by.upms.mapper.SysUserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

/**
 * Gateway模块的Spring Security配置类
 * 配置API网关的安全规则和认证方式
 */
@Configuration
@EnableWebSecurity
public class SecurityConfig {


    @Autowired
    private SysUserMapper sysUserMapper;
    @Autowired
    private JwtAuthenticationFilter jwtAuthenticationFilter;


    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public UserDetailsService userDetailsService() {
        return username -> {
            SysUser user = sysUserMapper.findByUsername(username);
            if (user == null) {
                throw new UsernameNotFoundException("用户不存在");
            }
            return org.springframework.security.core.userdetails.User.builder()
                    .username(user.getUsername())
                    .password(user.getPassword())
                    .roles("USER")
                    .build();
        };
    }

    @Bean
    public DaoAuthenticationProvider authenticationProvider() {
        DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
        authProvider.setUserDetailsService(userDetailsService());
        authProvider.setPasswordEncoder(passwordEncoder());
        return authProvider;
    }

    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration authConfig) throws Exception {
        return authConfig.getAuthenticationManager();
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http.csrf(AbstractHttpConfigurer::disable)
                .authorizeHttpRequests(auth -> auth
                        .requestMatchers("/api/*/**").permitAll()
                        // 添加静态资源路径
                        .requestMatchers(
                                "/doc.html",
                                "/webjars/**",
                                "/v3/api-docs/**",
                                "/swagger-ui/**",
                                "/swagger-resources/**",
                                "/swagger-ui.html"
                        ).permitAll()
                        .anyRequest().authenticated()
                )
                // 添加JWT过滤器
                .addFilterBefore(jwtAuthenticationFilter, UsernamePasswordAuthenticationFilter.class);

        http.authenticationProvider(authenticationProvider());

        return http.build();
    }


}
package com.iris_chat.irischat_backend.share.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class SecurityConfig {
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
                // 1. Tắt CSRF (Vì chúng ta dùng JWT/Mobile App, không dùng Session)
                .csrf(csrf -> csrf.disable())

                // 2. Cấu hình phân quyền
                .authorizeHttpRequests(auth -> auth
                        // Cho phép tất cả mọi người vào các link đăng ký/đăng nhập
                        .requestMatchers("/api/auth/**").permitAll()
                        // Cho phép vào link WebSocket (nếu bạn đang làm chat)
                        .requestMatchers("/ws/**").permitAll()
                        // Tất cả các request khác đều PHẢI có token mới được vào
                        .anyRequest().authenticated());

        return http.build();
    }
}

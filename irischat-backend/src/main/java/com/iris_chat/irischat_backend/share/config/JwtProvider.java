package com.iris_chat.irischat_backend.share.config;

import java.security.Key;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Component;
import com.iris_chat.irischat_backend.features.auth.AccountCollection;

import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.security.Keys;

@Component
public class JwtProvider {
    // 1. Chuỗi này PHẢI cực kỳ dài (trên 64 ký tự) để thỏa mãn thuật toán HS512
    private final String JWT_SECRET = "iris_chat_backend_secret_key_2026_thanh_hieu_project_very_long_and_secure_key_for_hs512_algorithm";
    private final long JWT_EXPIRATION_MS = 2592000000L; // 30 days

    private Key getSigningKey() {
        // Chuyển chuỗi String thành Key an toàn cho HS512
        return Keys.hmacShaKeyFor(JWT_SECRET.getBytes());
    }

    public String generateToken(AccountCollection account) {
        Date now = new Date();
        Date expiryDate = new Date(now.getTime() + JWT_EXPIRATION_MS);

        Map<String, Object> claims = new HashMap<>();
        claims.put("id", account.getId());
        claims.put("phoneNumber", account.getPhoneNumber());
        claims.put("usernameClean", account.getUsernameClean());
        claims.put("avatarUrl", account.getAvatarUrl());

        return Jwts.builder()
                .setClaims(claims)
                .setSubject(account.getUsernameClean())
                .setIssuedAt(now)
                .setExpiration(expiryDate)
                .signWith(getSigningKey(), SignatureAlgorithm.HS512) // Sử dụng hàm getSigningKey đã sửa
                .compact();
    }
}
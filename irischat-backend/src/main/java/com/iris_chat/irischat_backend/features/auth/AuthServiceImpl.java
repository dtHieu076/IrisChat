package com.iris_chat.irischat_backend.features.auth;

import java.text.Normalizer;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.iris_chat.irischat_backend.share.config.JwtProvider;
import com.iris_chat.irischat_backend.share.dto.auth.request.LoginRequest;
import com.iris_chat.irischat_backend.share.dto.auth.request.RegisterRequest;
import com.iris_chat.irischat_backend.share.dto.auth.response.LoginResponse;
import com.iris_chat.irischat_backend.share.service.AuthService;
import lombok.AllArgsConstructor;
import java.util.regex.Pattern;

@Service
@AllArgsConstructor
public class AuthServiceImpl implements AuthService {

    private AuthRepository authRepository;
    private PasswordEncoder passwordEncoder;
    private JwtProvider JwtProvider;

    @Override
    public LoginResponse login(LoginRequest request) {

        AccountCollection account = authRepository.findByPhoneNumber(request.getPhoneNumber())
                .orElseThrow(() -> new RuntimeException("Phone number not found"));

        if (!passwordEncoder.matches(request.getPassword(), account.getPassword())) {
            throw new RuntimeException("Invalid password");
        }

        LoginResponse.UserInfo userInfo = new LoginResponse.UserInfo(
                account.getId(),
                account.getUsernameClean(),
                account.getDisplayName(),
                account.getAvatarUrl());

        return LoginResponse.builder()
                .accessToken(JwtProvider.generateToken(account))
                .refreshToken("dummy-refresh-token")
                .userInfo(userInfo)
                .build();
    }

    @Override
    public String register(RegisterRequest request) {
        if (authRepository.existsByPhoneNumber(request.getPhoneNumber())) {
            throw new RuntimeException("Phone number already exists");
        }

        String cleanName = removeDiacritics(request.getDisplayName());
        // Ensure uniqueness (add random suffix if name exists)
        if (authRepository.existsByUsernameClean(cleanName)) {
            cleanName = cleanName + "-" + System.currentTimeMillis() % 1000;
        }

        // 2. Xử lý avatar default ở đây
        String avatar = (request.getAvatarUrl() != null && !request.getAvatarUrl().isEmpty())
                ? request.getAvatarUrl()
                : "https://i.pravatar.cc/150?u=" + request.getPhoneNumber();

        AccountCollection newAccount = new AccountCollection();
        newAccount.setPhoneNumber(request.getPhoneNumber());
        newAccount.setDisplayName(request.getDisplayName());
        newAccount.setAvatarUrl(avatar);
        newAccount.setUsernameClean(cleanName);
        newAccount.setPassword(passwordEncoder.encode(request.getPassword())); // BCRYPT!

        authRepository.save(newAccount);

        return "Registration successful";
    }

    private String removeDiacritics(String str) {
        if (str == null)
            return null;
        String temp = str.trim().toLowerCase();
        temp = temp.replace('đ', 'd');
        temp = Normalizer.normalize(temp, Normalizer.Form.NFD);
        Pattern pattern = Pattern.compile("\\p{M}+");
        temp = pattern.matcher(temp).replaceAll("");
        return temp.replaceAll("\\s+", "-"); // Replace spaces with dashes
    }
}

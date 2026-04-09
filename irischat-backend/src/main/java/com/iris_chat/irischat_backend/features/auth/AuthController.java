package com.iris_chat.irischat_backend.features.auth;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.iris_chat.irischat_backend.share.dto.auth.request.LoginRequest;
import com.iris_chat.irischat_backend.share.dto.auth.response.LoginResponse;
import com.iris_chat.irischat_backend.share.service.AuthService;

import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;


@RestController
@RequestMapping("/api/auth")
@AllArgsConstructor
public class AuthController {
    private final AuthService authService;
    
    @PostMapping("/login")
    public LoginResponse login(LoginRequest request) {

        LoginResponse response = authService.login(request);
        return response;
    }
    
}

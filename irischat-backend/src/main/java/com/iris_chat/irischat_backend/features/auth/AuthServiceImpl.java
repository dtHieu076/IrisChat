package com.iris_chat.irischat_backend.features.auth;

import org.springframework.stereotype.Service;

import com.iris_chat.irischat_backend.share.dto.auth.request.LoginRequest;
import com.iris_chat.irischat_backend.share.dto.auth.response.LoginResponse;
import com.iris_chat.irischat_backend.share.service.AuthService;

@Service
public class AuthServiceImpl implements AuthService {
    
    @Override
    public LoginResponse login(LoginRequest request) {
        // Implementation for login logic
        return new LoginResponse();
    }

}

package com.iris_chat.irischat_backend.share.service;

import com.iris_chat.irischat_backend.share.dto.auth.request.LoginRequest;
import com.iris_chat.irischat_backend.share.dto.auth.response.LoginResponse;

public interface AuthService {
    LoginResponse login(LoginRequest request);
}

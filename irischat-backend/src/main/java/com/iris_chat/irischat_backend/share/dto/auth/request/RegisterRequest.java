package com.iris_chat.irischat_backend.share.dto.auth.request;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RegisterRequest {
    private String phoneNumber;
    private String password;
    private String displayName;
    private String avatarUrl;
}

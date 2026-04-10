package com.iris_chat.irischat_backend.share.dto.auth.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class LoginResponse {

    private String accessToken;
    private String refreshToken;
    private UserInfo userInfo;

    @Data
    @AllArgsConstructor
    public static class UserInfo {
        private String id;
        private String usernameClean;
        private String displayName;
        private String avatarUrl;
    }
}

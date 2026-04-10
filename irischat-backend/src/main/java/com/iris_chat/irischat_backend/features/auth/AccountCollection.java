package com.iris_chat.irischat_backend.features.auth;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.index.Indexed;
import org.springframework.data.mongodb.core.mapping.Document;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Document(collection = "accounts")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class AccountCollection {
    @Id
    private String id; // MongoDB will automatically generate a unique HexString/UUID here

    @Indexed(unique = true) // Ensures no two people have the same phone
    private String phoneNumber;

    @Indexed(unique = true)
    private String usernameClean;

    private String displayName;
    private String password;
    private String avatarUrl;
}

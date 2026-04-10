package com.iris_chat.irischat_backend.features.auth;

import java.util.Optional;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AuthRepository extends MongoRepository<AccountCollection, String> { // Use MongoRepository

    Boolean existsByPhoneNumber(String phoneNumber);

    Boolean existsByUsernameClean(String usernameClean);

    Optional<AccountCollection> findByPhoneNumber(String phoneNumber);
}
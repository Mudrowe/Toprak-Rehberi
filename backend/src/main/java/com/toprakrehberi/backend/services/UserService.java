package com.toprakrehberi.backend.services;

import com.toprakrehberi.backend.models.User;
import com.toprakrehberi.backend.repositories.UserRepository;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public User getUserById(long id) {
        return userRepository.findById(id).orElse(null);
    }

    public User getUserByEmail(String email) {
        return userRepository.findByEmail(email).orElse(null);
    }

    public User updateUserField(String fieldName, String newValue) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        User user = (User) authentication.getPrincipal();

        System.out.println("Field Name: " + fieldName);
        System.out.println("New Value: " + newValue);

        switch (fieldName) {
            case "firstName":
                user.setFirstName(newValue);
                break;
            case "lastName":
                user.setLastName(newValue);
                break;
            case "phoneNumber":
                user.setPhoneNumber(newValue);
                break;
            default:
                throw new IllegalArgumentException("Invalid field name");
        }

        return userRepository.save(user);
    }


}

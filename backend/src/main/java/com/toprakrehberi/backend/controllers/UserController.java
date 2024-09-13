package com.toprakrehberi.backend.controllers;

import com.toprakrehberi.backend.auth.RegisterRequest;
import com.toprakrehberi.backend.dtos.UserDTO;
import com.toprakrehberi.backend.models.User;
import com.toprakrehberi.backend.services.UserService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/user")
public class UserController {

    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    private UserDTO convertToDTO(User user) {
        return new UserDTO(
                user.getId(),
                user.getFirstName(),
                user.getLastName(),
                user.getEmail(),
                user.getPhoneNumber()
        );
    }

    private User convertToEntity(RegisterRequest registerRequest) {
        User user = new User();
        user.setFirstName(registerRequest.getFirstName());
        user.setLastName(registerRequest.getLastName());
        user.setEmail(registerRequest.getEmail());
        user.setPhoneNumber(registerRequest.getPhoneNumber());
        return user;
    }

    @GetMapping
    public ResponseEntity<List<UserDTO>> getAllUsers() {
        List<User> users = userService.getAllUsers();
        List<UserDTO> userDTOs = users.stream()
                .map(this::convertToDTO)
                .collect(Collectors.toList());
        return ResponseEntity.ok(userDTOs);
    }

    @GetMapping("/{id}")
    public ResponseEntity<UserDTO> getUserById(@PathVariable("id") long id) {
        User user = userService.getUserById(id);
        if (user != null) {
            return ResponseEntity.ok(convertToDTO(user));
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }
    }

    @PostMapping("/register")
    public ResponseEntity<UserDTO> registerUser(@RequestBody RegisterRequest registerRequest) {
        System.out.println("Received UserDTO: " + registerRequest.toString());

        User user = convertToEntity(registerRequest);
        User savedUser = userService.saveUser(user);
        UserDTO savedUserDTO = convertToDTO(savedUser);
        System.out.println("Saved UserDTO: " + savedUserDTO);

        return ResponseEntity.status(HttpStatus.CREATED).body(savedUserDTO);
    }

    @GetMapping("/byEmail/{email}")
    public ResponseEntity<UserDTO> getUserByEmail(@PathVariable String email) {
        User user = userService.getUserByEmail(email);
        System.out.println(user.toString());
        if (user != null) {
            return ResponseEntity.ok(convertToDTO(user));
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }
    }

    @GetMapping("/me")
    public UserDTO getCurrentUser() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = (String) authentication.getPrincipal();

        // Fetch the user details using the username or user ID
        User user = userService.getUserByEmail(username);

        return convertToDTO(user);
    }

}

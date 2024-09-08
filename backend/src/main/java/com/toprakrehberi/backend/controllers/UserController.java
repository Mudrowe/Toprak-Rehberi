package com.toprakrehberi.backend.controllers;

import com.toprakrehberi.backend.auth.RegisterRequest;
import com.toprakrehberi.backend.dtos.UserDTO;
import com.toprakrehberi.backend.models.User;
import com.toprakrehberi.backend.models.Land;
import com.toprakrehberi.backend.repositories.UserRepository;
import com.toprakrehberi.backend.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/v1/user")
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping
    public ResponseEntity<List<UserDTO>> getAllUsers() {
        List<User> users = userService.getAllUsers();
        List<UserDTO> userDTOs = users.stream()
                .map(this::convertToDTO)
                .collect(Collectors.toList());
        return new ResponseEntity<>(userDTOs, HttpStatus.OK);
    }

    @GetMapping("/{id}")
    public ResponseEntity<UserDTO> getUserById(@PathVariable("id") long id) {
        User user = userService.getUserById(id);
        if (user != null) {
            return new ResponseEntity<>(convertToDTO(user), HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    private UserDTO convertToDTO(User user) {
        /* Convert lands to their IDs
        Set<Long> landIds = user.getLands().stream()
                .map(Land::getId)
                .collect(Collectors.toSet());
         */

        return new UserDTO(
                user.getId(),
                user.getFirstName(),
                user.getLastName(),
                user.getEmail(),
                user.getPhoneNumber(),
                //landIds,
                user.getPassword()
        );
    }

    private User convertToEntity2(UserDTO userDTO) {
        User user = new User();
        user.setFirstName(userDTO.getFirstName());
        user.setLastName(userDTO.getLastName());
        user.setEmail(userDTO.getEmail());
        user.setPhoneNumber(userDTO.getPhoneNumber());
        user.setPassword(userDTO.getPassword());

        return user;
    }

    @PostMapping()
    public ResponseEntity<UserDTO> createUser(@RequestBody UserDTO userDTO) {
        System.out.println("Received UserDTO: " + userDTO.toString());

        User user = convertToEntity2(userDTO);
        User savedUser = userService.saveUser(user);

        UserDTO savedUserDTO = convertToDTO(savedUser);

        System.out.println("Saved UserDTO: " + savedUserDTO);

        return new ResponseEntity<>(savedUserDTO, HttpStatus.CREATED);
    }

    private User convertToEntity(RegisterRequest registerRequest) {
        User user = new User();
        user.setFirstName(registerRequest.getFirstName());
        user.setLastName(registerRequest.getLastName());
        user.setEmail(registerRequest.getEmail());
        user.setPhoneNumber(registerRequest.getPhoneNumber());
        user.setPassword(registerRequest.getPassword());
        return user;
    }

    @PostMapping("/register")
    public ResponseEntity<UserDTO> registerUser(@RequestBody RegisterRequest registerRequest) {
        System.out.println("Received UserDTO: " + registerRequest.toString());

        User user = convertToEntity(registerRequest);
        User savedUser = userService.saveUser(user);
        UserDTO savedUserDTO = convertToDTO(savedUser);
        System.out.println("Saved UserDTO: " + savedUserDTO);

        return new ResponseEntity<>(savedUserDTO, HttpStatus.CREATED);
    }
}

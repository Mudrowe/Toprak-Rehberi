package com.toprakrehberi.backend.controllers;

import com.toprakrehberi.backend.auth.RegisterRequest;
import com.toprakrehberi.backend.dtos.LandDTO;
import com.toprakrehberi.backend.dtos.UserDTO;
import com.toprakrehberi.backend.models.Land;
import com.toprakrehberi.backend.models.User;
import com.toprakrehberi.backend.services.LandService;
import com.toprakrehberi.backend.services.UserService;
import com.toprakrehberi.backend.utils.ConverterUtil;
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
    private final LandService landService;

    public UserController(UserService userService, LandService landService) {
        this.userService = userService;
        this.landService = landService;
    }


    @GetMapping("/{id}")
    public ResponseEntity<UserDTO> getUserById(@PathVariable("id") long id) {
        User user = userService.getUserById(id);
        if (user != null) {
            return ResponseEntity.ok(ConverterUtil.convertToUserDTO(user));
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }
    }

    @GetMapping("/byEmail/{email}")
    public ResponseEntity<UserDTO> getUserByEmail(@PathVariable String email) {
        User user = userService.getUserByEmail(email);
        System.out.println("Get User By Email: " + user.toString());

        return ResponseEntity.ok(ConverterUtil.convertToUserDTO(user));
    }

    @GetMapping("/me")
    public ResponseEntity<UserDTO> getCurrentUser() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        User user = (User) authentication.getPrincipal();

        return ResponseEntity.ok(ConverterUtil.convertToUserDTO(user));
    }

    @GetMapping("/user/{userId}/lands")
    public ResponseEntity<List<LandDTO>> getLandsByUserId(@PathVariable long userId) {
        List<Land> lands = landService.getLandsByUserId(userId);
        List<LandDTO> landDTOs = lands.stream()
                .map(ConverterUtil::convertToLandDTO)
                .collect(Collectors.toList());
        return ResponseEntity.ok(landDTOs);
    }

}

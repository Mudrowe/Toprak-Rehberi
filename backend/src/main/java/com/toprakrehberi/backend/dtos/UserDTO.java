package com.toprakrehberi.backend.dtos;

// ! PASSWORD WILL BE REMOVED

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class UserDTO {

    private long id;
    private String firstName;
    private String lastName;
    private String email;
    private String phoneNumber;
    //private Set<Long> landIds; // Reference to land IDs
    private String password;
}
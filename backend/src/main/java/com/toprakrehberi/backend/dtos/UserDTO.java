package com.toprakrehberi.backend.dtos;

import java.util.Set;

// ! PASSWORD WILL BE REMOVED

public class UserDTO {

    private long id;
    private String firstName;
    private String lastName;
    private String email;
    private String phoneNumber;
    private Set<Long> landIds; // Reference to land IDs
    private String password;

    // Constructors
    public UserDTO() {}

    public UserDTO(long id, String firstName, String lastName, String email, String phoneNumber, Set<Long> landIds, String password) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.landIds = landIds;
        this.password = password;
    }

    // Getters and setters
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public Set<Long> getLandIds() {
        return landIds;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setLandIds(Set<Long> landIds) {
        this.landIds = landIds;
    }
}

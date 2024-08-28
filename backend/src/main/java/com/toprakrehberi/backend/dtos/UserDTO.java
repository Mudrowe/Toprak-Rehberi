package com.toprakrehberi.backend.dto;

import java.util.Set;

public class UserDTO {

    private long id;
    private String firstName;
    private String lastName;
    private String email;
    private String phoneNumber;
    private Set<Long> landIds; // Reference to land IDs

    // Constructors
    public UserDTO() {}

    public UserDTO(long id, String firstName, String lastName, String email, String phoneNumber, Set<Long> landIds) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.landIds = landIds;
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

    public void setLandIds(Set<Long> landIds) {
        this.landIds = landIds;
    }
}

package com.toprakrehberi.backend.models;

import jakarta.persistence.*;

@Entity
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(length = 64)
    private String firstName;

    @Column(length = 64)
    private String lastName;

    @Column
    private String password;

    @Column(unique = true, length = 160)
    private String email;

    @Column(unique = true, length = 15)
    private String phoneNumber;
}

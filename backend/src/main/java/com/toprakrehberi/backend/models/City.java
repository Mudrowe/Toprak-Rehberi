package com.toprakrehberi.backend.models;

import jakarta.persistence.*;

import java.util.List;

@Entity
@Table(name = "Cities")
public class City {
    @Id
    @GeneratedValue()
    private byte id;

    @Column(name = "name")
    private String name;

    // One city can have many districts
    @OneToMany(mappedBy = "city")
    private List<District> districts;

    public byte id() {
        return id;
    }

    public String name() {
        return name;
    }

    public List<District> getDistricts() {
        return districts;
    }
}

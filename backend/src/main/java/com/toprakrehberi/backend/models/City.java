package com.toprakrehberi.backend.models;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;

import java.util.List;

@Entity
@Table(name = "city")
public class City {
    @Id
    @GeneratedValue()
    private byte id;

    @Column(name = "name")
    private String name;

    // One city can have many districts
    @OneToMany(mappedBy = "city", cascade = CascadeType.ALL)
    @JsonManagedReference
    private List<District> districts;

    public City() {
    }

    public byte getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public List<District> getDistricts() {
        return districts;
    }

}

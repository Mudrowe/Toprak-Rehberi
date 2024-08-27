package com.toprakrehberi.backend.models;

import jakarta.persistence.*;

import java.util.List;

@Entity
@Table(name = "Districts")
public class District {
    @Id
    @GeneratedValue
    private short id;

    @Column(nullable = false)
    private String name;

    // Many districts belong to one city
    @ManyToOne
    @JoinColumn(name = "city_id", nullable = false)
    private City city;

    // One district can have many neighborhoods
    @OneToMany(mappedBy = "district")
    private List<Neighborhood> neighborhoods;

    public District() {
    }

    public short getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public City getCity() {
        return city;
    }
}

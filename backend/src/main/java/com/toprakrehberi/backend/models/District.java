package com.toprakrehberi.backend.models;

import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.persistence.*;

import java.util.List;

@Entity
@Table(name = "district")
public class District {
    @Id
    @GeneratedValue
    private short district_id;

    @Column(nullable = false)
    private String name;

    // Many districts belong to one city
    @ManyToOne
    @JoinColumn(name = "city_id", nullable = false)
    @JsonBackReference
    private City city;

    // One district can have many neighborhoods
    @OneToMany(mappedBy = "district")
    private List<Neighborhood> neighborhoods;

    public District() {
    }

    public short getId() {
        return district_id;
    }

    public String getName() {
        return name;
    }

    public City getCity() {
        return city;
    }

    public List<Neighborhood> getNeighborhoods() {
        return neighborhoods;
    }
}

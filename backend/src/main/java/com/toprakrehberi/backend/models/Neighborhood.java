package com.toprakrehberi.backend.models;

import jakarta.persistence.*;

@Entity
@Table(name = "Neighborhoods")
public class Neighborhood {
    @Id
    @GeneratedValue
    private int id;

    @Column(nullable = false)
    private String name;

    // Many neighborhoods belong to one district
    @ManyToOne
    @JoinColumn(name = "district_id", nullable = false)
    private District district;

    public int id() {
        return id;
    }

    public String name() {
        return name;
    }

    public District district() {
        return district;
    }
}

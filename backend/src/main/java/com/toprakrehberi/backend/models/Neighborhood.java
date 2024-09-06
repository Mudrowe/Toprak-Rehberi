package com.toprakrehberi.backend.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "neighborhood")
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
}
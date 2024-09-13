package com.toprakrehberi.backend.models.location;

import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "district")
public class District {
    @Id
    @GeneratedValue
    private short id;

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

}

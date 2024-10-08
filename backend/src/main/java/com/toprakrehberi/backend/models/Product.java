package com.toprakrehberi.backend.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "product")
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(name = "planting_date", nullable = false)
    private LocalDate plantingDate;

    @Column(name = "harvest_date", nullable = false)
    private LocalDate harvestDate;

    @ManyToOne()
    @JoinColumn(name = "land_id", nullable = false)
    private Land land;

    @Column(name = "score")
    private double score;

    @ManyToOne()
    @JoinColumn(name = "product_option_id", nullable = false)
    private ProductOption productOption;

    @Column(name = "area")
    private double area;

    @Column(name = "is_harvested", nullable = false)
    private boolean isHarvested;
}

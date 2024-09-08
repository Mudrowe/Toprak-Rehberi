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

    @JoinColumn(name = "land_id", nullable = false)
    private long landId;

    @Column(name = "score")
    private double score;

    @Column(name = "product_option_id")
    private Long productOptionId;
}

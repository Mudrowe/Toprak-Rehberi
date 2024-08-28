package com.toprakrehberi.backend.models;

import jakarta.persistence.*;

import java.time.LocalDate;

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

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "land_id", nullable = false)
    private Land land;

    @Column(name = "score")
    private double score;

    @Column(name = "product_option_id")
    private Long productOptionId;

    public Product() {
    }

    public Product(long id, LocalDate plantingDate, LocalDate harvestDate, Land land, double score, Long productOptionId) {
        this.id = id;
        this.plantingDate = plantingDate;
        this.harvestDate = harvestDate;
        this.land = land;
        this.score = score;
        this.productOptionId = productOptionId;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public LocalDate getPlantingDate() {
        return plantingDate;
    }

    public void setPlantingDate(LocalDate plantingDate) {
        this.plantingDate = plantingDate;
    }

    public LocalDate getHarvestDate() {
        return harvestDate;
    }

    public void setHarvestDate(LocalDate harvestDate) {
        this.harvestDate = harvestDate;
    }

    public Land getLand() {
        return land;
    }

    public void setLand(Land land) {
        this.land = land;
    }

    public double getScore() {
        return score;
    }

    public void setScore(double score) {
        this.score = score;
    }

    public Long getProductOptionId() {
        return productOptionId;
    }

    public void setProductOptionId(Long productOptionId) {
        this.productOptionId = productOptionId;
    }
}

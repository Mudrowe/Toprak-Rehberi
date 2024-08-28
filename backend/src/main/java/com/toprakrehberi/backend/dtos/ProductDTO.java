package com.toprakrehberi.backend.dtos;

import java.time.LocalDate;

public class ProductDTO {

    private long id;
    private LocalDate plantingDate;
    private LocalDate harvestDate;
    private Long landId; // Reference to the land ID
    private double score;
    private Long productOptionId;

    // Constructors
    public ProductDTO() {}

    public ProductDTO(long id, LocalDate plantingDate, LocalDate harvestDate, Long landId, double score, Long productOptionId) {
        this.id = id;
        this.plantingDate = plantingDate;
        this.harvestDate = harvestDate;
        this.landId = landId;
        this.score = score;
        this.productOptionId = productOptionId;
    }

    // Getters and setters
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

    public Long getLandId() {
        return landId;
    }

    public void setLandId(Long landId) {
        this.landId = landId;
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

package com.toprakrehberi.backend.dtos;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ProductDTO {

    private long id;
    private LocalDate plantingDate;
    private LocalDate harvestDate;
    private LandDTO land;
    private double score;
    private ProductOptionDTO productOption;
    private double area;
    private boolean isHarvested;
}

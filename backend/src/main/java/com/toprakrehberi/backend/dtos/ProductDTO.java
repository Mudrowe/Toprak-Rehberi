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
    private Long landId;
    private double score;
    private Long productOptionId;
    private double area;
    private boolean isHarvested;
}

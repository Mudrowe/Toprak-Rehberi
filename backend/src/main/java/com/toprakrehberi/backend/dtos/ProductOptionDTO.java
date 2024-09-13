package com.toprakrehberi.backend.dtos;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ProductOptionDTO {

    private Long id;
    private String name;
    private int plantingDuration;
    private String imageUrl;
}

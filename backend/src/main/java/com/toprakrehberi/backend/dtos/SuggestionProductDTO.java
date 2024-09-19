package com.toprakrehberi.backend.dtos;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class SuggestionProductDTO {

    private String name;
    private double score;
    private Long productOptionId;

}

package com.toprakrehberi.backend.dtos;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class LandDTO {

    private Long id;
    private Long userId;
    private String name;
    private Long neighborhoodId;
    private String parcelNo;
    private String adaNo;
    private double area;
    private int landTypeId;
}

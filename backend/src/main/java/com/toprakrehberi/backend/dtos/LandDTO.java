package com.toprakrehberi.backend.dtos;

import com.toprakrehberi.backend.models.Land;
import com.toprakrehberi.backend.models.LandType;
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
    private Long userId; // Reference to the user ID
    private String name;
    private Long neighborhoodId; // Reference to the neighborhood ID
    private String parcelNo;
    private String adaNo;
    private double size;
    private int landTypeId;
}

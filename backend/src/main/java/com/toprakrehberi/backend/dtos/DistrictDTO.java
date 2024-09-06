package com.toprakrehberi.backend.dtos;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class DistrictDTO {

    private short id;
    private String name;
    private int cityId; // Reference to the city ID
    private List<Integer> neighborhoodIds; // List of neighborhood IDs
}

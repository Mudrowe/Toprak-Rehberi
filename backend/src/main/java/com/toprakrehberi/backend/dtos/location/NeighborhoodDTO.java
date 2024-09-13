package com.toprakrehberi.backend.dtos.location;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class NeighborhoodDTO {

    private int id;
    private String name;
    private int districtId;

    public NeighborhoodDTO(int id, String name) {
        this.id = id;
        this.name = name;
    }
}

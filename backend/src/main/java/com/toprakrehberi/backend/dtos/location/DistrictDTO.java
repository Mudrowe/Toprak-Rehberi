package com.toprakrehberi.backend.dtos.location;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class DistrictDTO {

    private short id;
    private String name;
    private int cityId;
}

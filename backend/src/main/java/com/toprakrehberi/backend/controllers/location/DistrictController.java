package com.toprakrehberi.backend.controllers.location;

import com.toprakrehberi.backend.dtos.location.DistrictDTO;
import com.toprakrehberi.backend.dtos.location.NeighborhoodDTO;
import com.toprakrehberi.backend.models.location.District;
import com.toprakrehberi.backend.models.location.Neighborhood;
import com.toprakrehberi.backend.services.location.DistrictService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/districts")
public class DistrictController {

    private final DistrictService districtService;

    public DistrictController(DistrictService districtService) {
        this.districtService = districtService;
    }

    private DistrictDTO convertToDTO(District district) {
        List<Integer> neighborhoodIds = district.getNeighborhoods().stream()
                .map(Neighborhood::getId)
                .collect(Collectors.toList());

        return new DistrictDTO(
                district.getId(),
                district.getName(),
                district.getCity().getId(),
                neighborhoodIds
        );
    }

    private NeighborhoodDTO convertNeighborhoodToDTO(Neighborhood neighborhood) {
        return new NeighborhoodDTO(
                neighborhood.getId(),
                neighborhood.getName(),
                neighborhood.getDistrict().getId()
        );
    }

    @GetMapping
    public ResponseEntity<List<DistrictDTO>> getAllDistricts() {
        List<District> districts = districtService.getAllDistricts();
        List<DistrictDTO> districtDTOs = districts.stream()
                .map(this::convertToDTO)
                .collect(Collectors.toList());
        return ResponseEntity.ok(districtDTOs);
    }

    @GetMapping("/{id}")
    public ResponseEntity<DistrictDTO> getDistrictById(@PathVariable("id") short id) {
        District district = districtService.getDistrictByID(id);
        if (district != null) {
            return ResponseEntity.ok(convertToDTO(district));
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }
    }

    @GetMapping("/byCity/{cityId}")
    public ResponseEntity<List<DistrictDTO>> getDistrictsByCityId(@PathVariable("cityId") int cityId) {
        List<District> districts = districtService.getDistrictsByCityId(cityId);
        List<DistrictDTO> districtDTOs = districts.stream()
                .map(this::convertToDTO)
                .collect(Collectors.toList());
        return ResponseEntity.ok(districtDTOs);
    }


}

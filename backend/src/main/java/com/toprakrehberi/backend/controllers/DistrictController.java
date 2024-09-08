package com.toprakrehberi.backend.controllers;

import com.toprakrehberi.backend.dtos.DistrictDTO;
import com.toprakrehberi.backend.dtos.NeighborhoodDTO;
import com.toprakrehberi.backend.models.District;
import com.toprakrehberi.backend.models.Neighborhood;
import com.toprakrehberi.backend.services.DistrictService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/districts")
public class DistrictController {

    @Autowired
    private DistrictService districtService;

    @GetMapping
    public ResponseEntity<List<DistrictDTO>> getAllDistricts() {
        List<District> districts = districtService.getAllDistricts();
        List<DistrictDTO> districtDTOs = districts.stream()
                .map(this::convertToDTO)
                .collect(Collectors.toList());
        return new ResponseEntity<>(districtDTOs, HttpStatus.OK);
    }

    @GetMapping("/{id}")
    public ResponseEntity<DistrictDTO> getDistrictById(@PathVariable("id") short id) {
        District district = districtService.getDistrictByID(id);
        if (district != null) {
            return new ResponseEntity<>(convertToDTO(district), HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }


    @GetMapping("/byCity/{cityId}")
    public ResponseEntity<List<DistrictDTO>> getDistrictsByCityId(@PathVariable("cityId") int cityId) {
        List<District> districts = districtService.getDistrictsByCityId(cityId);
        List<DistrictDTO> districtDTOs = districts.stream()
                .map(this::convertToDTO)
                .collect(Collectors.toList());
        return new ResponseEntity<>(districtDTOs, HttpStatus.OK);
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
}

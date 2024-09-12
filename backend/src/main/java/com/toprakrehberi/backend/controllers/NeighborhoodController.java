package com.toprakrehberi.backend.controllers;

import com.toprakrehberi.backend.dtos.NeighborhoodDTO;
import com.toprakrehberi.backend.models.Neighborhood;
import com.toprakrehberi.backend.services.NeighborhoodService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/neighborhoods")
public class NeighborhoodController {

    private final NeighborhoodService neighborhoodService;

    public NeighborhoodController(NeighborhoodService neighborhoodService) {
        this.neighborhoodService = neighborhoodService;
    }

    @GetMapping
    public ResponseEntity<List<NeighborhoodDTO>> getAllNeighborhoods() {
        List<Neighborhood> neighborhoods = neighborhoodService.getAllNeighborhoods();
        List<NeighborhoodDTO> neighborhoodDTOs = neighborhoods.stream()
                .map(this::convertToDTO)
                .collect(Collectors.toList());
        return ResponseEntity.ok(neighborhoodDTOs);
    }

    @GetMapping("/{id}")
    public ResponseEntity<NeighborhoodDTO> getNeighborhoodById(@PathVariable("id") int id) {
        Neighborhood neighborhood = neighborhoodService.getNeighborhoodById(id);
        if (neighborhood != null) {
            return new ResponseEntity<>(convertToDTO(neighborhood), HttpStatus.OK);
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }
    }

    @GetMapping("/byDistrict/{districtId}")
    public ResponseEntity<List<NeighborhoodDTO>> getNeighborhoodsByDistrictId(@PathVariable("districtId") int districtId) {
        List<Neighborhood> neighborhoods = neighborhoodService.getNeighborhoodsByDistrictId(districtId);
        List<NeighborhoodDTO> neighborhoodDTOs = neighborhoods.stream()
                .map(this::convertToDTO)
                .collect(Collectors.toList());
        return ResponseEntity.ok(neighborhoodDTOs);
    }

    private NeighborhoodDTO convertToDTO(Neighborhood neighborhood) {
        return new NeighborhoodDTO(
                neighborhood.getId(),
                neighborhood.getName(),
                neighborhood.getDistrict().getId()
        );
    }
}

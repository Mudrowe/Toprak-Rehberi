package com.toprakrehberi.backend.controllers;

import com.toprakrehberi.backend.dtos.CityDTO;
import com.toprakrehberi.backend.models.City;
import com.toprakrehberi.backend.services.CityService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/cities")
public class CityController {

    private final CityService cityService;

    public CityController(CityService cityService) {
        this.cityService = cityService;
    }

    @GetMapping
    public ResponseEntity<List<CityDTO>> getAllCities() {
        List<City> cities = cityService.getAllCities();
        List<CityDTO> cityDTOs = cities.stream()
                .map(this::convertToDTO)
                .collect(Collectors.toList());
        return new ResponseEntity<>(cityDTOs, HttpStatus.OK);
    }

    private CityDTO convertToDTO(City city) {
        return new CityDTO(city.getId(), city.getName());
    }
}

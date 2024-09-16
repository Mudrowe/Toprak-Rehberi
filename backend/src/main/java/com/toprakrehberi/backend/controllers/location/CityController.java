package com.toprakrehberi.backend.controllers.location;

import com.toprakrehberi.backend.dtos.location.CityDTO;
import com.toprakrehberi.backend.models.location.City;
import com.toprakrehberi.backend.services.location.CityService;
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

    private CityDTO convertToDTO(City city) {
        return new CityDTO(city.getId(), city.getName());
    }

    @GetMapping
    public ResponseEntity<List<CityDTO>> getAllCities() {
        List<City> cities = cityService.getAllCities();
        List<CityDTO> cityDTOs = cities.stream()
                .map(this::convertToDTO)
                .collect(Collectors.toList());
        return ResponseEntity.ok(cityDTOs);
    }

    @GetMapping("/{id}")
    public ResponseEntity<CityDTO> getCityById(@PathVariable byte id) {
        City city = cityService.getCityById(id);
        if (city != null) {
            return ResponseEntity.ok(convertToDTO(city));
        } else {
            return ResponseEntity.notFound().build();
        }

    }

}

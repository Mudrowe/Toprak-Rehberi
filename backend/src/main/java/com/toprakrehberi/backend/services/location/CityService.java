package com.toprakrehberi.backend.services.location;

import com.toprakrehberi.backend.models.location.City;
import com.toprakrehberi.backend.repositories.location.CityRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CityService {

    private final CityRepository cityRepository;

    public CityService(CityRepository cityRepository) {
        this.cityRepository = cityRepository;
    }

    public List<City> getAllCities() {
        return cityRepository.findAll();
    }

    public City getCityById(byte id) {
        return cityRepository.findById(id).orElse(null);
    }

}

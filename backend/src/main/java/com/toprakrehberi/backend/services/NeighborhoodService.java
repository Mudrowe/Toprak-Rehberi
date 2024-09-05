package com.toprakrehberi.backend.services;

import com.toprakrehberi.backend.models.Neighborhood;
import com.toprakrehberi.backend.repositories.NeighborhoodRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NeighborhoodService {
    @Autowired
    private NeighborhoodRepository neighborhoodRepository;

    public List<Neighborhood> getAllNeighborhoods() {
        return neighborhoodRepository.findAll();
    }

    public Neighborhood getNeighborhoodById(int id) {
        return neighborhoodRepository.findById(id).orElse(null);
    }


    public List<Neighborhood> getNeighborhoodsByDistrictId(int districtId) {
        return neighborhoodRepository.findByDistrictId(districtId);
    }
}

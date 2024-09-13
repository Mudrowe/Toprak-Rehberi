package com.toprakrehberi.backend.services.location;

import com.toprakrehberi.backend.models.location.Neighborhood;
import com.toprakrehberi.backend.repositories.location.NeighborhoodRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NeighborhoodService {

    private final NeighborhoodRepository neighborhoodRepository;

    public NeighborhoodService(NeighborhoodRepository neighborhoodRepository) {
        this.neighborhoodRepository = neighborhoodRepository;
    }

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

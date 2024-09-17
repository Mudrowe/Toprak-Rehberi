package com.toprakrehberi.backend.services;

import com.toprakrehberi.backend.models.Land;
import com.toprakrehberi.backend.repositories.LandRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LandService {

    private final LandRepository landRepository;


    public LandService(LandRepository landRepository) {
        this.landRepository = landRepository;

    }

    public List<Land> getAllLands() {
        return landRepository.findAll();
    }

    public Land getLandById(long id) {
        return landRepository.findById(id).orElse(null);
    }

    public Land getLandByName(String name) {
        return landRepository.findByName(name);
    }

    public List<Land> getLandsByUserId(Long userId) {
        return landRepository.findByUserId(userId);
    }

    public Land saveLand(Land land) {
        return landRepository.save(land);
    }
}

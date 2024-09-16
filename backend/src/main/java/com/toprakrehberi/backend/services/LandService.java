package com.toprakrehberi.backend.services;

import com.toprakrehberi.backend.models.Land;
import com.toprakrehberi.backend.models.LandType;
import com.toprakrehberi.backend.repositories.LandRepository;
import com.toprakrehberi.backend.repositories.LandTypeRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class LandService {

    private final LandRepository landRepository;
    private final LandTypeRepository landTypeRepository;

    public LandService(LandRepository landRepository, LandTypeRepository landTypeRepository) {
        this.landRepository = landRepository;
        this.landTypeRepository = landTypeRepository;
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

    public List<Long> getLandIdsByUserId(long userId) {
        List<Land> lands = landRepository.findByUserId(userId);
        return lands.stream()
                .map(Land::getId)
                .collect(Collectors.toList());
    }

    public LandType getLandTypeById(int landTypeId) {
        return landTypeRepository.findById(landTypeId).orElse(null);
    }

    public Land saveLand(Land land) {
        return landRepository.save(land);
    }
}

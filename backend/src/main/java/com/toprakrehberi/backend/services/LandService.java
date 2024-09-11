package com.toprakrehberi.backend.services;

import com.toprakrehberi.backend.models.Land;
import com.toprakrehberi.backend.repositories.LandRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class LandService {
    @Autowired
    private LandRepository landRepository;

    public List<Land> getAllLands() { return landRepository.findAll(); }

    public Land getLandById(long id) { return landRepository.findById(id).orElse(null); }

    public Land getLandByName(String name) { return landRepository.findByName(name); }

    public Land saveLand(Land land) { return landRepository.save(land); }

    public List<Land> getLandsByUserId(Long userId) { return landRepository.findByUserId(userId); }

    public List<Long> getLandIdsByUserId(long userId) {
        List<Land> lands = landRepository.findByUserId(userId);
        return lands.stream()
                .map(Land::getId)
                .collect(Collectors.toList());
    }


}

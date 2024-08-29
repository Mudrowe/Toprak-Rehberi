package com.toprakrehberi.backend.services;

import com.toprakrehberi.backend.models.Land;
import com.toprakrehberi.backend.repositories.LandRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LandService {
    @Autowired
    private LandRepository landRepository;

    public List<Land> getAllLands() { return landRepository.findAll(); }

    public Land getLandById(long id) { return landRepository.findById(id).orElse(null); }
}

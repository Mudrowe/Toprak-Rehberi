package com.toprakrehberi.backend.services;

import com.toprakrehberi.backend.models.LandType;
import com.toprakrehberi.backend.repositories.LandTypeRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LandTypeService {

    private final LandTypeRepository landTypeRepository;

    public LandTypeService(LandTypeRepository landTypeRepository) {
        this.landTypeRepository = landTypeRepository;
    }

    public List<LandType> getAllLandTypes() {
        return landTypeRepository.findAll();
    }

    public LandType getLandTypeById(int id) {
        return landTypeRepository.findById(id).orElse(null);
    }
}

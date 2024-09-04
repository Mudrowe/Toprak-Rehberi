package com.toprakrehberi.backend.services;

import com.toprakrehberi.backend.models.LandType;
import com.toprakrehberi.backend.repositories.LandTypeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LandTypeService {

    @Autowired
    private LandTypeRepository landTypeRepository;

    public List<LandType> getAllLandTypes() {
        return landTypeRepository.findAll();
    }

    public LandType getLandTypeById(Long id) {
        return landTypeRepository.findById(id).orElse(null);
    }
}

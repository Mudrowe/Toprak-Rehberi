package com.toprakrehberi.backend.services;

import com.toprakrehberi.backend.models.District;
import com.toprakrehberi.backend.repositories.DistrictRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DistrictService {
    @Autowired
    private DistrictRepository districtRepository;

    public List<District> getAllDistricts() { return districtRepository.findAll(); }

    public District getDistrictByID(short id) { return districtRepository.findById(id).orElse(null); }
}

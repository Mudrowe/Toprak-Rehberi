package com.toprakrehberi.backend.services.location;

import com.toprakrehberi.backend.models.location.District;
import com.toprakrehberi.backend.repositories.location.DistrictRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DistrictService {

    private final DistrictRepository districtRepository;

    public DistrictService(DistrictRepository districtRepository) {
        this.districtRepository = districtRepository;
    }

    public List<District> getAllDistricts() {
        return districtRepository.findAll();
    }

    public District getDistrictByID(short id) {
        return districtRepository.findById(id).orElse(null);
    }

    public List<District> getDistrictsByCityId(int cityId) {
        return districtRepository.findByCityId(cityId);
    }
}

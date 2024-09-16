package com.toprakrehberi.backend.repositories.location;

import com.toprakrehberi.backend.models.location.District;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DistrictRepository extends JpaRepository<District, Short> {

    List<District> findByCityId(int cityId);
}

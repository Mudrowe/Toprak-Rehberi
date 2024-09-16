package com.toprakrehberi.backend.repositories.location;

import com.toprakrehberi.backend.models.location.Neighborhood;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface NeighborhoodRepository extends JpaRepository<Neighborhood, Integer> {

    List<Neighborhood> findByDistrictId(int districtId);
}

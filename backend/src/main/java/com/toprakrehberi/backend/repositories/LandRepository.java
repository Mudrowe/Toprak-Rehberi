package com.toprakrehberi.backend.repositories;

import com.toprakrehberi.backend.models.Land;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LandRepository extends JpaRepository<Land, Long> {

    List<Land> findByUserId(Long userId);
    Land findByName(String name);
    List<Land> findByNeighborhoodId(int neighborhood_id);
}

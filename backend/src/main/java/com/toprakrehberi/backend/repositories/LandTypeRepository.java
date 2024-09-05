package com.toprakrehberi.backend.repositories;

import com.toprakrehberi.backend.models.LandType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface LandTypeRepository extends JpaRepository<LandType, Integer> {
}

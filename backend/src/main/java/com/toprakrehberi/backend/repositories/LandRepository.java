package com.toprakrehberi.backend.repositories;

import com.toprakrehberi.backend.models.Land;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface LandRepository extends JpaRepository<Land, Long> {
}

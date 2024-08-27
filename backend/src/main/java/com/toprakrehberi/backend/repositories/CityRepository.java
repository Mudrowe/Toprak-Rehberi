package com.toprakrehberi.backend.repositories;

import com.toprakrehberi.backend.models.City;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CityRepository extends JpaRepository<City, Byte> {
}

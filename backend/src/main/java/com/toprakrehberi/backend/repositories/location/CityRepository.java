package com.toprakrehberi.backend.repositories.location;

import com.toprakrehberi.backend.models.location.City;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CityRepository extends JpaRepository<City, Byte> {
}

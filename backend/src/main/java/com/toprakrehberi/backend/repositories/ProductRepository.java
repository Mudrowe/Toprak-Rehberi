package com.toprakrehberi.backend.repositories;

import com.toprakrehberi.backend.models.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {

    List<Product> findByLandId(Long landId);
    List<Product> findByLand_UserId(long userId);
    List<Product> findByLandIdIn(List<Long> landIds);
}

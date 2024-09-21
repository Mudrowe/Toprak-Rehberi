package com.toprakrehberi.backend.repositories;

import com.toprakrehberi.backend.models.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {

    List<Product> findByLandId(Long landId);
    List<Product> findByLand_UserId(long userId);
    List<Product> findByLandIdIn(List<Long> landIds);

    @Query("SELECT AVG(p.score * 20) FROM Product p WHERE p.land.id IN :landIds AND p.productOption.id = :productOptionId AND p.isHarvested = true")
    Double calculateAverageScore(List<Long> landIds, Long productOptionId);
}

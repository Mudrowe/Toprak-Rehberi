package com.toprakrehberi.backend.repositories;

import com.toprakrehberi.backend.models.ProductOption;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductOptionRepository extends JpaRepository<ProductOption, Long> {
    ProductOption findByName(String name);
}

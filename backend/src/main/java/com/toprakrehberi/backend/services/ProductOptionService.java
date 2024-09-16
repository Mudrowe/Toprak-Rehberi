package com.toprakrehberi.backend.services;

import com.toprakrehberi.backend.models.ProductOption;
import com.toprakrehberi.backend.repositories.ProductOptionRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ProductOptionService {

    private final ProductOptionRepository productOptionRepository;

    public ProductOptionService(final ProductOptionRepository productOptionRepository) {
        this.productOptionRepository = productOptionRepository;
    }

    public List<ProductOption> getAllProductOptions() {
        return productOptionRepository.findAll();
    }

    public Optional<ProductOption> getProductOptionById(Long id) {
        return productOptionRepository.findById(id);
    }

    public ProductOption getProductOptionByName(String name) {
        return productOptionRepository.findByName(name);
    }

    public ProductOption saveProductOption(ProductOption productOption) {
        return productOptionRepository.save(productOption);
    }

    public void deleteProductOption(Long id) {
        productOptionRepository.deleteById(id);
    }
}

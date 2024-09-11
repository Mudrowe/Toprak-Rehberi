package com.toprakrehberi.backend.controllers;

import com.toprakrehberi.backend.models.ProductOption;
import com.toprakrehberi.backend.services.ProductOptionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/product_option")
public class ProductOptionController {

    @Autowired
    private ProductOptionService productOptionService;

    @GetMapping
    public List<ProductOption> getAllProductOptions() {
        return productOptionService.getAllProductOptions();
    }

    @GetMapping("/byId/{id}")
    public ResponseEntity<ProductOption> getProductOptionById(@PathVariable Long id) {
        Optional<ProductOption> productOption = productOptionService.getProductOptionById(id);
        return productOption.map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @GetMapping("/name/{name}")
    public ResponseEntity<ProductOption> getProductOptionByName(@PathVariable String name) {
        ProductOption productOption = productOptionService.getProductOptionByName(name);
        return ResponseEntity.ok(productOption);
    }

    @PostMapping
    public ProductOption createProductOption(@RequestBody ProductOption productOption) {
        return productOptionService.saveProductOption(productOption);
    }

    @PutMapping("/{id}")
    public ResponseEntity<ProductOption> updateProductOption(@PathVariable Long id, @RequestBody ProductOption updatedProductOption) {
        Optional<ProductOption> existingProductOption = productOptionService.getProductOptionById(id);
        if (existingProductOption.isPresent()) {
            ProductOption productOption = existingProductOption.get();
            productOption.setName(updatedProductOption.getName());
            productOption.setPlantingDuration(updatedProductOption.getPlantingDuration());
            productOption.setImageUrl(updatedProductOption.getImageUrl());
            return ResponseEntity.ok(productOptionService.saveProductOption(productOption));
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteProductOption(@PathVariable Long id) {
        productOptionService.deleteProductOption(id);
        return ResponseEntity.noContent().build();
    }
}

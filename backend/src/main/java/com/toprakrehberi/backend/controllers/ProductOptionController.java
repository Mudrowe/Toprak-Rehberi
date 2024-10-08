package com.toprakrehberi.backend.controllers;

import com.toprakrehberi.backend.models.ProductOption;
import com.toprakrehberi.backend.services.ProductOptionService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/product_option")
public class ProductOptionController {

    private final ProductOptionService productOptionService;

    public ProductOptionController(final ProductOptionService productOptionService) {
        this.productOptionService = productOptionService;
    }

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
}

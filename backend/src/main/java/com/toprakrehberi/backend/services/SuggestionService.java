package com.toprakrehberi.backend.services;

import com.toprakrehberi.backend.dtos.SuggestionProductDTO;
import com.toprakrehberi.backend.models.Product;
import com.toprakrehberi.backend.models.ProductOption;
import com.toprakrehberi.backend.repositories.ProductOptionRepository;
import com.toprakrehberi.backend.repositories.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class SuggestionService {

    private final ProductRepository productRepository;
    private final ProductOptionRepository productOptionRepository;

    @Autowired
    public SuggestionService(ProductRepository productRepository, ProductOptionRepository productOptionRepository) {
        this.productRepository = productRepository;
        this.productOptionRepository = productOptionRepository;
    }

    public List<SuggestionProductDTO> getSuggestions(List<Long> neighboringLandIds) {
        // Get all products from the neighboring lands
        List<Product> neighboringProducts = productRepository.findByLandIdIn(neighboringLandIds);

        List<ProductOption> productOptions = productOptionRepository.findAll();

        List<SuggestionProductDTO> suggestions = new ArrayList<>();

        for (ProductOption option : productOptions) {
            // Calculate the average score for this product in neighboring lands
            double avgScore = calculateAverageScore(neighboringProducts, option.getId());

            suggestions.add(new SuggestionProductDTO(option.getName(), avgScore, option.getId()));
        }

        return suggestions;
    }

    private double calculateAverageScore(List<Product> products, Long productOptionId) {
        double totalScore = 80; // Default starting score
        int count = 1;

        for (Product product : products) {
            if (product.getProductOption().getId().equals(productOptionId) && product.isHarvested()) {
                // Scale score from 1-5 to 0-100
                double scaledScore = product.getScore() * 20;
                totalScore += scaledScore;
                count++;
            }
        }

        return totalScore / count;
    }
}

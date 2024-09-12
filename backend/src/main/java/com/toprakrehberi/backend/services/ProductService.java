package com.toprakrehberi.backend.services;

import com.toprakrehberi.backend.dtos.ProductDTO;
import com.toprakrehberi.backend.models.Product;
import com.toprakrehberi.backend.repositories.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class ProductService {
    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private LandService landService;

    private ProductDTO convertToDTO(Product product) {
        return new ProductDTO(
                product.getId(),
                product.getPlantingDate(),
                product.getHarvestDate(),
                product.getLandId(),
                product.getScore(),
                product.getProductOptionId(),
                product.getArea(),
                product.isHarvested()
        );
    }

    private Product convertToEntity(ProductDTO productDTO) {
        Product product = new Product();
        product.setId(productDTO.getId());
        product.setPlantingDate(productDTO.getPlantingDate());
        product.setHarvestDate(productDTO.getHarvestDate());
        product.setLandId(productDTO.getLandId());
        product.setScore(productDTO.getScore());
        product.setProductOptionId(productDTO.getProductOptionId());
        product.setArea(productDTO.getArea());
        product.setHarvested(productDTO.isHarvested());

        return product;
    }



    public List<Product> getAllProducts() { return productRepository.findAll(); }

    public Product getProductById(long id) { return productRepository.findById(id).orElse(null); }

    public List<ProductDTO> getProductsByLandId(long landId) {
        List<Product> products = productRepository.findByLandId(landId);
        return products.stream()
                .map(this::convertToDTO)
                .collect(Collectors.toList());
    }


    public List<ProductDTO> getProductsByUserId(long userId) {
        List<Long> landIds = landService.getLandIdsByUserId(userId);
        List<Product> products = productRepository.findByLandIdIn(landIds);
        return products.stream()
                .map(this::convertToDTO)
                .collect(Collectors.toList());
    }


    public List<ProductDTO> getPlantedProducts() {
        List<Product> products = productRepository.findByHarvestDateIsNull();
        return products.stream()
                .map(this::convertToDTO)
                .collect(Collectors.toList());
    }

    public List<ProductDTO> getHarvestedProducts() {
        List<Product> products = productRepository.findByHarvestDateIsNotNull();
        return products.stream()
                .map(this::convertToDTO)
                .collect(Collectors.toList());
    }


    public Product saveProduct(Product product) { return productRepository.save(product); }
}

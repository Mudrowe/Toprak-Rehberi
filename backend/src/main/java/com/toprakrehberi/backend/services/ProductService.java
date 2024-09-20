package com.toprakrehberi.backend.services;

import com.toprakrehberi.backend.dtos.ProductDTO;
import com.toprakrehberi.backend.models.Product;
import com.toprakrehberi.backend.repositories.ProductRepository;
import com.toprakrehberi.backend.utils.ConverterUtil;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class ProductService {

    private final ProductRepository productRepository;

    public ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    public List<Product> getAllProducts() {
        return productRepository.findAll();
    }

    public Product getProductById(long id) {
        return productRepository.findById(id).orElse(null);
    }

    public List<Product> getProductsByLandId(long landId) {
        return productRepository.findByLandId(landId);
    }

    public List<Product> getProductsByUserId(long userId) {
        return productRepository.findByLand_UserId(userId);
    }

    public Product saveProduct(Product product) {
        return productRepository.save(product);
    }

    public List<ProductDTO> searchProducts(String query) {
        List<Product> products = productRepository.findAll();

        return products.stream()
                .filter(product -> product.getProductOption().getName().toLowerCase().contains(query.toLowerCase()))
                .map(ConverterUtil::convertToProductDTO)
                .collect(Collectors.toList());
    }
}

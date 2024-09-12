package com.toprakrehberi.backend.controllers;

import com.toprakrehberi.backend.dtos.ProductDTO;
import com.toprakrehberi.backend.models.Land;
import com.toprakrehberi.backend.models.Product;
import com.toprakrehberi.backend.services.LandService;
import com.toprakrehberi.backend.services.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/product")
public class ProductController {

    private final ProductService productService;
    private final LandService landService;

    public ProductController(ProductService productService, LandService landService) {
        this.productService = productService;
        this.landService = landService;
    }

    private ProductDTO convertToDTO(Product product) {
        return new ProductDTO(
                product.getId(),
                product.getPlantingDate(),
                product.getHarvestDate(),
                product.getLand().getId(),
                product.getScore(),
                product.getProductOptionId(),
                product.getArea(),
                product.isHarvested()
        );
    }

    private Product convertToEntity(ProductDTO productDTO) {
        Land land = landService.getLandById(productDTO.getLandId());
        return new Product(
                productDTO.getId(),
                productDTO.getPlantingDate(),
                productDTO.getHarvestDate(),
                land,
                productDTO.getScore(),
                productDTO.getProductOptionId(),
                productDTO.getArea(),
                productDTO.isHarvested()
        );
    }

    @GetMapping
    public ResponseEntity<List<ProductDTO>> getAllProducts() {
        List<Product> products = productService.getAllProducts();
        List<ProductDTO> productDTOs = products.stream()
                .map(this::convertToDTO)
                .collect(Collectors.toList());
        return new ResponseEntity<>(productDTOs, HttpStatus.OK);
    }

    @GetMapping("/{id}")
    public ResponseEntity<ProductDTO> getProductById(@PathVariable("id") long id) {
        Product product = productService.getProductById(id);
        if (product != null) {
            return new ResponseEntity<>(convertToDTO(product), HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @GetMapping("/byLand/{landId}")
    public ResponseEntity<List<ProductDTO>> getProductsByLandId(@PathVariable("landId") long landId) {
        List<ProductDTO> productDTOs = productService.getProductsByLandId(landId);
        if (productDTOs.isEmpty()) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(productDTOs, HttpStatus.OK);
    }

    @GetMapping("/byUserId/{userId}")
    public ResponseEntity<List<ProductDTO>> getProductsByUserId(@PathVariable("userId") long userId) {
        List<ProductDTO> productDTOs = productService.getProductsByUserId(userId);
        if (productDTOs.isEmpty()) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(productDTOs, HttpStatus.OK);
    }

    @PostMapping()
    public ResponseEntity<ProductDTO> createProduct(@RequestBody ProductDTO productDTO) {
        System.out.println("Received ProductDTO JSON: " + productDTO.toString());
        
        // Fetch the Land entity to validate landId
        Land land = landService.getLandById(productDTO.getLandId());
        if (land == null) {
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }

        Product product = convertToEntity(productDTO);
        Product savedProduct = productService.saveProduct(product);

        ProductDTO savedProductDTO = convertToDTO(savedProduct);

        System.out.println("Saved ProductDTO: " + savedProductDTO);

        return new ResponseEntity<>(savedProductDTO, HttpStatus.CREATED);
    }

}

package com.toprakrehberi.backend.controllers;

import com.toprakrehberi.backend.dtos.LandDTO;
import com.toprakrehberi.backend.dtos.LandTypeDTO;
import com.toprakrehberi.backend.dtos.ProductDTO;
import com.toprakrehberi.backend.dtos.ProductOptionDTO;
import com.toprakrehberi.backend.dtos.location.NeighborhoodDTO;
import com.toprakrehberi.backend.models.Land;
import com.toprakrehberi.backend.models.Product;
import com.toprakrehberi.backend.models.ProductOption;
import com.toprakrehberi.backend.services.LandService;
import com.toprakrehberi.backend.services.ProductOptionService;
import com.toprakrehberi.backend.services.ProductService;
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
    private final ProductOptionService productOptionService;

    public ProductController(ProductService productService, LandService landService, ProductOptionService productOptionService) {
        this.productService = productService;
        this.landService = landService;
        this.productOptionService = productOptionService;
    }

    private LandDTO convertLandToDTO(Land land) {
        return new LandDTO(
                land.getId(),
                land.getUser().getId(),
                land.getName(),
                new NeighborhoodDTO(land.getNeighborhood().getId(), land.getNeighborhood().getName()),
                land.getParcelNo(),
                land.getAdaNo(),
                land.getArea(),
                new LandTypeDTO(land.getLandType().getId(), land.getLandType().getName(), land.getLandType().getImageUrl())
        );
    }

    private ProductOptionDTO convertProductOptionToDTO(ProductOption productOption) {
        return new ProductOptionDTO(
                productOption.getId(),
                productOption.getName(),
                productOption.getPlantingDuration(),
                productOption.getImageUrl()
        );
    }

    private ProductDTO convertToDTO(Product product) {
        return new ProductDTO(
                product.getId(),
                product.getPlantingDate(),
                product.getHarvestDate(),
                convertLandToDTO(product.getLand()),
                product.getScore(),
                convertProductOptionToDTO(product.getProductOption()),
                product.getArea(),
                product.isHarvested()
        );
    }

    private Product convertToEntity(ProductDTO productDTO) {
        Land land = landService.getLandById(productDTO.getLand().getId());
        ProductOption productOption = productOptionService.getProductOptionById(productDTO.getProductOption().getId())
                .orElseThrow(() -> new IllegalArgumentException("ProductOption not found for ID: " + productDTO.getProductOption().getId()));

        return new Product(
                productDTO.getId(),
                productDTO.getPlantingDate(),
                productDTO.getHarvestDate(),
                land,
                productDTO.getScore(),
                productOption,
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
        return ResponseEntity.ok(productDTOs);
    }

    @GetMapping("/{id}")
    public ResponseEntity<ProductDTO> getProductById(@PathVariable("id") long id) {
        Product product = productService.getProductById(id);
        if (product != null) {
            return ResponseEntity.ok(convertToDTO(product));
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }
    }

    @GetMapping("/byLand/{landId}")
    public ResponseEntity<List<ProductDTO>> getProductsByLandId(@PathVariable("landId") long landId) {
        List<Product> products = productService.getProductsByLandId(landId);
        List<ProductDTO> productDTOs = products.stream()
                .map(this::convertToDTO)
                .collect(Collectors.toList());

        if (productDTOs.isEmpty()) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }
        return ResponseEntity.ok(productDTOs);
    }

    @GetMapping("/byUserId/{userId}")
    public ResponseEntity<List<ProductDTO>> getProductsByUserId(@PathVariable("userId") long userId) {
        List<Product> products = productService.getProductsByUserId(userId);
        List<ProductDTO> productDTOs = products.stream()
                .map(this::convertToDTO)
                .collect(Collectors.toList());

        if (productDTOs.isEmpty()) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }
        return ResponseEntity.ok(productDTOs);
    }


    @PostMapping()
    public ResponseEntity<ProductDTO> createProduct(@RequestBody ProductDTO productDTO) {
        System.out.println("Received ProductDTO JSON: " + productDTO.toString());

        Product product = convertToEntity(productDTO);
        Product savedProduct = productService.saveProduct(product);

        ProductDTO savedProductDTO = convertToDTO(savedProduct);

        System.out.println("Saved ProductDTO: " + savedProductDTO);

        return ResponseEntity.status(HttpStatus.CREATED).body(savedProductDTO);
    }
}

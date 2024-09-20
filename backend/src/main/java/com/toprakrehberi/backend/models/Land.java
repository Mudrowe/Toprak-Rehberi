package com.toprakrehberi.backend.models;

import com.toprakrehberi.backend.models.location.Neighborhood;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "land")
public class Land {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    // Many lands belong to one user
    @ManyToOne()
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @Column(name = "name", nullable = false)
    private String name;

    @ManyToOne()
    @JoinColumn(name = "neighborhood_id", nullable = false)
    private Neighborhood neighborhood;

    @Column(name = "parcel_no", nullable = false)
    private String parcelNo;

    @Column(name = "ada_no", nullable = false)
    private String adaNo;

    @Column(name = "area", nullable = false)
    private double area;

    @ManyToOne()
    @JoinColumn(name = "land_type_id", nullable = false)
    private LandType landType;

    @OneToMany(mappedBy = "land", cascade = CascadeType.ALL)
    private List<Product> products;

    public double getRemainingArea() {
        if (this.products == null || this.products.isEmpty()) {
            return area;
        }
        double totalOccupiedArea = products.stream()
                .filter(product -> !product.isHarvested())
                .mapToDouble(Product::getArea)
                .sum();
        return area - totalOccupiedArea;
    }


}
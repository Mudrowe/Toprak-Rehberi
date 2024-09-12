package com.toprakrehberi.backend.models;

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

    @JoinColumn(name = "user_id", nullable = false)
    private long userId;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "neighborhood_id", nullable = false)
    private Long neighborhoodId;

    @Column(name = "parcel_no", nullable = false)
    private String parcelNo;

    @Column(name = "ada_no", nullable = false)
    private String adaNo;

    @Column(name = "area", nullable = false)
    private double area;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "land_type_id", nullable = false)
    private LandType landType;

    @OneToMany(mappedBy = "land", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<Product> products;
}
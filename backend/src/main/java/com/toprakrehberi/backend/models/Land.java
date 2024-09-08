package com.toprakrehberi.backend.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

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

    @Column(name = "size", nullable = false)
    private double size;

    @JoinColumn(name = "land_type_id", nullable = false)
    private int landTypeId;
}
package com.toprakrehberi.backend.models;

import jakarta.persistence.*;

@Entity
@Table(name = "land")
public class Land {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "neighborhood", nullable = false)
    private Long neighborhoodId;

    @Column(name = "parcelNo", nullable = false)
    private String parcelNo;

    @Column(name = "adaNo", nullable = false)
    private String adaNo;

    @Column(name = "size", nullable = false)
    private double size;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "land_type_id", nullable = false)
    private LandType landType;

    public Land(Long id, User user, String name, Long neighborhoodId, String parcelNo, String adaNo, double size, LandType landType) {
        this.id = id;
        this.user = user;
        this.name = name;
        this.neighborhoodId = neighborhoodId;
        this.parcelNo = parcelNo;
        this.adaNo = adaNo;
        this.size = size;
        this.landType = landType;
    }

    public Land() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Long getNeighborhoodId() {
        return neighborhoodId;
    }

    public void setNeighborhoodId(Long neighborhoodId) {
        this.neighborhoodId = neighborhoodId;
    }

    public String getParcelNo() {
        return parcelNo;
    }

    public void setParcelNo(String parcelNo) {
        this.parcelNo = parcelNo;
    }

    public String getAdaNo() {
        return adaNo;
    }

    public void setAdaNo(String adaNo) {
        this.adaNo = adaNo;
    }

    public double getSize() {
        return size;
    }

    public void setSize(double size) {
        this.size = size;
    }

    public LandType getLandType() {
        return landType;
    }

    public void setLandType(LandType landType) {
        this.landType = landType;
    }
}

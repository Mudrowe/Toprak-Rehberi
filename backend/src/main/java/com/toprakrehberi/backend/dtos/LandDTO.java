package com.toprakrehberi.backend.dtos;

import com.toprakrehberi.backend.models.Land;
import com.toprakrehberi.backend.models.LandType;

public class LandDTO {

    private Long id;
    private Long userId; // Reference to the user ID
    private String name;
    private Long neighborhoodId; // Reference to the neighborhood ID
    private String parcelNo;
    private String adaNo;
    private double size;
    private LandType landType;

    // Constructors
    public LandDTO() {}

    public LandDTO(Long id, Long userId, String name, Long neighborhoodId, String parcelNo, String adaNo, double size, LandType landType) {
        this.id = id;
        this.userId = userId;
        this.name = name;
        this.neighborhoodId = neighborhoodId;
        this.parcelNo = parcelNo;
        this.adaNo = adaNo;
        this.size = size;
        this.landType = landType;
    }

    // Getters and setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
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

    public LandType getlandType() {
        return landType;
    }

    public void setLandTypeID(LandType landType) {
        this.landType = landType;
    }
}

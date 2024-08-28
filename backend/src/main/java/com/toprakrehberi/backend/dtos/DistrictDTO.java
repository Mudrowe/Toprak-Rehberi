package com.toprakrehberi.backend.dtos;

import java.util.List;

public class DistrictDTO {

    private short id;
    private String name;
    private int cityId; // Reference to the city ID
    private List<Integer> neighborhoodIds; // List of neighborhood IDs

    // Constructors
    public DistrictDTO() {}

    public DistrictDTO(short id, String name, int cityId, List<Integer> neighborhoodIds) {
        this.id = id;
        this.name = name;
        this.cityId = cityId;
        this.neighborhoodIds = neighborhoodIds;
    }

    // Getters and setters
    public short getId() {
        return id;
    }

    public void setId(short id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getCityId() {
        return cityId;
    }

    public void setCityId(int cityId) {
        this.cityId = cityId;
    }

    public List<Integer> getNeighborhoodIds() {
        return neighborhoodIds;
    }

    public void setNeighborhoodIds(List<Integer> neighborhoodIds) {
        this.neighborhoodIds = neighborhoodIds;
    }
}

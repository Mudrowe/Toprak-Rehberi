package com.toprakrehberi.backend.dtos;

public class NeighborhoodDTO {

    private int id;
    private String name;
    private int districtId; // Reference to the district ID

    // Constructors
    public NeighborhoodDTO() {}

    public NeighborhoodDTO(int id, String name, int districtId) {
        this.id = id;
        this.name = name;
        this.districtId = districtId;
    }

    // Getters and setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getDistrictId() {
        return districtId;
    }

    public void setDistrictId(int districtId) {
        this.districtId = districtId;
    }
}

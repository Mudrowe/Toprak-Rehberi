package com.toprakrehberi.backend.dtos;

public class CityDTO {

    private byte id;
    private String name;

    // Constructors
    public CityDTO() {}

    public CityDTO(byte id, String name) {
        this.id = id;
        this.name = name;
    }

    // Getters and setters
    public byte getId() {
        return id;
    }

    public void setId(byte id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}

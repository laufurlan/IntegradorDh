package com.grupo4.hotels.dto.City;

public class CreateCityDTO {
    private String title;

    public CreateCityDTO() {
    }

    public CreateCityDTO(String title) {
        this.title = title;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
}

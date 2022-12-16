package com.grupo4.hotels.dto.City;

public class UpdateCityDTO {
    private Integer id;
    private String title;

    public UpdateCityDTO() {
    }

    public UpdateCityDTO(Integer id_city, String title) {
        this.id = id_city;
        this.title = title;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
}

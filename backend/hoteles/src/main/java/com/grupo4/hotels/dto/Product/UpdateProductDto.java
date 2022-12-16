package com.grupo4.hotels.dto.Product;

import java.util.List;

public class UpdateProductDto {
    private Integer id;
    private String title;
    private String description;
    private String url_image;
    private Integer id_category;
    private Integer id_city;
    private List<String> images;

    public UpdateProductDto() {
    }

    public UpdateProductDto(Integer id, String title, String description, String url_image, Integer id_category, Integer id_city, List<String> images) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.url_image = url_image;
        this.id_category = id_category;
        this.id_city = id_city;
        this.images = images;
    }

    public Integer getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public String getDescription() {
        return description;
    }

    public String getUrl_image() {
        return url_image;
    }

    public Integer getId_category() {
        return id_category;
    }

    public Integer getId_city() {
        return id_city;
    }

    public List<String> getImages() {
        return images;
    }

}

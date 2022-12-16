package com.grupo4.hotels.dto.Product;

import java.util.List;

public class GetProductsCardsDto {

    private Integer id;
    private String title;
    private String description;
    private String url_image;
    private String category_name;
    private String city_name;
    private List<String> attributes;

    public GetProductsCardsDto() {
    }


    public GetProductsCardsDto(Integer id, String title, String description, String url_image, String category_name, String city_name, List<String> attributes) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.url_image = url_image;
        this.category_name = category_name;
        this.city_name = city_name;
        this.attributes = attributes;
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

    public String getCategory_name() {
        return category_name;
    }

    public String getCity_name() {
        return city_name;
    }

    public List<String> getAttributes() {
        return attributes;
    }
}

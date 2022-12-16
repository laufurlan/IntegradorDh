package com.grupo4.hotels.dto.Category;


import com.grupo4.hotels.dto.Product.GetProductCardDto;
import com.grupo4.hotels.model.Product;

import java.util.List;

public class GetCategoryDTO {
    private Integer id;
    private String title;
    private String url_image;
    private Integer quantity;
    private List<GetProductCardDto> products;

    public GetCategoryDTO() {
    }

    public GetCategoryDTO(Integer id, String title, String url_image, Integer quantity, List<GetProductCardDto> products) {
        this.id = id;
        this.title = title;
        this.url_image = url_image;
        this.quantity = quantity;
        this.products = products;
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

    public String getImage() {
        return url_image;
    }

    public void setImage(String url_image) {
        this.url_image = url_image;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public List<GetProductCardDto> getProducts() {
        return products;
    }

    public void setProducts(List<GetProductCardDto> products) {
        this.products = products;
    }
}

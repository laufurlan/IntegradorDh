package com.grupo4.hotels.DTO.Category;



public class CategoryDTO {
    private Integer id;
    private String title;
    private String url_image;
    private Integer quantity;

    public CategoryDTO() {
    }

    public CategoryDTO(Integer id, String title, String url_image, Integer quantity) {
        this.id = id;
        this.title = title;
        this.url_image = url_image;
        this.quantity = quantity;
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
}

package com.grupo4.hotels.dto.Category;

public class GetCategoriesDTO {
private Integer id;
    private String title;
    private String url_image;
    private Integer quantity;

    public GetCategoriesDTO() {
    }

    public GetCategoriesDTO(Integer id, String title, String url_image, Integer quantity) {
        this.id = id;
        this.title = title;
        this.url_image = url_image;
        this.quantity = quantity;
    }

    public Integer getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public String getUrl_image() {
        return url_image;
    }



    public Integer getQuantity() {
        return quantity;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setUrl_image(String url_image) {
        this.url_image = url_image;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }
}

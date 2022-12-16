package com.grupo4.hotels.dto.Product;

import com.grupo4.hotels.dto.Attribute.GetAttributeDTO;
import com.grupo4.hotels.dto.Image.CreateImageDTO;

import java.util.ArrayList;
import java.util.List;

public class CreateProductDto {
    private transient Integer id;
    private String title;
    private String description;
//    private String url_image;
    private Integer idCategory;
    private Integer idCity;
    private String address;
    private Integer id_owner;
//    private List<CreateImageDTO> images = new ArrayList<>();
    private List<GetAttributeDTO> attributes = new ArrayList<>();
    private String house_rules;
    private String security;
    private String cancellation_policy;

    public CreateProductDto() {
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

//    public String getUrl_image() {
//        return url_image;
//    }

//    public void setUrl_image(String url_image) {
//        this.url_image = url_image;
//    }

    public Integer getIdCategory() {
        return idCategory;
    }

    public void setIdCategory(Integer idCategory) {
        this.idCategory = idCategory;
    }

    public Integer getIdCity() {
        return idCity;
    }

    public void setIdCity(Integer idCity) {
        this.idCity = idCity;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Integer getId_owner() {
        return id_owner;
    }

    public void setId_owner(Integer id_owner) {
        this.id_owner = id_owner;
    }

//    public List<CreateImageDTO> getImages() {
//        return images;
//    }

//    public void setImages(List<CreateImageDTO> images) {
//        this.images = images;
//    }

    public List<GetAttributeDTO> getAttributes() {
        return attributes;
    }

    public void setAttributes(List<GetAttributeDTO> attributes) {
        this.attributes = attributes;
    }

    public String getHouse_rules() {
        return house_rules;
    }

    public void setHouse_rules(String house_rules) {
        this.house_rules = house_rules;
    }

    public String getSecurity() {
        return security;
    }

    public void setSecurity(String security) {
        this.security = security;
    }

    public String getCancellation_policy() {
        return cancellation_policy;
    }

    public void setCancellation_policy(String cancellation_policy) {
        this.cancellation_policy = cancellation_policy;
    }
}

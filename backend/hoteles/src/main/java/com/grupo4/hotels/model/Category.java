package com.grupo4.hotels.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import javax.persistence.*;
//<<<<<<< HEAD
//import java.util.ArrayList;
//import java.util.List;
//=======
//<<<<<<< HEAD
//=======
import java.util.ArrayList;
import java.util.List;
import java.util.ArrayList;
import java.util.List;


@Entity
@Table(name = "categories")

public class Category {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String title;
    private String description;
    private String url_image;

    @OneToMany(mappedBy = "category", fetch = FetchType.LAZY)
    private List<Product> products = new ArrayList<>();


    public Category() {
    }

    public Category(Integer id, String title, String description, String url_image) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.url_image = url_image;
    }

    public Category(String title, String description, String url_image) {
        this.title = title;
        this.description = description;
        this.url_image = url_image;
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

    public void setId(Integer id) {
        this.id = id;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setUrl_image(String url_image) {
        this.url_image = url_image;
    }

    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }
}
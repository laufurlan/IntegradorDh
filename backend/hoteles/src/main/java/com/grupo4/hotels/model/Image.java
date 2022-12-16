package com.grupo4.hotels.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;


@Entity
@Table(name = "images")
public class Image {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id_image")
    private Integer Id;
    private String title;
    private String URL;

    @ManyToOne
    @JoinColumn(name="id_product")
    @JsonIgnore
    private Product product;

    public Image() {
    }

    public Image(String title, String URL, Product product) {
        this.title = title;
        this.URL = URL;
        this.product = product;
    }

    public Integer getId() {
        return Id;
    }

    public void setId(Integer id) {
        Id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getURL() {
        return URL;
    }

    public void setURL(String URL) {
        this.URL = URL;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
}

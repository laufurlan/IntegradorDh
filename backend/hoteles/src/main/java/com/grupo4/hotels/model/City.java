package com.grupo4.hotels.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;


import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "cities")
public class City {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id_city")
    private Integer Id ;
    private String title;


    @OneToMany(mappedBy = "city",fetch = FetchType.LAZY)
    @JsonIgnore
    //@ElementCollection(targetClass = Product.class)
    private List<Product> products = new ArrayList<>();

    public City() {
    }

    public Integer getId() {
        return Id;
    }

    public City(String title) {
        this.title = title;
    }


    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }

    @Override
    public String toString() {
        return "City{" +
                "id_city=" + Id +
                ", title='" + title + '\'' +
                ", products=" + products +
                '}';
    }
}









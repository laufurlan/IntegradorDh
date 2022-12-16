package com.grupo4.hotels.model;

import com.fasterxml.jackson.annotation.JsonBackReference;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "attributes")
public class Attribute {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id_attribute")
    private Integer Id;
    private String title;

    //@OneToMany(mappedBy = "attribute",fetch = FetchType.EAGER)
    @ManyToMany(mappedBy = "productAttribute",fetch = FetchType.LAZY)
    @JsonBackReference
    private List<Product> productAttribute= new ArrayList<>();

    public Attribute() {
    }

    public Attribute(String title) {
        this.title = title;
    }

    public String getTitle() {
        return title;
    }

    public Integer getId() {
        return Id;
    }

    public void setId(Integer id) {
        Id = id;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public List<Product> getProductAttribute() {
        return productAttribute;
    }

    public void setProductAttribute(List<Product> productAttribute) {
        this.productAttribute = productAttribute;
    }
}

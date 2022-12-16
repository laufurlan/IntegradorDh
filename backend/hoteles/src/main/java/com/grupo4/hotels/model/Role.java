package com.grupo4.hotels.model;

import com.grupo4.hotels.model.CompositeKeys.ProductAttributteId;

import javax.persistence.*;

@Entity
@Table(name = "roles")
public class Role {


    @javax.persistence.Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id_role")
    private Integer Id ;

    private String title;


    public Role() {
    }

    public Role(String title) {
        this.title = title;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;

    }

    public Integer getId() {
        return Id;
    }


    @Override
    public String toString() {
        return "Role{" +
                "Id=" + Id +
                ", title='" + title + '\'' +
                '}';
    }
}

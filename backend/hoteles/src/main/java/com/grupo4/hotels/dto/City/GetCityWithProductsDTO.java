package com.grupo4.hotels.dto.City;

import com.grupo4.hotels.dto.Product.GetProductCardDto;
import com.grupo4.hotels.model.Product;

import java.util.ArrayList;
import java.util.List;

public class GetCityWithProductsDTO {

    // devuelve la ciudad con los productos que pertenecen a Dicha ciudad
    private Integer id_city;
    private String title;
    private List<GetProductCardDto> products = new ArrayList<>();

    public GetCityWithProductsDTO() {
    }

    public GetCityWithProductsDTO(Integer id_city, String title, List<GetProductCardDto> products) {
        this.id_city = id_city;
        this.title = title;
        this.products = products;
    }

    public Integer getId_city() {
        return id_city;
    }

    public void setId_city(Integer id_city) {
        this.id_city = id_city;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public List<GetProductCardDto> getProducts() {
        return products;
    }

    public void setProducts(List<GetProductCardDto> products) {
        this.products = products;
    }
}






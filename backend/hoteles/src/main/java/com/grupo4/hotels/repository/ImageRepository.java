package com.grupo4.hotels.repository;

import com.grupo4.hotels.model.Image;
import com.grupo4.hotels.model.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;


public interface ImageRepository extends JpaRepository<Image, Integer> {

        @Query("select i from Image i where i.product = ?1")
        List<Image> findByProductId(Product product);
    }


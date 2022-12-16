package com.grupo4.hotels.repository;


import com.grupo4.hotels.model.CompositeKeys.ProductAttributteId;
import com.grupo4.hotels.model.ProductAttribute;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductAttributeRepository extends JpaRepository<ProductAttribute, ProductAttributteId> {

}

package com.grupo4.hotels.repository;


import com.grupo4.hotels.model.Policy;
import com.grupo4.hotels.model.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;



public interface PolicyRepository extends JpaRepository<Policy, Integer> {

    Policy findByProduct(Product product);
}


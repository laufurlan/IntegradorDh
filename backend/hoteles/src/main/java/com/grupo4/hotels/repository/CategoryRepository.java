package com.grupo4.hotels.repository;

import com.grupo4.hotels.model.Category;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CategoryRepository extends JpaRepository<Category,Integer> {
}

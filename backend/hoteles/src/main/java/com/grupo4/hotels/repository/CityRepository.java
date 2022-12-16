package com.grupo4.hotels.repository;


import com.grupo4.hotels.model.City;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CityRepository extends JpaRepository<City, Integer> {
}

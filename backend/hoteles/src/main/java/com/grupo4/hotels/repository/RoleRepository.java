package com.grupo4.hotels.repository;


import com.grupo4.hotels.model.Role;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RoleRepository extends JpaRepository<Role, Integer> {

Role findById(int id);

}

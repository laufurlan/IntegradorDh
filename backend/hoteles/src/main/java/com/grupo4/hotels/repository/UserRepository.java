package com.grupo4.hotels.repository;


import com.grupo4.hotels.model.*;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface UserRepository extends JpaRepository<User, Integer> {

    //@Query("from User u where u.role= ?1")
    List<User> findByRole(Role role);
    User findByEmail(String email);
    Boolean existsByEmail(String email);
    //List<User> findByBooking(Booking booking);

    // filtro para validar que el producto pertenezca al usuario
    @Query("select case when (count(p) > 0) then true else false end from Product p where p.userOwner.email= ?1 and p.Id=?2")
    Boolean userAvailableUpdateProduct(String email, Integer idProduct);

}

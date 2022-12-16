package com.grupo4.hotels.repository;

import com.grupo4.hotels.model.Booking;
import com.grupo4.hotels.model.Product;
import com.grupo4.hotels.model.ReservedDates;
import com.grupo4.hotels.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.time.LocalDate;
import java.util.List;

public interface BookingRepository extends JpaRepository<Booking, Integer> {


    List<Booking> findByUser(User user);

    //@Query("select b.product from Booking b where b.initial_date>?1 and b.initial_date<?2 andb.product=?3" )
    //List<Booking> findBookingNotAvaible(LocalDate initialDate, LocalDate FinalDAte, Product porduct);
    @Query("select  new com.grupo4.hotels.model.ReservedDates(b.initial_date, b.final_date) from Booking b where b.product=?1")
    List<ReservedDates> findReservedDatesByProduct(Product product);

//    @Query("select b.product from Booking b where ( b.initial_date>=?1 and b.initial_date<=?2 ) or (b.final_date>=?1 and b.final_date<=?2) and b.product=?3")
    @Query("select b.product from Booking b where ( b.initial_date<=?1 and b.final_date>=?1) or ( b.initial_date<=?2 and b.final_date>=?2) and b.product=?3")
    List<Product> findProductNotAvailable(LocalDate initialDate, LocalDate FinalDAte, Product product);

    //    @Query("select b.product from Booking b where  ( b.initial_date<=?1 and b.initial_date>=?2 ) or (b.final_date<=?1 and b.final_date>=?2)")
//    @Query("select b.product from Booking b where not ( b.initial_date>=?1 and b.initial_date<=?2 ) or (b.final_date>=?1 and b.final_date<=?2)")
    @Query("select p from Product p where p not in (select b.product from Booking b where ( b.initial_date<=?1 and b.final_date>=?1) or ( b.initial_date<=?2 and b.final_date>=?2))" )
    List<Product> findProductsAvailable(LocalDate initialDate, LocalDate FinalDAte);


//
//    @Query("select p from Product p where p not in " +
//            "(select b.product from Booking b" +
//            " where ( b.initialDate<=?1 and b.finalDate>=?1) or ( b.initialDate<=?2 and b.finalDate>=?2))" )
//    List<Product> findProductsAvailableByDates(LocalDate initialDate, LocalDate FinalDate);
}

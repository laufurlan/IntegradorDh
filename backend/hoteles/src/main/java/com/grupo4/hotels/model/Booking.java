package com.grupo4.hotels.model;

import javax.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "bookings")
public class Booking {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id_booking")
    private Integer Id;
    private LocalDate initial_date;
    private  LocalDate final_date;

    @ManyToOne
    @JoinColumn(name="id_user")
    private User user;

    @ManyToOne
    @JoinColumn(name="id_product")
    private Product product;

    public Booking() {
    }

    public Booking(LocalDate initial_date, LocalDate final_date, User user, Product product) {
        this.initial_date = initial_date;
        this.final_date = final_date;
        this.user = user;
        this.product = product;
    }

    public LocalDate getInitial_date() {
        return initial_date;
    }

    public void setInitial_date(LocalDate initial_date) {
        this.initial_date = initial_date;
    }

    public LocalDate getFinal_date() {
        return final_date;
    }

    public void setFinal_date(LocalDate final_date) {
        this.final_date = final_date;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Integer getId() {
        return Id;
    }

    @Override
    public String toString() {
        return "Booking{" +
                "Id=" + Id +
                ", initial_date=" + initial_date +
                ", final_date=" + final_date +
                ", user=" + user.getName() +
                ", product=" + product.getTitle() +
                '}';
    }
}

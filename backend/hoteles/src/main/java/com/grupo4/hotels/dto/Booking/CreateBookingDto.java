package com.grupo4.hotels.dto.Booking;

import java.time.LocalDate;

public class CreateBookingDto {
    private Integer product_id;
    private LocalDate initial_date;
    private LocalDate final_date;


    public CreateBookingDto() {
    }

    public CreateBookingDto(Integer product_id, LocalDate initial_date, LocalDate final_date) {
        this.product_id = product_id;
        this.initial_date = initial_date;
        this.final_date = final_date;

    }

    public Integer getProduct_id() {
        return product_id;
    }

    public void setProduct_id(Integer product_id) {
        this.product_id = product_id;
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

}

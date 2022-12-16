package com.grupo4.hotels.dto.Booking;

import java.time.LocalDate;

public class GetBookingDto {
    private Integer reservation_id;
    private Integer product_id;
    private LocalDate initial_date;
    private LocalDate final_date;

    public GetBookingDto(Integer reservation_id, Integer product_id, LocalDate initial_date, LocalDate final_date) {
        this.reservation_id = reservation_id;
        this.product_id = product_id;
        this.initial_date = initial_date;
        this.final_date = final_date;
    }

    public GetBookingDto() {
    }

    public Integer getReservation_id() {
        return reservation_id;
    }

    public void setReservation_id(Integer reservation_id) {
        this.reservation_id = reservation_id;
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

package com.grupo4.hotels.dto.Booking;

import java.time.LocalDate;

public class DatesDto {
    LocalDate initial_date;
    LocalDate final_date;

    public DatesDto() {
    }

    public DatesDto(LocalDate initial_date, LocalDate final_date) {
        this.initial_date = initial_date;
        this.final_date = final_date;
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

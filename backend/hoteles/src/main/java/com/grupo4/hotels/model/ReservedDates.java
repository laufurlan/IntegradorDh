package com.grupo4.hotels.model;

import java.time.LocalDate;

public class ReservedDates {

    private LocalDate initial_date;
    private LocalDate final_date;

    public ReservedDates() {
    }


    public ReservedDates(LocalDate initialDate, LocalDate finalDate) {
        this.initial_date = initialDate;
        this.final_date = finalDate;
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

    @Override
    public String toString() {
        return "ReserverDates{" +
                "initialDate=" + initial_date +
                ", finalDate=" + final_date +
                '}';
    }
}



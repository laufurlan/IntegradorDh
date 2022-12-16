package com.grupo4.hotels.security.payload;

public class UserError {
    private String error;

    public UserError(String error) {
        this.error = error;
    }

    public String getError() {
        return this.error;
    }

    public void setError(String error) {
        this.error = error;
    }

}

package com.grupo4.hotels.controller;

import com.grupo4.hotels.dto.Booking.CreateBookingDto;
import com.grupo4.hotels.dto.Booking.DatesDto;
import com.grupo4.hotels.dto.Booking.GetBookingDto;
import com.grupo4.hotels.dto.Product.GetProductCardDto;
import com.grupo4.hotels.exception.BadRequestException;
import com.grupo4.hotels.exception.ForbiddenException;
import com.grupo4.hotels.exception.ResourceNotFoundException;
import com.grupo4.hotels.model.ReservedDates;
import com.grupo4.hotels.service.BookingService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Role;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.annotation.security.PermitAll;
import javax.annotation.security.RolesAllowed;
import java.util.List;

@CrossOrigin
@RestController
@RequestMapping("/bookings")
public class BookingController {

    @Autowired
    private BookingService bookingService;

    @Operation(summary = "Get all reserved dates by product id")
    @ApiResponse(responseCode = "200", description = "Get all reserved dates for a specific product", content = {@Content(mediaType = "application/json")})
    @ApiResponse(responseCode = "400", description = "Bad Request", content = {@Content(mediaType = "application/json")})
    @GetMapping("/reservedDatesByProduct/{id}")
    public ResponseEntity<List<ReservedDates>> findDateByProduct(@PathVariable Integer id) throws BadRequestException {
        return ResponseEntity.ok(bookingService.findDateByProduct(id));
    }

    @Operation(summary = "Reserve a product. Need to be logged in as a client")
    @ApiResponse(responseCode = "200", description = "Reserve a product", content = {@Content(mediaType = "application/json")})
    @ApiResponse(responseCode = "400", description = "Bad Request", content = {@Content(mediaType = "application/json")})
    @RolesAllowed("ROLE_client")
    @PostMapping("reserveProduct")
    public ResponseEntity<String> reserveProduct(@RequestBody CreateBookingDto createBookingDto) throws BadRequestException {
        return ResponseEntity.ok(bookingService.createReservation(createBookingDto));
    }

    @Operation(summary = "Get all available products for a specific date range")
    @ApiResponse(responseCode = "200", description = "Get all available products for a specific date range", content = {@Content(mediaType = "application/json")})
    @ApiResponse(responseCode = "400", description = "Bad Request", content = {@Content(mediaType = "application/json")})
    @PostMapping("getAvailableProductsByDate")
    public ResponseEntity<List<GetProductCardDto>> getAvailableProductsByDate(@RequestBody DatesDto date) throws BadRequestException {
        return ResponseEntity.ok(bookingService.getProductsByDate(date));
    }

    @Operation(summary = "Get all bookings for a specific user. Need to be logged in as a client")
    @ApiResponse(responseCode = "200", description = "Get all bookings for a specific user", content = {@Content(mediaType = "application/json")})
    @ApiResponse(responseCode = "400", description = "Bad Request", content = {@Content(mediaType = "application/json")})
    @RolesAllowed("ROLE_client")
    @GetMapping("byUser")
    public ResponseEntity<List<GetBookingDto>> getBookingsByUser() throws BadRequestException {
        return ResponseEntity.ok(bookingService.getBookingsByUser());
    }

    @Operation(summary = "Cancel a booking. Need to be logged in as a client")
    @ApiResponse(responseCode = "200", description = "Cancel a booking", content = {@Content(mediaType = "application/json")})
    @ApiResponse(responseCode = "400", description = "Bad Request", content = {@Content(mediaType = "application/json")})
    @ApiResponse(responseCode = "403", description = "Forbidden", content = {@Content(mediaType = "application/json")})
    @RolesAllowed("ROLE_client")
    @DeleteMapping("cancelBooking")
    public ResponseEntity<String> deleteBooking(@RequestBody GetBookingDto getBookingDto) throws BadRequestException, ForbiddenException {
        return ResponseEntity.ok(bookingService.deleteBooking(getBookingDto));
    }

}

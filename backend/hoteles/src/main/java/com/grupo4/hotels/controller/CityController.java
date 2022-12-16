package com.grupo4.hotels.controller;

//import com.grupo4.hotels.DTO.City.GetCityWithProductsDTO;

import com.grupo4.hotels.dto.City.CreateCityDTO;
import com.grupo4.hotels.dto.City.GetCityWithProductsDTO;
import com.grupo4.hotels.dto.City.UpdateCityDTO;
import com.grupo4.hotels.exception.BadRequestException;
import com.grupo4.hotels.exception.ResourceNotFoundException;
import com.grupo4.hotels.model.City;
import com.grupo4.hotels.service.CityService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.annotation.security.PermitAll;
import javax.annotation.security.RolesAllowed;
import java.util.List;
import java.util.Optional;

@CrossOrigin
@RestController
@RequestMapping("/cities")
public class CityController {

    @Autowired
    private CityService cityService;

    @Operation(summary = "List all cities")
    @ApiResponse(responseCode = "200", description = "Get all cities", content = {@Content(mediaType = "application/json")})
    @ApiResponse(responseCode = "404", description = "Not Found", content = {@Content(mediaType = "application/json")})
    @GetMapping
    public ResponseEntity<List<City>> findAll() throws ResourceNotFoundException {
        return ResponseEntity.ok(cityService.findAll());
    }

    //    @GetMapping("/{id}")
//    public ResponseEntity<Optional<City>> findById(@PathVariable Integer id) throws ResourceNotFoundException {
//        return ResponseEntity.ok(cityService.find(id));
//
//    }
    @Operation(summary = "Get a specific city by Id")
    @ApiResponse(responseCode = "200", description = "Get a specific city by Id", content = {@Content(mediaType = "application/json")})
    @ApiResponse(responseCode = "404", description = "Not Found", content = {@Content(mediaType = "application/json")})
    @GetMapping("/{id}")
    public ResponseEntity<GetCityWithProductsDTO> findByIdWithOutProducts(@PathVariable Integer id) throws ResourceNotFoundException {
        return ResponseEntity.ok(cityService.findWithProducts(id));
    }

    @Operation(summary = "Create a new city. Need to have the role Offerer")
    @ApiResponse(responseCode = "200", description = "Create a new city", content = {@Content(mediaType = "application/json")})
    @ApiResponse(responseCode = "400", description = "Bad Request", content = {@Content(mediaType = "application/json")})
    @RolesAllowed("ROLE_offerer")
    @PostMapping
    public ResponseEntity<City> create(@RequestBody CreateCityDTO createCityDTO) throws BadRequestException {
        return ResponseEntity.ok(cityService.save(createCityDTO));
    }
}

//    @DeleteMapping("/{id}")
//    public ResponseEntity<String> delete(@PathVariable Integer id) throws ResourceNotFoundException {
//        cityService.delete(id);
//        return ResponseEntity.ok("City with id " + id + " was deleted");
//    }

//    @PutMapping
//    public ResponseEntity<City> update(@RequestBody UpdateCityDTO updateCityDTO) throws ResourceNotFoundException {
//        return ResponseEntity.ok(cityService.update(updateCityDTO));
//    }
//}

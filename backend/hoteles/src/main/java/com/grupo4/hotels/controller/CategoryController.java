package com.grupo4.hotels.controller;

import com.grupo4.hotels.dto.Category.GetCategoryDTO;
import com.grupo4.hotels.dto.Category.GetCategoriesDTO;
import com.grupo4.hotels.exception.BadRequestException;
import com.grupo4.hotels.exception.ResourceNotFoundException;
import com.grupo4.hotels.model.Category;
import com.grupo4.hotels.model.City;
import com.grupo4.hotels.service.CategoryService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin
@RestController
@RequestMapping("/categories")
public class CategoryController {

    @Autowired
    private CategoryService categoryService;

    @Operation(summary = "Get category by Id")
    @ApiResponse(responseCode = "200", description = "Get category by id", content = {@Content(mediaType = "application/json")})
    @ApiResponse(responseCode = "404", description = "Not Found", content = {@Content(mediaType = "application/json")})
    @GetMapping("/{id}")
    public ResponseEntity<GetCategoryDTO> findByID(@PathVariable Integer id) throws ResourceNotFoundException {

        return ResponseEntity.ok(categoryService.findById(id));
    }

    @Operation(summary = "Get all categories")
    @ApiResponse(responseCode = "200", description = "Get all categories", content = {@Content(mediaType = "application/json")})
    @ApiResponse(responseCode = "404", description = "Not Found", content = {@Content(mediaType = "application/json")})
    @GetMapping
    public ResponseEntity<List<GetCategoriesDTO>> findAll() throws ResourceNotFoundException {
        return ResponseEntity.ok(categoryService.findAll());
    }

}
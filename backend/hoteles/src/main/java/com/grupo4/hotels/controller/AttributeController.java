package com.grupo4.hotels.controller;

import com.grupo4.hotels.exception.BadRequestException;
import com.grupo4.hotels.model.Attribute;
import com.grupo4.hotels.service.AttributeService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@CrossOrigin
@RestController
@RequestMapping("/attributes")
public class AttributeController {
    @Autowired
    private AttributeService attributeService;

    @Operation(summary = "Get all attributes")
    @ApiResponse(responseCode = "200", description = "Get all attributes", content = {@Content(mediaType = "application/json")})
    @ApiResponse(responseCode = "400", description = "Bad Request", content = {@Content(mediaType = "application/json")})
    @GetMapping
    public ResponseEntity<List<Attribute>> findAll() throws BadRequestException {
        return ResponseEntity.ok(attributeService.findAll());
    }
}

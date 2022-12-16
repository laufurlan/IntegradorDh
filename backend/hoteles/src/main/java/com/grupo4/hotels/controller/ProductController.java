package com.grupo4.hotels.controller;

import com.grupo4.hotels.dto.Product.CreateProductDto;
import com.grupo4.hotels.dto.Product.GetProductCardDto;
import com.grupo4.hotels.dto.Product.GetProductsCardsDto;
import com.grupo4.hotels.exception.BadRequestException;
import com.grupo4.hotels.exception.ForbiddenException;
import com.grupo4.hotels.exception.ResourceNotFoundException;
import com.grupo4.hotels.model.Product;
import com.grupo4.hotels.model.ReservedDates;
import com.grupo4.hotels.service.BookingService;
import com.grupo4.hotels.service.ProductService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.security.PermitAll;
import javax.annotation.security.RolesAllowed;
import javax.validation.Valid;
import java.util.List;
import java.util.Optional;

@CrossOrigin
@RestController
@RequestMapping("/products")
public class ProductController {
    @Autowired
    private ProductService productService;
    @Autowired
    private BookingService bookingService;


//    @GetMapping("/byCard")
//    public ResponseEntity<List<GetProductCardDto>> findAllByIdCard() throws ResourceNotFoundException {
//        return ResponseEntity.ok(productService.findAllByIdCard());
//    }

    @Operation(summary = "Get all products")
    @ApiResponse(responseCode = "200", description = "Get all products", content = {@Content(mediaType = "application/json")})
    @ApiResponse(responseCode = "404", description = "Not Found", content = {@Content(mediaType = "application/json")})
    @GetMapping
    public ResponseEntity<List<GetProductCardDto>> findAllB() throws ResourceNotFoundException {
        return ResponseEntity.ok(productService.findAll());
    }

    @Operation(summary = "Get a specific product by Id")
    @ApiResponse(responseCode = "200", description = "Get a specific product by Id", content = {@Content(mediaType = "application/json")})
    @ApiResponse(responseCode = "404", description = "Not Found", content = {@Content(mediaType = "application/json")})
    @GetMapping("/{id}")
    public ResponseEntity<GetProductCardDto> findById(@PathVariable Integer id) throws ResourceNotFoundException {
        return ResponseEntity.ok(productService.findByIdCard(id));
    }

    @Operation(summary = "Get eight random products")
    @ApiResponse(responseCode = "200", description = "Get eight random products", content = {@Content(mediaType = "application/json")})
    @ApiResponse(responseCode = "404", description = "Not Found", content = {@Content(mediaType = "application/json")})
    @GetMapping("/random")
    public ResponseEntity<List<GetProductCardDto>> findRandom() throws ResourceNotFoundException {
        return ResponseEntity.ok(productService.findRandom());
    }

    @Operation(summary = "Get all products by category")
    @ApiResponse(responseCode = "200", description = "Get all products by category", content = {@Content(mediaType = "application/json")})
    @ApiResponse(responseCode = "404", description = "Not Found", content = {@Content(mediaType = "application/json")})
    @GetMapping("/productsByCatogry/{id}")
    public ResponseEntity<List<GetProductCardDto>> findCardsByCategory(@PathVariable Integer id) throws ResourceNotFoundException {
        return ResponseEntity.ok(productService.findCardsByCategory(id));
    }

    @Operation(summary = "Create a new product. Need to be logged in as an Offerer")
    @ApiResponse(responseCode = "200", description = "New product created", content = {@Content(mediaType = "application/json")})
    @ApiResponse(responseCode = "400", description = "Bad Request", content = {@Content(mediaType = "application/json")})
    @ApiResponse(responseCode = "404", description = "Not Found", content = {@Content(mediaType = "application/json")})
    @ApiResponse(responseCode = "403", description = "Forbidden", content = {@Content(mediaType = "application/json")})
    @ApiResponse(responseCode = "401", description = "Unauthorized", content = {@Content(mediaType = "application/json")})
    @RolesAllowed("ROLE_offerer")
    @PostMapping(consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<GetProductCardDto> save( @Valid @RequestPart(value="post") CreateProductDto createProductDto, @RequestPart("mainImage") MultipartFile mainImage, @RequestPart("images") MultipartFile[] images) throws ResourceNotFoundException, BadRequestException {
        return ResponseEntity.ok(productService.save(createProductDto, images, mainImage));
    }

    @Operation(summary = "Update a product. Need to be logged in as an Offerer and be the owner of the product")
    @ApiResponse(responseCode = "200", description = "Product updated", content = {@Content(mediaType = "application/json")})
    @ApiResponse(responseCode = "400", description = "Bad Request", content = {@Content(mediaType = "application/json")})
    @ApiResponse(responseCode = "404", description = "Not Found", content = {@Content(mediaType = "application/json")})
    @ApiResponse(responseCode = "403", description = "Forbidden", content = {@Content(mediaType = "application/json")})
    @ApiResponse(responseCode = "401", description = "Unauthorized", content = {@Content(mediaType = "application/json")})
    @RolesAllowed("ROLE_offerer")
    @PutMapping
    public ResponseEntity<GetProductCardDto> update(@RequestPart("post") CreateProductDto createProductDto,
                                                    @RequestPart(value = "urlImage", required = false) String[] urlImages,
                                                    @RequestPart(value = "uploadedImage", required = false) MultipartFile[] uploadedImage,
                                                    @RequestPart(value = "urlMainImage", required = false) String urlMainImage,
                                                    @RequestPart(value = "uploadedMainImage", required = false) MultipartFile uploadedMainImage) throws ResourceNotFoundException, BadRequestException, ForbiddenException {
        return ResponseEntity.ok(productService.update(createProductDto, urlImages, urlMainImage, uploadedImage, uploadedMainImage));
    }

    @Operation(summary = "Find all products by user. Need to be logged in as an Offerer")
    @ApiResponse(responseCode = "200", description = "Get all products by user", content = {@Content(mediaType = "application/json")})
    @ApiResponse(responseCode = "400", description = "Bad Request", content = {@Content(mediaType = "application/json")})
    @RolesAllowed("ROLE_offerer")
    @GetMapping("/myProducts")
    public ResponseEntity<List<GetProductCardDto>> findByUser() throws BadRequestException {
        return ResponseEntity.ok(productService.findByUser());
    }

    @Operation(summary = "Delete a product by id")
    @ApiResponse(responseCode = "200", description = "Product deleted", content = {@Content(mediaType = "application/json")})
    @ApiResponse(responseCode = "400", description = "Bad Request", content = {@Content(mediaType = "application/json")})
    @DeleteMapping("/{id}")
    public ResponseEntity<String> delete(@PathVariable("id") Integer id) throws BadRequestException {
        return ResponseEntity.ok(productService.deleteById(id));
    }
}









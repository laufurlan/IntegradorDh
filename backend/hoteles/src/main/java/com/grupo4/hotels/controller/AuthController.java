package com.grupo4.hotels.controller;

import com.grupo4.hotels.exception.BadRequestException;
import com.grupo4.hotels.model.User;
import com.grupo4.hotels.repository.RoleRepository;
import com.grupo4.hotels.repository.UserRepository;
import com.grupo4.hotels.security.jwt.JwtTokenUtil;
import com.grupo4.hotels.security.payload.*;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.security.PermitAll;

@PermitAll
@RestController
@RequestMapping("/api/auth")
public class AuthController {
    private final AuthenticationManager authenticationManager;
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;
    private final JwtTokenUtil jwtTokenUtil;
    private final RoleRepository roleRepository;


    public AuthController(AuthenticationManager authenticationManager, UserRepository userRepository, PasswordEncoder passwordEncoder, JwtTokenUtil jwtTokenUtil, RoleRepository roleRepository) {
        this.authenticationManager = authenticationManager;
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
        this.jwtTokenUtil = jwtTokenUtil;
        this.roleRepository = roleRepository;
    }

    @Operation(summary = "Login")
    @ApiResponse(responseCode = "200", description = "Get a JWT token with user information", content = {@Content(mediaType = "application/json")})
    @ApiResponse(responseCode = "400", description = "Bad Request", content = {@Content(mediaType = "application/json")})
    @PostMapping("/login")
    public ResponseEntity<Object> login(@RequestBody LoginRequest loginRequest) throws BadRequestException {
//        throw an exception if the login is unsuccessful
        try {
            Authentication authentication = authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(loginRequest.getEmail(), loginRequest.getPassword()));
            SecurityContextHolder.getContext().setAuthentication(authentication);
            String jwt = jwtTokenUtil.generateJwtToken(authentication);

            return ResponseEntity.ok(new JwtResponse(jwt));
        } catch (AuthenticationException e) {
            return new ResponseEntity<>(new UserError(e.getMessage()), HttpStatus.UNAUTHORIZED);
        }
//        Authentication authentication = authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(loginRequest.getEmail(), loginRequest.getPassword()));
//        SecurityContextHolder.getContext().setAuthentication(authentication);
//        String jwt = jwtTokenUtil.generateJwtToken(authentication);
//
//        return ResponseEntity.ok(new JwtResponse(jwt));

    }

    @Operation(summary = "Register")
    @ApiResponse(responseCode = "200", description = "Register a new user", content = {@Content(mediaType = "application/json")})
    @ApiResponse(responseCode = "400", description = "Bad Request", content = {@Content(mediaType = "application/json")})
    @PostMapping("/register")
    public ResponseEntity<Object> register(@RequestBody RegisterRequest registerRequest) {
//        Check email
        if (userRepository.existsByEmail(registerRequest.getEmail())) {
//            return ResponseEntity.badRequest().body("Email is already registered");
            return new ResponseEntity<>(new UserError("Email is already registered"), HttpStatus.BAD_REQUEST);
        }

//        Create new user
        User user = new User(registerRequest.getName(), registerRequest.getLast_name(), registerRequest.getEmail(), passwordEncoder.encode(registerRequest.getPassword()), roleRepository.findById(2));
        userRepository.save(user);

        return ResponseEntity.ok(new MessageResponse("User registered successfully"));
    }
}

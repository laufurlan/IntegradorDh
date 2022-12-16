//package com.grupo4.hotels.config;
//
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.web.bind.annotation.CrossOrigin;
//import springfox.documentation.builders.PathSelectors;
//import springfox.documentation.builders.RequestHandlerSelectors;
//import springfox.documentation.service.ApiInfo;
//import springfox.documentation.spi.DocumentationType;
//import springfox.documentation.spring.web.plugins.Docket;
//
//import javax.annotation.security.PermitAll;
//import java.util.Collections;
//
//@Configuration
//public class SwaggerConfig {
//
//    @Bean
//    public Docket api() {
//        return new Docket(DocumentationType.SWAGGER_2)
//                .apiInfo(apiDetails())
//                .select()
//                .apis(RequestHandlerSelectors.any())
//                .paths(PathSelectors.any())
//                .build();
//    }
//
//    private ApiInfo apiDetails(){
//        return new ApiInfo(
//                "Git Travel",
//                "Proyecto Integrador Digital House del grupo 4 de la camada 6. Integrantes: Eugenia Bonillo, Ezequiel Safdie, Josefina Morales, Laura Furlan, Stefany Salamanca",
//                "1.0",
//                "Free to use",
//                new springfox.documentation.service.Contact("Grupo 4", "www.gittravel.com.ar", ""),
//                "GitTravel 2022",
//                "www.gittravel.com.ar",
//                Collections.emptyList());
//    }
//}

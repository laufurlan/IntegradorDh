//package com.grupo4.hotels.controller;
//
//
//import com.grupo4.hotels.model.ReservedDates;
//import com.grupo4.hotels.service.BucketImageService;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.http.ResponseEntity;
//import org.springframework.web.bind.annotation.*;
//import org.springframework.web.multipart.MultipartFile;
//
//import java.util.List;
//
//@RestController
//@RequestMapping("/storage")
//public class BucketImagesController {
//
//    private BucketImageService amazonClient;
//
//    @Autowired
//    BucketImagesController(BucketImageService amazonClient) {
//        this.amazonClient = amazonClient;
//    }
//
//    @PostMapping("/uploadFile")
//    public ResponseEntity<List<String>> uploadFile(@RequestParam("image") MultipartFile[] files) {
//        return ResponseEntity.ok(this.amazonClient.uploadFile(files));
//    }
//
//}
package com.grupo4.hotels.service;

import com.grupo4.hotels.dto.Image.CreateImageDTO;
import com.grupo4.hotels.exception.ResourceNotFoundException;
import com.grupo4.hotels.model.Image;
import com.grupo4.hotels.repository.ImageRepository;
import org.springframework.stereotype.Service;

@Service
public class ImageService {

    private final ImageRepository imageRepository;

    public ImageService(ImageRepository imageRepository) {
        this.imageRepository = imageRepository;
    }

    public Image getImage(Integer id) throws ResourceNotFoundException {
        return imageRepository.findById(id).orElseThrow(() -> new ResourceNotFoundException("Image not found"));
    }

    public Image save(Image image) {
        return imageRepository.save(image);
    }
}

package com.grupo4.hotels.service;

import com.grupo4.hotels.exception.BadRequestException;
import com.grupo4.hotels.model.Attribute;
import com.grupo4.hotels.repository.AttributeRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AttributeService {
    private final AttributeRepository attributeRepository;

    public AttributeService(AttributeRepository attributeRepository) {
        this.attributeRepository = attributeRepository;
    }

    public List<Attribute> findAll() throws BadRequestException {
        List<Attribute> attributes = attributeRepository.findAll();
        if(attributes.isEmpty()) {
            throw new BadRequestException("No attributes found");
        }
        return attributes;
    }
}

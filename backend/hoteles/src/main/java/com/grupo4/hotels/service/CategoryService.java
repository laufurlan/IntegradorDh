package com.grupo4.hotels.service;


import com.grupo4.hotels.dto.Category.GetCategoryDTO;
import com.grupo4.hotels.dto.Category.GetCategoriesDTO;
import com.grupo4.hotels.exception.ResourceNotFoundException;
import com.grupo4.hotels.model.Category;
import com.grupo4.hotels.repository.CategoryRepository;
import com.grupo4.hotels.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.grupo4.hotels.exception.BadRequestException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class CategoryService {

    private CategoryRepository categoryRepository;
    @Autowired
    private ProductService productService;

    public CategoryService(CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }


    public GetCategoryDTO findById( Integer id) throws ResourceNotFoundException {
        GetCategoryDTO categoryDTO= new GetCategoryDTO();

        if (categoryRepository.findById(id).isPresent()){
            Category category=categoryRepository.findById(id).get();
            categoryDTO.setId(category.getId());
            categoryDTO.setTitle(category.getTitle());
            categoryDTO.setImage(category.getUrl_image());
            categoryDTO.setQuantity((productService.findCardsByCategory(category.getId())).size());
            categoryDTO.setProducts(productService.findCardsByCategory(category.getId()));

        }else{
            throw new ResourceNotFoundException(" not found");
        }
        return categoryDTO;
    }

    public List<GetCategoriesDTO> findAll() throws ResourceNotFoundException {
        List<Category> categories=categoryRepository.findAll();
        List<GetCategoriesDTO> categoriesDTO = new ArrayList<>();
        for (Category category: categories) {
            GetCategoriesDTO categoryDTO = new GetCategoriesDTO();
            categoryDTO.setId(category.getId());
            categoryDTO.setTitle(category.getTitle());
            categoryDTO.setUrl_image(category.getUrl_image());
            categoryDTO.setQuantity((productService.findCardsByCategory(category.getId())).size());
            categoriesDTO.add(categoryDTO);
        }
        return categoriesDTO;
    }

}
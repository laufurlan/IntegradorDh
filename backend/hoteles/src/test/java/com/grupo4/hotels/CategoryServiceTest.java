//package com.grupo4.hotels;
//
//import com.grupo4.hotels.exception.BadRequestException;
//import com.grupo4.hotels.exception.ResourceNotFoundException;
//import com.grupo4.hotels.model.Category;
//import com.grupo4.hotels.service.CategoryService;
//import org.junit.Assert;
//import org.junit.FixMethodOrder;
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.junit.runners.MethodSorters;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.test.context.SpringBootTest;
//import org.springframework.test.context.junit4.SpringRunner;
//
//@FixMethodOrder(MethodSorters.NAME_ASCENDING)
//@RunWith(SpringRunner.class)
//@SpringBootTest
//public class CategoryServiceTest {
//
//    @Autowired
//    private CategoryService categoryService;
//
//    @Test
//    public void saveAndFindCategoryTest() throws ResourceNotFoundException, BadRequestException {
//        Category category = new Category("Test category", "Test description", "link to image");
//        categoryService.save(category);
////        Assert.assertNotNull(categoryService.find(category.getId()));
//        categoryService.delete(category.getId());
//    }
//
//    @Test
//    public void findAllCategoriesTest() throws ResourceNotFoundException, BadRequestException {
//        Category category = new Category("Test category", "Test description", "link to image");
//        categoryService.save(category);
//        Category category1 = new Category("Test category", "Test description", "link to image");
//        categoryService.save(category1);
//        Assert.assertTrue(categoryService.findAll().size() >= 2);
//        categoryService.delete(category.getId());
//        categoryService.delete(category1.getId());
//    }
//
//    @Test
//    public void deleteCategoryTest() throws ResourceNotFoundException, BadRequestException {
//        Category category = new Category("Test category", "Test description", "link to image");
//        categoryService.save(category);
//        categoryService.delete(category.getId());
////        Assert.assertNull(categoryService.find(category.getId()));
//    }
//
//    @Test
//    public void updateCategoryTest() throws ResourceNotFoundException, BadRequestException {
//        Category category = new Category("Test category", "Test description", "link to image");
//        categoryService.save(category);
//        category.setTitle("New title");
//        categoryService.update(category);
////        Assert.assertEquals("New title", categoryService.find(category.getId()).getTitle());
//        categoryService.delete(category.getId());
//    }
//
//}

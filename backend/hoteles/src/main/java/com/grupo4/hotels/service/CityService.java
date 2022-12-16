package com.grupo4.hotels.service;

//import com.grupo4.hotels.DTO.City.GetCityWithProductsDTO;

import com.grupo4.hotels.dto.City.CreateCityDTO;
import com.grupo4.hotels.dto.City.GetCityWithProductsDTO;
import com.grupo4.hotels.dto.City.UpdateCityDTO;
import com.grupo4.hotels.exception.BadRequestException;
import com.grupo4.hotels.exception.ResourceNotFoundException;
import com.grupo4.hotels.model.City;
import com.grupo4.hotels.repository.CityRepository;
import com.grupo4.hotels.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CityService {

    private CityRepository cityRepository;

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private ProductService productService;

    public CityService(CityRepository cityRepository) {
        this.cityRepository = cityRepository;
    }

    public Optional<City> find(Integer id) throws ResourceNotFoundException {
        if (cityRepository.findById(id).isPresent()) {
            return cityRepository.findById(id);
        } else {
            throw new ResourceNotFoundException("City not found");
        }
    }

    public List<City> findAll() throws ResourceNotFoundException {
        List<City> cities = cityRepository.findAll(Sort.by(Sort.Direction.ASC, "title"));
        if(cities.isEmpty()){
            throw new ResourceNotFoundException("There are no cities");
        }
        return cities;
    }


    public GetCityWithProductsDTO findWithProducts(Integer id) throws ResourceNotFoundException {
        GetCityWithProductsDTO cityDTO = new GetCityWithProductsDTO();
        if (cityRepository.findById(id).isPresent()) {
            City city = cityRepository.findById(id).get();
            cityDTO.setId_city(city.getId());
            cityDTO.setTitle(city.getTitle());
            cityDTO.setProducts(productService.findCardsByCity(city.getId()));

        } else {
            throw new ResourceNotFoundException("You have to specify a valid City");
        }
        return cityDTO;
    }

    public City save(CreateCityDTO cityDTO) throws BadRequestException {
        if(cityDTO.getTitle() == null){
            throw new BadRequestException("You have to specify a title");
        }
        City city = new City();
        CreateCityDTO newCityDTO = new CreateCityDTO();
        city.setTitle(cityDTO.getTitle());
        return cityRepository.save(city);
    }

    public void delete(Integer id) throws ResourceNotFoundException {
        if (cityRepository.findById(id).isPresent()) {
            cityRepository.deleteById(id);
        } else {
            throw new ResourceNotFoundException("City not found");
        }
    }

    public City update(UpdateCityDTO cityDTO) throws ResourceNotFoundException {
        if (cityRepository.findById(cityDTO.getId()).isPresent()) {
            City city = cityRepository.findById(cityDTO.getId()).get();
            city.setTitle(cityDTO.getTitle());
            return cityRepository.save(city);
        } else {
            throw new ResourceNotFoundException("City not found");
        }
    }


}

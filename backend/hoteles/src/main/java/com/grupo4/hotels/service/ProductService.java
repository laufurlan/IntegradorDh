package com.grupo4.hotels.service;

import com.grupo4.hotels.dto.Attribute.GetAttributeDTO;
import com.grupo4.hotels.dto.Image.ImageWithTitle;
import com.grupo4.hotels.dto.Product.CreateProductDto;
import com.grupo4.hotels.dto.Product.GetProductCardDto;
import com.grupo4.hotels.exception.BadRequestException;
import com.grupo4.hotels.exception.ForbiddenException;
import com.grupo4.hotels.exception.ResourceNotFoundException;
import com.grupo4.hotels.model.*;
import com.grupo4.hotels.repository.*;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.transaction.Transactional;
import java.util.*;

@Service
public class ProductService {
    private ProductRepository productRepository;
    private final CategoryRepository categoryRepository;
    private final CityRepository cityRepository;
    private final ImageService imageService;
    private final AttributeRepository attributeRepository;
    private final UserRepository userRepository;
    private final ImageRepository imageRepository;
    private final PolicyRepository policyRepository;
    public final BucketImageService bucketImageService;


    public ProductService(ProductRepository productRepository, CategoryRepository categoryRepository, CityRepository cityRepository, ImageService imageService, AttributeRepository attributeRepository, UserRepository userRepository, ImageRepository imageRepository, PolicyRepository policyRepository, BucketImageService bucketImageService) {
        this.productRepository = productRepository;
        this.categoryRepository = categoryRepository;
        this.cityRepository = cityRepository;
        this.imageService = imageService;
        this.attributeRepository = attributeRepository;
        this.userRepository = userRepository;
        this.imageRepository = imageRepository;
        this.policyRepository = policyRepository;
        this.bucketImageService = bucketImageService;
    }

//    public ResponseEntity<Optional<Product>> find(Integer id) {
//        if (productRepository.findById(id).isPresent()) {
//            return ResponseEntity.ok(productRepository.findById(id));
//        } else {
//            return ResponseEntity.notFound().build();
//        }
//    }

    public Product findById(Integer Id) {
        return productRepository.findById(Id).orElse(null);
    }


    public GetProductCardDto findByIdCard(Integer id) throws ResourceNotFoundException {
        GetProductCardDto productoDTO = new GetProductCardDto();
        if (productRepository.findById(id).isPresent()) {
            Product product = productRepository.findById(id).get();
            productoDTO.setId(product.getId());
            productoDTO.setTitle(product.getTitle());
            productoDTO.setDescription((product.getDescription()));
            productoDTO.setUrl_image(product.getUrl_main_image());
            productoDTO.setCategory_name(product.getCategory().getTitle());
            productoDTO.setCity_name(product.getCity().getTitle());
            productoDTO.setIdCity(product.getCity().getId());
            productoDTO.setAddress(product.getAddress());
            productoDTO.setUserOwner(product.getUserOwner().getId());
            productoDTO.setIdCategory(product.getCategory().getId());
            productoDTO.setImages(product.getImages());
            productoDTO.setAttributes(product.getProductAttribute());
            if (policyRepository.findByProduct(product) != null) {
                Policy policy = policyRepository.findByProduct(product);
                productoDTO.setHouse_rules(policy.getHouse_rules());
                productoDTO.setSecurity(policy.getSecurity());
                productoDTO.setCancellation_policy(policy.getCancellation_policy());
            }
        } else {
            throw new ResourceNotFoundException("Product not found");
        }

        return productoDTO;
    }


    public List<GetProductCardDto> findAll() throws ResourceNotFoundException {
        List<GetProductCardDto> productsDTO = new ArrayList<>();
        List<Product> products = productRepository.findAll();
        if (products.isEmpty()) {
            throw new ResourceNotFoundException("There are no products");
        }

        productsDTO = convertToDto(products);

        return productsDTO;
    }

    public List<GetProductCardDto> findRandom() throws ResourceNotFoundException {
        final int RANDOM_PRODUCTS_QUANTITY = 8;
        List<GetProductCardDto> productsDTO = new ArrayList<>();
        List<Product> products = productRepository.findAll();

        if (products.isEmpty()) {
            throw new ResourceNotFoundException("There are no products");
        } else if (products.size() < RANDOM_PRODUCTS_QUANTITY) {
            return convertToDto(products);
        }

        List<Integer> randomIds = new ArrayList<>();
        for (
                int i = 0;
                i < RANDOM_PRODUCTS_QUANTITY; i++) {
            int random = (int) (Math.random() * products.size());
            if (!randomIds.contains(random)) {
                randomIds.add(random);
                Product product = products.get(random);
                GetProductCardDto productDTO = new GetProductCardDto();
                productDTO.setId(product.getId());
                productDTO.setTitle(product.getTitle());
                productDTO.setDescription((product.getDescription()));
                productDTO.setUrl_image(product.getUrl_main_image());
                productDTO.setCategory_name(product.getCategory().getTitle());
                productDTO.setCity_name(product.getCity().getTitle());
                productDTO.setIdCity(product.getCity().getId());
                productDTO.setUserOwner(product.getUserOwner().getId());
                productDTO.setAddress(product.getAddress());
                productDTO.setIdCategory(product.getCategory().getId());
                productDTO.setAttributes(product.getProductAttribute());

                if (policyRepository.findByProduct(product) != null) {
                    Policy policy = policyRepository.findByProduct(product);
                    productDTO.setHouse_rules(policy.getHouse_rules());
                    productDTO.setSecurity(policy.getSecurity());
                    productDTO.setCancellation_policy(policy.getCancellation_policy());
                }

                productsDTO.add(productDTO);
            } else {
                i--;
            }
        }

        return productsDTO;
    }


    public List<GetProductCardDto> findCardsByCategory(Integer id_category) throws ResourceNotFoundException {
        List<Product> products;
        List<GetProductCardDto> productsDTO = new ArrayList<>();
        if (categoryRepository.findById(id_category).isPresent()) {
            Category category = categoryRepository.findById(id_category).get();
            products = category.getProducts();
            return convertToDto(products);
        } else {
            throw new ResourceNotFoundException("Category with id " + id_category + " not found");
        }
    }

    public List<GetProductCardDto> findCardsByCity(Integer id_city) throws ResourceNotFoundException {
        List<Product> products;
        if (cityRepository.findById(id_city).isPresent()) {
            City city = cityRepository.findById(id_city).get();
            products = city.getProducts();
            return convertToDto(products);
        } else {
            throw new ResourceNotFoundException("City with id " + id_city + " not found");
        }
    }

    @Transactional
    public GetProductCardDto save(CreateProductDto createProductDto, MultipartFile[] images, MultipartFile mainImage) throws ResourceNotFoundException, BadRequestException {
        if (SecurityContextHolder.getContext().getAuthentication().getPrincipal() == null) {
            throw new BadRequestException("User not found");
        }
        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        User user = userRepository.findByEmail(userDetails.getUsername());

        ImageWithTitle mainImageWithTitle = bucketImageService.uploadMainImage(mainImage);
        List<ImageWithTitle> imagesWithTitle = bucketImageService.uploadFileWithTitle(images);

        Product product = new Product();
        if (createProductDto.getIdCategory() == null || categoryRepository.findById(createProductDto.getIdCategory()).isEmpty()) {
            throw new ResourceNotFoundException("Category not found");
        } else if (createProductDto.getIdCity() == null || cityRepository.findById(createProductDto.getIdCity()).isEmpty()) {
            throw new ResourceNotFoundException("City not found");
        } else if (createProductDto.getAddress() == null || createProductDto.getDescription() == null || createProductDto.getTitle() == null) {
            throw new BadRequestException("You need to complete every field");
        } else {
            product.setTitle(createProductDto.getTitle());
            product.setDescription(createProductDto.getDescription());
            product.setUrl_main_image(mainImageWithTitle.getUrl());
            product.setCity(cityRepository.findById(createProductDto.getIdCity()).orElse(null));
            product.setCategory(categoryRepository.findById(createProductDto.getIdCategory()).orElse(null));
            product.setAddress(createProductDto.getAddress());
            product.setUserOwner(user);
            List<Attribute> attributes = new ArrayList<>();
            for (GetAttributeDTO attribute : createProductDto.getAttributes()) {
                Attribute attribute1 = attributeRepository.findById(attribute.getId()).orElse(null);
                if (attributes.contains(attribute1)) {
                    throw new BadRequestException("You can not specify the same attribute more than one time");
                }
                attributes.add(attribute1);
            }
            product.setProductAttribute(attributes);


            Product newProduct = productRepository.save(product);

            policyRepository.save(new Policy(createProductDto.getHouse_rules(), createProductDto.getSecurity(), createProductDto.getCancellation_policy(), newProduct));


            for (ImageWithTitle image : imagesWithTitle) {
                Image image1 = new Image();
                image1.setURL(image.getUrl());
                image1.setTitle(image.getTitle());
                image1.setProduct(newProduct);
                imageService.save(image1);
            }
        }
        return findByIdCard(product.getId());
    }


    public String deleteById(Integer id) throws BadRequestException {
        if (productRepository.findById(id).isEmpty()) {
            throw new BadRequestException("Product not found");
        }

        Product product = productRepository.findById(id).get();

        if (SecurityContextHolder.getContext().getAuthentication().getPrincipal() == null) {
            throw new BadRequestException("User not found");
        }
        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        User user = userRepository.findByEmail(userDetails.getUsername());

        if (!Objects.equals(product.getUserOwner().getId(), user.getId())) {
            throw new BadRequestException("You can not delete this product as you are not the owner");
        }

        productRepository.deleteById(id);

        return "Product with id " + id + " deleted";

    }

    @Transactional
    public GetProductCardDto update(CreateProductDto createProductDto, String[] urlImages, String urlMainImage, MultipartFile[] uploadedImages, MultipartFile uploadedMainImage) throws ResourceNotFoundException, BadRequestException, ForbiddenException {
        if (urlImages == null && uploadedImages == null) {
            throw new BadRequestException("You need to specify at least one image");
        }

        if (urlMainImage == null && uploadedMainImage == null) {
            throw new BadRequestException("You need to specify one main image");
        }

        if (urlMainImage != null && uploadedMainImage != null) {
            throw new BadRequestException("You can just specify one main image");
        }

        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        User user = userRepository.findByEmail(userDetails.getUsername());

        if (createProductDto.getId() == null || productRepository.findById(createProductDto.getId()).isEmpty()) {
            throw new BadRequestException("You need to specify a valid id of product");
        }

        Product old_product = productRepository.findById(createProductDto.getId()).orElse(null);

        if (!Objects.equals(Objects.requireNonNull(old_product).getUserOwner().getId(), user.getId())) {
            throw new ForbiddenException("You can not update this product as you are not the owner");
        }

        Product product = new Product();
        if (createProductDto.getIdCategory() == null || categoryRepository.findById(createProductDto.getIdCategory()).isEmpty()) {
            throw new ResourceNotFoundException("Category not found");
        } else if (createProductDto.getIdCity() == null || cityRepository.findById(createProductDto.getIdCity()).isEmpty()) {
            throw new ResourceNotFoundException("City not found");
        } else if (productRepository.findById(createProductDto.getId()).isEmpty()) {
            throw new ResourceNotFoundException("Id not found");
        } else {
            product.setId(createProductDto.getId());
            product.setTitle(createProductDto.getTitle());
            product.setDescription(createProductDto.getDescription());

            if (uploadedMainImage == null) {
                product.setUrl_main_image(urlMainImage);
            } else {
                ImageWithTitle mainImageWithTitle = bucketImageService.uploadMainImage(uploadedMainImage);
                product.setUrl_main_image(mainImageWithTitle.getUrl());
            }

            product.setCity(cityRepository.findById(createProductDto.getIdCity()).orElse(null));
            product.setCategory(categoryRepository.findById(createProductDto.getIdCategory()).orElse(null));
            product.setAddress(createProductDto.getAddress());
            product.setUserOwner(user);
            List<Attribute> attributes = new ArrayList<>();
            for (GetAttributeDTO attribute : createProductDto.getAttributes()) {
                Attribute attribute1 = attributeRepository.findById(attribute.getId()).orElse(null);
                if (attributes.contains(attribute1)) {
                    throw new BadRequestException("You can not specify the same attribute more than one time");
                }
                attributes.add(attribute1);
            }
            product.setProductAttribute(attributes);
            if (policyRepository.findByProduct(old_product) != null) {
                Policy policy = policyRepository.findByProduct(old_product);
                policy.setCancellation_policy(createProductDto.getCancellation_policy());
                policy.setHouse_rules(createProductDto.getHouse_rules());
                policy.setSecurity(createProductDto.getSecurity());
                policyRepository.save(policy);
            } else {
                policyRepository.save(new Policy(createProductDto.getHouse_rules(), createProductDto.getSecurity(), createProductDto.getCancellation_policy(), product));
            }

            Product newProduct = productRepository.save(product);

            List<Image> images = imageRepository.findByProductId(old_product);

            if (urlImages == null) {
                imageRepository.deleteAll(images);
            } else {
                for (Image image : images) {
                    if (!Arrays.asList(urlImages).contains(image.getURL())) {
                        imageRepository.delete(image);
                    }
                }
            }

            if (uploadedImages != null) {
                List<ImageWithTitle> imagesWithTitle = bucketImageService.uploadFileWithTitle(uploadedImages);
                for (ImageWithTitle image : imagesWithTitle) {
                    Image image1 = new Image();
                    image1.setURL(image.getUrl());
                    image1.setTitle(image.getTitle());
                    image1.setProduct(newProduct);
                    imageService.save(image1);
                }
            }

            return findByIdCard(product.getId());
        }

    }

    public List<GetProductCardDto> findByUser() throws BadRequestException {
        if (SecurityContextHolder.getContext().getAuthentication().getPrincipal() == null) {
            throw new BadRequestException("User not found");
        }
        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        User user = userRepository.findByEmail(userDetails.getUsername());

        List<Product> products = productRepository.findByUserOwner(user);
        if (products.isEmpty()) {
            throw new BadRequestException("You have not created any product yet");
        }

        return convertToDto(products);
    }

    private List<GetProductCardDto> convertToDto(List<Product> products) {
        List<GetProductCardDto> productsDTO = new ArrayList<>();
        for (Product product : products) {
            GetProductCardDto productDTO = new GetProductCardDto();
            productDTO.setId(product.getId());
            productDTO.setTitle(product.getTitle());
            productDTO.setDescription((product.getDescription()));
            productDTO.setUrl_image(product.getUrl_main_image());
            productDTO.setCategory_name(product.getCategory().getTitle());
            productDTO.setCity_name(product.getCity().getTitle());
            productDTO.setIdCity(product.getCity().getId());
            productDTO.setIdCategory(product.getCategory().getId());
            productDTO.setAttributes(product.getProductAttribute());
            productDTO.setAddress(product.getAddress());
            productDTO.setUserOwner(product.getUserOwner().getId());

            if (policyRepository.findByProduct(product) != null) {
                Policy policy = policyRepository.findByProduct(product);
                productDTO.setHouse_rules(policy.getHouse_rules());
                productDTO.setSecurity(policy.getSecurity());
                productDTO.setCancellation_policy(policy.getCancellation_policy());
            }

            productsDTO.add(productDTO);

        }
        return productsDTO;
    }

}

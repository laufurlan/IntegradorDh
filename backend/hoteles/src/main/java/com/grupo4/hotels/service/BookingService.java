package com.grupo4.hotels.service;

import com.grupo4.hotels.dto.Booking.CreateBookingDto;
import com.grupo4.hotels.dto.Booking.DatesDto;
import com.grupo4.hotels.dto.Booking.GetBookingDto;
import com.grupo4.hotels.dto.Product.GetProductCardDto;
import com.grupo4.hotels.exception.BadRequestException;
import com.grupo4.hotels.exception.ForbiddenException;
import com.grupo4.hotels.model.Booking;
import com.grupo4.hotels.model.Product;
import com.grupo4.hotels.model.ReservedDates;
import com.grupo4.hotels.model.User;
import com.grupo4.hotels.repository.BookingRepository;
import com.grupo4.hotels.repository.ProductRepository;
import com.grupo4.hotels.repository.UserRepository;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Service
public class BookingService {

    private final BookingRepository bookingRepository;
    private final ProductRepository productRepository;
    private final UserRepository userRepository;

    public BookingService(BookingRepository bookingRepository, ProductRepository productRepository, UserRepository userRepository) {
        this.bookingRepository = bookingRepository;
        this.productRepository = productRepository;
        this.userRepository = userRepository;
    }

    public List<ReservedDates> findDateByProduct(Integer id_product) throws BadRequestException {
        Product product = productRepository.findById(id_product).orElse(null);
        if (product == null) {
            throw new BadRequestException("The prdouct with this id does not exist");
        }
        return bookingRepository.findReservedDatesByProduct(product);
    }

    public String createReservation(CreateBookingDto createBookingDto) throws BadRequestException {
        if (SecurityContextHolder.getContext().getAuthentication().getPrincipal() == null) {
            throw new BadRequestException("User not found");
        }
        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        User user = userRepository.findByEmail(userDetails.getUsername());

        Product product = productRepository.findById(createBookingDto.getProduct_id()).orElse(null);
        System.out.println(bookingRepository.findProductNotAvailable(createBookingDto.getInitial_date(), createBookingDto.getFinal_date(), product));
        if (bookingRepository.findProductNotAvailable(createBookingDto.getInitial_date(), createBookingDto.getFinal_date(), product).size() == 0) {
            Booking booking = new Booking();
            booking.setInitial_date(createBookingDto.getInitial_date());
            booking.setFinal_date(createBookingDto.getFinal_date());
            booking.setProduct(product);
            booking.setUser(user);
            bookingRepository.save(booking);

            return "Reservation created successfully";
        } else {
            throw new BadRequestException("The product is not available between this dates");
        }
    }

    public List<GetProductCardDto> getProductsByDate(DatesDto dates) throws BadRequestException {
        List<Product> products = bookingRepository.findProductsAvailable(dates.getInitial_date(), dates.getFinal_date());
        if (products.size() == 0) {
            throw new BadRequestException("There are no products available between this dates");
        }

        return convertToDto(products);
    }

    public List<GetBookingDto> getBookingsByUser() throws BadRequestException {
        if (SecurityContextHolder.getContext().getAuthentication().getPrincipal() == null) {
            throw new BadRequestException("User not found");
        }
        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        User user = userRepository.findByEmail(userDetails.getUsername());

        List<Booking> bookings = bookingRepository.findByUser(user);
        if (bookings.size() == 0) {
            throw new BadRequestException("There are no bookings for this user");
        }
        List<GetBookingDto> getBookingDtos = new ArrayList<>();
        for (Booking booking : bookings) {
            GetBookingDto getBookingDto = new GetBookingDto();
            getBookingDto.setReservation_id(booking.getId());
            getBookingDto.setInitial_date(booking.getInitial_date());
            getBookingDto.setFinal_date(booking.getFinal_date());
            getBookingDto.setProduct_id(booking.getProduct().getId());
            getBookingDtos.add(getBookingDto);
        }
        return getBookingDtos;
    }

    public String deleteBooking(GetBookingDto booking) throws BadRequestException, ForbiddenException {
        Booking bookingToDelete = bookingRepository.findById(booking.getReservation_id()).orElse(null);
        if (bookingToDelete == null) {
            throw new BadRequestException("The booking with this id does not exist");
        }
        if (SecurityContextHolder.getContext().getAuthentication().getPrincipal() == null) {
            throw new BadRequestException("User not found");
        }
        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        User user = userRepository.findByEmail(userDetails.getUsername());

        if (Objects.equals(bookingToDelete.getUser().getId(), user.getId())) {
            bookingRepository.delete(bookingToDelete);
            return "Reservation deleted successfully";
        } else {
            throw new ForbiddenException("You can't delete this reservation as you are not the owner");
        }

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
            productsDTO.add(productDTO);
        }
        return productsDTO;
    }

}

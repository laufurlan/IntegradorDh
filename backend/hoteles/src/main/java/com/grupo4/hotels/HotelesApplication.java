package com.grupo4.hotels;



import com.grupo4.hotels.model.*;
import com.grupo4.hotels.repository.*;
import com.grupo4.hotels.service.CityService;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;

import java.time.LocalDate;
import java.util.Collections;
import java.util.Optional;

@SpringBootApplication
public class HotelesApplication {

	public static void main(String[] args) {
		//SpringApplication.run(HotelesApplication.class, args);

		ApplicationContext context =SpringApplication.run(HotelesApplication.class, args);

		//System.out.println(context.getBean(ProductRepository.class).findAll());

		//Optional ciudad=context.getBean(CityRepository.class).findById((1));



		//Optional categoria=context.getBean(CategoryRepository.class).findById((1));

		//Category category1= (Category) categoria.get();

		//Product Producto1= new Product("primer producto",category1,ciudad1,"url");

		//System.out.println((Producto1));
		//System.out.println(context.getBean(ProductRepository.class).findByCity(ciudad1));

		//System.out.println(context.getBean(ProductRepository.class).findById((1)));
		//Product Producto2= context.getBean(ProductRepository.class).findById(9).orElse(null);
		//System.out.println(context.getBean(ProductRepository.class).findAttributes(Producto2));
		//System.out.println(context.getBean(ProductAttributeRepository.class).findAll());
		 //context.getBean(ProductRepository.class).deleteById(1);
		//System.out.println(context.getBean(RoleRepository.class).findAll());

//		Role role1=context.getBean(RoleRepository.class).findById(1).orElse(null) ;
//		//System.out.println(role1	);
//		//System.out.println(context.getBean(UserRepository.class).findByRole(role1));
//		Product product1 =(context.getBean(ProductRepository.class).findById(1).orElse(null));
//		System.out.println(context.getBean(ProductRepository.class).findProductsNotAvaible(LocalDate.of(2021,8,19),LocalDate.of(2021,9,19),product1));

//		RoleRepository roleRepository = context.getBean(RoleRepository.class);
//		Role role1 = roleRepository.findById(1);
//		System.out.println(role1);
	}

}

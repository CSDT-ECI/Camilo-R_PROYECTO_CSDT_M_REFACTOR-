package com.soft.tienda.app;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@EntityScan("com.soft.tienda.entities")
@ComponentScan(basePackages = {"com.soft.tienda"})
public class SofTiendaApplication {

	public static void main(String[] args) {
		SpringApplication.run(SofTiendaApplication.class, args);
	}

}

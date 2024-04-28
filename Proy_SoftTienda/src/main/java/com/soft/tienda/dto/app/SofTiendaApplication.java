package com.soft.tienda.dto.app;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@EnableJpaRepositories(basePackages = "com.soft.tienda.repositories")
@EntityScan("com.soft.tienda.entities")
@ComponentScan(basePackages = {"com.soft.tienda"})
public class SofTiendaApplication {

	public static void main(String[] args) {
		SpringApplication.run(SofTiendaApplication.class, args);
	}

}

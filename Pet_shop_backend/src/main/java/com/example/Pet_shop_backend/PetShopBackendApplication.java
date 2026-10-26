package com.example.Pet_shop_backend;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.example.Pet_shop_backend.mapper")
public class PetShopBackendApplication {

	public static void main(String[] args) {
		SpringApplication.run(PetShopBackendApplication.class, args);
	}

}

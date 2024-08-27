package com.toprakrehberi.backend;

import com.toprakrehberi.backend.controllers.UserController;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;


@SpringBootApplication
public class ToprakRehberiBackendApplication {

	public static void main(String[] args) {
		SpringApplication.run(ToprakRehberiBackendApplication.class, args);
		};
}

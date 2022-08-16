package com.spring_app;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

@SpringBootApplication
//@EnableAutoConfiguration(exclude={DataSourceAutoConfiguration.class})
public class SpringAppApplication {

	public static void main(String[] args) {
		try{
			SpringApplication.run(SpringAppApplication.class, args);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}

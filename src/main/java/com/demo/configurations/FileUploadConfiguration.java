package com.demo.configurations;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
@ComponentScan("org.o7planning.springmvcfileud.*")
public class FileUploadConfiguration implements WebMvcConfigurer{

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/uploads/**")
			.addResourceLocations("/uploads/");
	}
	
//    @Bean(name = "multipartResolver")
//    public MultipartResolver getMultipartResolver() {
//        CommonsMultipartResolver resover = new CommonsMultipartResolver();
//        // 15MB
//        resover.setMaxUploadSize(15 * 1024 * 1024);
//
//        return resover;
//    }
}

//package com.oracle.hellong;
//
//import org.springframework.context.annotation.Configuration;
//import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
//import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
//
//@Configuration
//public class WebConfig implements WebMvcConfigurer {
//    private String resourcePath = "file:///C:/backup/";// 실제 파일 저장 경로 
//    private String uploadPath = "/upload/**"; // view에서 사용할 경로
//
//
//    @Override
//    public void addResourceHandlers(ResourceHandlerRegistry registry) {
//        registry.addResourceHandler(uploadPath).addResourceLocations(resourcePath);
//    }
//}

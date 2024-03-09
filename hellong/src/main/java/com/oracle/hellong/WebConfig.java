//jh
//package com.oracle.hellong;
//
//import org.springframework.context.annotation.Configuration;
//import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
//import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
//
//@Configuration
//public class WebConfig implements WebMvcConfigurer {
//
//    private String resourcePath1 = "file:///C:/backup/"; 
//    private String uploadPath1 = "/upload/**"; 
//
//    private String resourcePath2 = "file:///C:/trbackup/"; 
//    private String uploadPath2 = "/trainerUpload/**"; 
//
//    @Override
//    public void addResourceHandlers(ResourceHandlerRegistry registry) {
//        registry.addResourceHandler(uploadPath1).addResourceLocations(resourcePath1);       
//        registry.addResourceHandler(uploadPath2).addResourceLocations(resourcePath2);
//    }
//}





//kwon
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
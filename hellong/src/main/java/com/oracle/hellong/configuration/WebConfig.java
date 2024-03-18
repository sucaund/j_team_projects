package com.oracle.hellong.configuration;

import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

	  private String resourcePath1 = "file:///C:/backup/"; 
	  private String uploadPath1 = "/upload/**"; 
	
	  private String resourcePath2 = "file:///C:/trbackup/"; 
	  private String uploadPath2 = "/trainerUpload/**"; 
	
	  private String resourcePath3 = "file:///C:/Users/admin/git/j_team_projects/hellong/uploads/";// 실제 파일 저장 경로 
	  private String uploadPath3 = "/upload3/**"; // view에서 사용할 경로
	  
	  @Override
	  public void addResourceHandlers(ResourceHandlerRegistry registry) {
	      registry.addResourceHandler(uploadPath1).addResourceLocations(resourcePath1);       
	      registry.addResourceHandler(uploadPath2).addResourceLocations(resourcePath2);
	      registry.addResourceHandler(uploadPath3).addResourceLocations(resourcePath3);
	  }
	  
	  @Bean
	     public PlatformTransactionManager transactionManager(DataSource dataSource) {
	         return new DataSourceTransactionManager(dataSource);
	     }
	  

	//    private String resourcePath = "file:///C:/Users/admin/git/j_team_projects/hellong/uploads/";// 실제 파일 저장 경로 
    // private String uploadPath = "/upload/**"; // view에서 사용할 경로


    // @Override
    // public void addResourceHandlers(ResourceHandlerRegistry registry) {
    //     registry.addResourceHandler("/upload/**").addResourceLocations("file:///C:/Users/admin/git/j_team_projects/hellong/uploads/");
    // }
}
	
	




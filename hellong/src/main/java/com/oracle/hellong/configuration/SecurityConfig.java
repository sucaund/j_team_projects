package com.oracle.hellong.configuration;

import org.springframework.boot.autoconfigure.security.reactive.PathRequest;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.firewall.DefaultHttpFirewall;
import org.springframework.security.web.firewall.HttpFirewall;

import lombok.RequiredArgsConstructor;

@Configuration
@EnableWebSecurity
@EnableMethodSecurity
@RequiredArgsConstructor
public class SecurityConfig{
	
	@Bean
	public BCryptPasswordEncoder encodePwd() {
		return new BCryptPasswordEncoder();
	}
	
//	 @Bean
//	  public WebSecurityCustomizer webSecurityCustomizer() {
//	        return (web) -> web.ignoring().requestMatchers(PathRequest.toStaticResources().atCommonLocations());
//	                
//	    }
	 
//	 @Bean
//	    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
//
//	        http
//	                .csrf(AbstractHttpConfigurer::disable) //로컬에서 확인 위해 비활성화
//	                .authorizeHttpRequests(requests -> requests
//	                        .requestMatchers("/", "/jm/jmLogin", "/join").permitAll()
//	                        .anyRequest().authenticated() //로그인 페이지는 로그인 페이지없이 접근 가능하도록
//	                )
//	                .formLogin(form -> form
//	                        .loginPage("/login")
//	                        .defaultSuccessUrl("/", true)
//	                        .permitAll()
//	                )
//	                .logout(logout -> logout
//	                        .permitAll());
//
//	        return http.build();
//	    }
	
	@Bean
	protected SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
		http.cors(cors -> cors.disable())
		    .csrf(csrf -> csrf.disable()) //사이트 위변조 요청 방지
		    
		    ;
		
		return http.build(); //0649
	}
	
	
	

}
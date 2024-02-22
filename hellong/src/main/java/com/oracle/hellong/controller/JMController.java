package com.oracle.hellong.controller;


import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;

import com.oracle.hellong.service.jm.JMService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class JMController {
	
	
<<<<<<< Updated upstream
	private final JavaMailSender mailSender; // 이것또한 생성자 생성됨 
=======


>>>>>>> Stashed changes


	private final JMService jm;


}

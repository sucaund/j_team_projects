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

	private final JMService jm;
	




}

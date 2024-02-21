package com.oracle.hellong.controller;

import org.springframework.stereotype.Controller;

import com.oracle.hellong.service.jh.JHService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class JHController {
	private final JHService jh;
	
}

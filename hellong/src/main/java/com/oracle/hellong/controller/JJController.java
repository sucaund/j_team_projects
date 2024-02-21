package com.oracle.hellong.controller;

import org.springframework.stereotype.Controller;

import com.oracle.hellong.service.jj.JJService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class JJController {
	private final JJService jj;
	
}

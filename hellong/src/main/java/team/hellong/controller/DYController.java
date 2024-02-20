package team.hellong.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import team.hellong.service.DYService;

@Controller
@RequiredArgsConstructor
@Slf4j
public class DYController {
	private final DYService ds;
	
	@GetMapping()
	public void dyHello() { //이름 규칙 권장
		
	}
}

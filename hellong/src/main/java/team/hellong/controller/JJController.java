package team.hellong.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import team.hellong.service.JJService;

@Controller
@RequiredArgsConstructor
@Slf4j
public class JJController {
	private final JJService jj;
	
	@GetMapping()
	public void jjHello() { //이름 규칙 권장
		
	}
}

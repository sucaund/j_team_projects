package team.hellong.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import team.hellong.service.JMService;

@Controller
@RequiredArgsConstructor
@Slf4j
public class JMController {
	private final JMService jm;
	
	@GetMapping()
	public void jmHello() { //이름 규칙 권장
		
	}
}

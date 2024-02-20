package team.hellong.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import team.hellong.service.JHService;

@Controller
@RequiredArgsConstructor
@Slf4j
public class JHController {
	private final JHService jh;
	
	@GetMapping()
	public void jhHello() { //이름 규칙 권장
		
	}
}

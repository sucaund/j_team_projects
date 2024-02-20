package team.hellong.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import team.hellong.service.SHService;

@Controller
@RequiredArgsConstructor
@Slf4j
public class SHController {
	private final SHService sh;
	
	@GetMapping()
	public void shHello() { //이름 규칙 권장
		
	}
}

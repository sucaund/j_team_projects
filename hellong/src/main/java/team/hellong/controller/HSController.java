package team.hellong.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import team.hellong.service.HSService;

@Controller
@RequiredArgsConstructor
@Slf4j
public class HSController {
	 private final HSService hs;
	 
	 @GetMapping()
		public void hsHello() { //이름 규칙 권장
			
		}
}

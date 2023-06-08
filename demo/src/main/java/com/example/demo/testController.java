package com.example.demo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class testController {

	@GetMapping("/test")
	public String testtest() {
		System.out.println("테스트 컨트롤러 호출");
		return "test";
	}
}

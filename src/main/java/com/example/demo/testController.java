package com.example.demo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class testController {

	@RequestMapping("/test")
	public String testtest() {
		System.out.println("테스트 컨트롤러 호출");
		return "test";
	}

	
	@RequestMapping("/sunblock")
	public String testtest2() {
		System.out.println("저는 sunblock 호출입니다.");
		return "test";
	}
}

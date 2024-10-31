package com.example.sakila.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;
@Slf4j // 이 클래스에서 log라는 변수 사용가능 - lombok
@Controller
public class Hello {
	@GetMapping("/hello")
	public String hello() {
		// System.out.println("디버깅 코드");
		// login 프레임워크 사용
		log.debug("gg");
		return "hello";
	}
}

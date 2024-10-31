package com.example.sakila;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@SpringBootApplication // 제일 먼저 실행해라
public class SakilaApplication implements WebMvcConfigurer {
	@Autowired
	private OnInterceptor onInterceptor;
	@Autowired
	private OffInterceptor offInterceptor;

	public static void main(String[] args) { // main 메서드 제일 먼저 실행
		SpringApplication.run(SakilaApplication.class, args); // 자기 자신 실행
	}
	
	// 인터셉터 설정(1.인터셉터 클래스 구현 2.인터셉터 맵핑)
	@Override
	public void addInterceptors(InterceptorRegistry registry) { // InterceptorRegistry: 인터셉터 리스트(맵핑 가능)
		// /on/*오로 시작하는 컨트롤러 가로채 onInterceptor.preHandle(request, respone)
		registry.addInterceptor(onInterceptor).addPathPatterns("/on/**");
		registry.addInterceptor(offInterceptor).addPathPatterns("/off/**");
		WebMvcConfigurer.super.addInterceptors(registry);
	}

}

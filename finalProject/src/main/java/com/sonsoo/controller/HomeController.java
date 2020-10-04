package com.sonsoo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/*")
@AllArgsConstructor
public class HomeController {

	@GetMapping("/home")
	
	public String getHome() {
		
		return "/home";
		
	}
	
	@GetMapping("/msg/message")
	public String getMessage() {
		
		return "/msg/message";
		
	}
	
	@GetMapping("/chart/chart")
	public String getChart() {
		
		return "/chart/chart";
		
	}
	
}

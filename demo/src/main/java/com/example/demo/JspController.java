package com.example.demo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/jsp")
public class JspController {

	@GetMapping("/sample")
	public String sample() {
		return "jsp/sample";
	}
	
	@GetMapping("/schedule")
	public String schedule() {
		return "jsp/schedule";
	}
	
	
}

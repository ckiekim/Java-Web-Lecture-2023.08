package com.example.demo;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class DemoController {
	
	// localhost:8080/demo/index
	@GetMapping("/index")
	@ResponseBody
	public String index() {
		return "<h1>Hello World!!!</h1>";
	}
	
	@GetMapping("/hello")
	public String hello() {
		return "01.hello";
	}
	
	@GetMapping("/login")
	public String login() {
		return "02.login";
	}
	
	@PostMapping("/login") 
//	@ResponseBody
	public String loginProc(HttpServletRequest req, Model model) {
		String uid = req.getParameter("uid");		// "uid" 가 input tag의 name 값
		String pwd = req.getParameter("pwd");
//		return "<h1>uid=" + uid + ", pwd=" + pwd + "</h1>";
		
		model.addAttribute("uid", uid);
		model.addAttribute("pwd", pwd);
		return "03.loginResult";
	}
}

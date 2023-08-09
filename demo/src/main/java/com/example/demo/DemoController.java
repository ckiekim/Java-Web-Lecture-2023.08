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
	
	@GetMapping("/getParam")
	@ResponseBody
	public String getParam(HttpServletRequest req) {
		String a_ = req.getParameter("a");
		String b_ = req.getParameter("b");
		String op = req.getParameter("op");
		int a = Integer.parseInt(a_);
		int b = Integer.parseInt(b_);
		int result = 0;
		String oper = "";
		switch(op) {
		case "add":
			result = a + b; oper = "+";
			break;
		case "sub":
			result = a - b; oper = "-";
			break;
		case "mul":
			result = a * b; oper = "*";
			break;
		case "div":
			result = (int) (a / b); oper = "/";
			break;
		default:
			result = 0;
		}
		return "<h1>" + a + " " + oper + " " + b + " = " + result + "</h1>";
	}
	
	@GetMapping("/calc")
	public String calcForm() {
		return "04.calcForm";
	}
	
	@PostMapping("/calc")
	public String calcProc(int a, int b, String op, Model model) {
		int result = 0;
		String oper = "";
		switch(op) {
		case "add":
			result = a + b; oper = "+";
			break;
		case "sub":
			result = a - b; oper = "-";
			break;
		case "mul":
			result = a * b; oper = "*";
			break;
		case "div":
			result = (int) (a / b); oper = "/";
			break;
		default:
			result = 0;
		}
		model.addAttribute("a", a);
		model.addAttribute("b", b);
		model.addAttribute("oper", oper);
		model.addAttribute("result", result);
		return "05.calcResult";
	}
	
}

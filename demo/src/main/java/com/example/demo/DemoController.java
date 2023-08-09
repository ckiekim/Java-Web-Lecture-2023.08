package com.example.demo;

import java.util.Stack;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class DemoController {
	String a_ = null, b_ = null, op = null;
	int a = 0, b = 0, result = 0;
	
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
	
	@GetMapping("/write")
	public String writeForm() {
		return "06.writeForm";
	}
	
	@PostMapping("/write")
	public String writeProc(HttpServletRequest req, Model model) {
		String title = req.getParameter("title");
		String[] languages = req.getParameterValues("language");
		String content = req.getParameter("content");
		
		String joinLanguages = (languages == null) ? "" : String.join(", ", languages);
		Board board = new Board(title, joinLanguages, content.replace("\n", "<br>"));
//		System.out.println(board);
		model.addAttribute("board", board);
		return "07.writeResult";
	}
	
	@GetMapping("/calculator")
	public String calculatorForm(String eval, Model model) {
		model.addAttribute("eval", eval);
		return "08.calculator";
	}
	
//		Object obj = session.getAttribute("stack");
//		Stack<Object> stack = (obj == null) ? new Stack<>() : (Stack) obj;
	
	@PostMapping("/calculator")
	public String calculatorProc(HttpServletRequest req, Model model) {
		String num_ = req.getParameter("num");
		String op_ = req.getParameter("op");
		String eval = req.getParameter("eval");
		if (eval == null)
			eval = "";
		
		if (num_ != null) {
			eval += num_;
			if (a_ == null) {
				a_ = num_;
				a = Integer.parseInt(a_);
			} else if (b_ == null) {
				b_ = num_;
				b = Integer.parseInt(b_);
			}
			model.addAttribute("eval", eval);
		} else if (op_ != null) {
			if (op_.equals("C")) {
				eval = "";
				a_ = null; b_ = null; op = null;
				a = 0; b = 0;
				model.addAttribute("eval", eval);
			} else if (op_.equals("=")) {
				switch(op) {
				case "+": result = a + b; break;
				case "-": result = a - b; break;
				case "*": result = a * b; break;
				case "/": result = (int) (a / b); break;
				default: result = 0;
				}
				a_ = null; b_ = null; op = null;
				a = 0; b = 0;
				model.addAttribute("eval", result);
			} else {
				eval += " " + op_ + " ";
				op = op_;
				model.addAttribute("eval", eval);
			}
		}
		return "08.calculator";
	}
	
}

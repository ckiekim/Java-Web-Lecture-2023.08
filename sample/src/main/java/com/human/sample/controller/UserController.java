package com.human.sample.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.human.sample.entity.User;

@Controller
@RequestMapping("/user")
public class UserController {

	@GetMapping("/register")
	public String register() {
		return "user/register";
	}
	
	@PostMapping("/register")
	public String registerProc(String uid, String pwd, String pwd2, String uname, String email) {
		User u = new User(uid, pwd, uname, email);
		System.out.println(u);
		return "redirect:/home";
	}
	
}

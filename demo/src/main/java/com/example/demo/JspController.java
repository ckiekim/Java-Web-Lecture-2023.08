package com.example.demo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/jsp")
public class JspController {

	@GetMapping("/sample")
	public String sample(Model model) {
		model.addAttribute("menu", "ai");
		return "jsp/sample";
	}
	
	@GetMapping("/schedule")
	public String schedule(Model model) {
		model.addAttribute("menu", "schedule");
		return "jsp/schedule";
	}
	
	@GetMapping("/elOperator")
	public String elOperator() {
		return "jsp/el1_operator";
	}

	@GetMapping("/elScope")
	public String elScope(HttpSession session, Model model) {
		session.setAttribute("sName", "sName");
		model.addAttribute("mName", "mName");
		session.setAttribute("name", "sName");
		model.addAttribute("name", "mName");
		return "jsp/el2_scope";
	}
	
	@GetMapping("/elCollections")
	public String elCollections(Model model) {
		//String[] fruits = {"참외", "수박", "복숭아", "토마토"};
		String[] fruits = "참외,수박,복숭아,토마토".split(",");
		model.addAttribute("fruitArray", fruits);
		
		List<String> sports = new ArrayList<>();
		sports.add("축구"); sports.add("야구"); sports.add("배구");
		model.addAttribute("sportsList", sports);
		
		Map<String, String> map = new HashMap<>();
		map.put("key", "el"); map.put("value", "jstl");
		model.addAttribute("map", map);
		return "jsp/el3_collections";
	}
	
	@GetMapping("/elPojo")
	public String elPojo(Model model) {
		Address addr1 = new Address(12345, "LA", "미국");
		Address addr2 = new Address(67890, "뉴욕", "미국");
		Member m1 = new Member(101, "제임스", addr1);
		Member m2 = new Member(102, "마리아", addr2);
		model.addAttribute("m1", m1);
		model.addAttribute("m2", m2);
		
		Member[] members = {m1, m2};
		model.addAttribute("memberArray", members);
		
		List<Member> list = new ArrayList<>();
		list.add(m1); list.add(m2);
		model.addAttribute("memberList", list);
		return "jsp/el4_pojo";
	}
	
}

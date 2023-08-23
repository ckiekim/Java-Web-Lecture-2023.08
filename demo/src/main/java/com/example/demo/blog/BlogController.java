package com.example.demo.blog;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/blog")
public class BlogController {
	@Autowired private BlogDao bDao;

	@GetMapping("/list")
	public String list(@RequestParam(name="f", defaultValue="title") String field,
			   @RequestParam(name="q", defaultValue="") String query,
			   Model model) {
		List<Blog> list = bDao.getBlogList(field, query);
		model.addAttribute("blogList", list);
		model.addAttribute("field", field);
		model.addAttribute("query", query);
		model.addAttribute("menu", "blog");
		return "blog/list";
	}
}

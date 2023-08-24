package com.example.demo.blog;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/blog")
public class BlogController {
//	private BlogDao bDao = new BlogDao();
	@Autowired private BlogDao bDao;		// Spring에서 BlogDao() 객체를 생성해서 inject
	
	@GetMapping("/list")
	public String list(Model model) {
		List<Blog> list = bDao.getBlogList("title", "");
		model.addAttribute("blogList", list);
		model.addAttribute("menu", "blog");
		return "blog/list";
	}
	
	@GetMapping("/write")
	public String writeForm(Model model) {
		model.addAttribute("menu", "blog");
		return "blog/write";
	}
	
	@PostMapping("/write")
	public String writeProc(Blog blog) {
//		Blog blog = new Blog(penName, title, content);
		bDao.insertBlog(blog);
		return "redirect:/blog/list";
	}
}

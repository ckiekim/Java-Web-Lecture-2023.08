package com.example.demo.blog;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/blog")
public class BlogController {
//	private BlogDao bDao = new BlogDao();
//	@Autowired private BlogDao bDao;		// Spring에서 BlogDao() 객체를 생성해서 inject
	@Autowired private BlogService blogService;
	
	@GetMapping("/list")
	public String list(@RequestParam(name="f", defaultValue="title") String field, 
						@RequestParam(name="q", defaultValue="") String query, 
						Model model) {
		List<Blog> list = blogService.getBlogList(field, query);
		model.addAttribute("blogList", list);
		model.addAttribute("menu", "blog");
		model.addAttribute("field", field);
		model.addAttribute("query", query);
		return "blog/list";
	}
	
	@GetMapping("/write")
	public String writeForm(Model model) {
		model.addAttribute("menu", "blog");
		return "blog/write";
	}
	
	@PostMapping("/write")
	public String writeProc(Blog blog) {
//	public String writeProc(String penName, String title, String content) {
//		Blog blog = new Blog(penName, title, content);
		blogService.insertBlog(blog);
		return "redirect:/blog/list";
	}
	
	@GetMapping("/detail/{bid}")
	public String detail(@PathVariable int bid, String option, Model model) {
		if (option == null || option.equals(""))
			blogService.increaseViewCount(bid);		// DNI option이 설정되어 있으면 조회수를 증가시키지 않음
		Blog blog = blogService.getBlog(bid);
		model.addAttribute("blog", blog);
		model.addAttribute("menu", "blog");
		return "blog/detail";
	}
	
	@GetMapping("/update/{bid}")
	public String updateForm(@PathVariable int bid, Model model) {
		Blog blog = blogService.getBlog(bid);
		model.addAttribute("blog", blog);
		model.addAttribute("menu", "blog");
		return "blog/update";
	}
	
	@PostMapping("/update")
	public String updateProc(Blog blog) {
//	public String updateProc(int bid, String penName, String title, String content) {
//		Blog blog = new Blog(bid, penName, title, content);
		blogService.updateBlog(blog);
		return "redirect:/blog/detail/" + blog.getBid() + "?option=DNI";
	}
	
	@GetMapping("/delete/{bid}")
	public String delete(@PathVariable int bid, Model model) {
		model.addAttribute("bid", bid);
		model.addAttribute("menu", "blog");
		return "blog/delete";
	}
	
	@GetMapping("/deleteConfirm/{bid}")
	public String deleteConfirm(@PathVariable int bid) {
		blogService.deleteBlog(bid);
		return "redirect:/blog/list";
	}
	
}

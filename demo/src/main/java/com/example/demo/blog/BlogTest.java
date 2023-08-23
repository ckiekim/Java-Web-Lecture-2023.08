package com.example.demo.blog;

import java.util.List;

public class BlogTest {

	public static void main(String[] args) {
		BlogDao bDao = new BlogDao();
		
//		Blog blog = new Blog("프로그래머", "자바", "자바는 객체지향 프로그램...");
//		bDao.insertBlog(blog);
		
//		Blog b = bDao.getBlog(3);
//		Blog blog = bDao.getBlog(4);
//		blog.setTitle("파이썬");
//		blog.setContent("파이썬은 배우기 쉬운 프로그래밍 언어입니다.");
//		bDao.updateBlog(blog);
		
//		bDao.deleteBlog(2);
		
		bDao.increaseViewCount(1); bDao.increaseViewCount(3);
		bDao.increaseViewCount(1); bDao.increaseViewCount(4);
		
		List<Blog> list = bDao.getBlogList("title", "");
		for (Blog b: list)
			System.out.println(b);
	}

}

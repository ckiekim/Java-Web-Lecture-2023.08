package com.example.demo.blog;

import java.util.List;

public interface BlogService {

	Blog getBlog(int bid);
	
	List<Blog> getBlogList(String field, String query);
	
	void insertBlog(Blog blog);
	
	void updateBlog(Blog blog);
	
	void deleteBlog(int bid);
	
	void increaseViewCount(int bid);
	
}

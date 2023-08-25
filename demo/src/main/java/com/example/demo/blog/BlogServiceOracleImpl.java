package com.example.demo.blog;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BlogServiceOracleImpl implements BlogService {
	@Autowired private BlogDaoOracle blogDao;

	@Override
	public Blog getBlog(int bid) {
		Blog blog = blogDao.getBlog(bid);
		return blog;
	}

	@Override
	public List<Blog> getBlogList(String field, String query) {
		query = "%" + query + "%";
		List<Blog> list = blogDao.getBlogList(field, query);
		return list;
	}

	@Override
	public void insertBlog(Blog blog) {
		blogDao.insertBlog(blog);
	}

	@Override
	public void updateBlog(Blog blog) {
		blogDao.updateBlog(blog);
	}

	@Override
	public void deleteBlog(int bid) {
		blogDao.deleteBlog(bid);
	}

	@Override
	public void increaseViewCount(int bid) {
		blogDao.increaseViewCount(bid);
	}

}

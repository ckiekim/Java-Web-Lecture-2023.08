package com.human.sample.service;

import java.util.List;

import com.human.sample.entity.User;

public interface UserService {
	public static final int CORRECT_LOGIN = 0;
	public static final int WRONG_PASSWORD = 1;
	public static final int UID_NOT_EXIST = 2;
	public static final int RECORDS_PER_PAGE = 5;	// 한 페이지당 10개 레코드를 보여줌
	
	int getUserCount();		// pagination을 위해 사용됨
	
	User getUser(String uid);
	
	List<User> getUserList(int page);
	
	void insertUser(User user);
	
	void updateUser(User user);
	
	void deleteUser(String uid);
	
	int login(String uid, String pwd);
	
}

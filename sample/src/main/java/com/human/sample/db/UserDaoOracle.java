package com.human.sample.db;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.human.sample.entity.User;

@Mapper
public interface UserDaoOracle {

	@Select("select * from users where \"uid\"=#{uid}")
	public User getUser(String uid);
	
	// #{uid} --> user.getUid()
	@Insert("insert into users values (#{uid}, #{pwd}, #{uname}, #{email}, default, default)")
	public void insertUser(User user);
	
}

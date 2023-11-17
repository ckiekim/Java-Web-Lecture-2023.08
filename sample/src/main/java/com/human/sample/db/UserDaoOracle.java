package com.human.sample.db;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.human.sample.entity.User;

@Mapper
public interface UserDaoOracle {

	@Select("select count(uname) from users where isDeleted=0")
	public int getUserCount();
	
	@Select("select * from users where \"uid\"=#{uid}")
	public User getUser(String uid);
	
	// #{uid} --> user.getUid()
	@Insert("insert into users values (#{uid}, #{pwd}, #{uname}, #{email}, default, default)")
	public void insertUser(User user);

	@Select("select * from (select rownum rnum, a.* from"
			+ "    (select * from users where isDeleted=0) a"
			+ "    where rownum <= #{limit}) where rnum > #{offset}")
	public List<User> getUserList(int offset, int limit);
	
}

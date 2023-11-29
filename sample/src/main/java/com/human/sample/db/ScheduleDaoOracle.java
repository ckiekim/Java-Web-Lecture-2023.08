package com.human.sample.db;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.human.sample.entity.Schedule;

@Mapper
public interface ScheduleDaoOracle {

	@Select("SELECT * FROM schedule"
			+ "  WHERE \"uid\"=#{uid} and sdate >= #{startDate} and sdate <= #{endDate}"
			+ "  ORDER BY startTime")
	List<Schedule> getSchedList(String uid, String startDate, String endDate);
	
	@Insert("INSERT INTO schedule VALUES"
			+ " (DEFAULT, #{uid}, #{sdate}, #{title}, #{place, jdbcType=VARCHAR},"
			+ " #{startTime}, #{endTime, jdbcType=VARCHAR}, #{isImportant}, #{memo, jdbcType=VARCHAR})")
	void insert(Schedule schedule);
	
	@Select("select * from schedule where sid=#{sid}")
	Schedule getSchedule(int sid);
	
	@Update("update schedule set \"uid\"=#{uid}, sdate=#{sdate}, title=#{title},"
			+ " place=#{place, jdbcType=VARCHAR}, startTime=#{startTime}, endTime=#{endTime, jdbcType=VARCHAR}, "
			+ " isImportant=#{isImportant}, memo=#{memo, jdbcType=VARCHAR}"
			+ " where sid=#{sid}")
	void update(Schedule schedule);
	
	@Delete("delete from schedule where sid=#{sid}")
	void delete(int sid);
	
}

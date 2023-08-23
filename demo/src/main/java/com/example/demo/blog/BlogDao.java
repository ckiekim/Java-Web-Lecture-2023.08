package com.example.demo.blog;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

//@Component
public class BlogDao {
//	@Value("${spring.datasource.url}") private String url;
//	@Value("${spring.datasource.username}") private String username;
//	@Value("${spring.datasource.password}") private String password;

	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String username = "hmuser";
	private String password = "hmpass";
	
	public Blog getBlog(int bid) {
		String sql = "select * from blog where bid=?";
		Blog blog = null;
		try {
			Connection conn = DriverManager.getConnection(url, username, password);
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bid);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				bid = rs.getInt(1);
				String penName = rs.getString(2);
				String title = rs.getString(3);
				String content = rs.getString(4);
				String modTime = rs.getString(5);
				int viewCount = rs.getInt(6);
				int isDeleted = rs.getInt(7);
				blog = new Blog(bid, penName, title, content, 
						LocalDateTime.parse(modTime.substring(0, 19).replace(" ", "T")),
						viewCount, isDeleted);
			}
			rs.close(); pstmt.close(); conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return blog;
	}
}

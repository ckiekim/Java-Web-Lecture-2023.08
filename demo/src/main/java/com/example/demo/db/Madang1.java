package com.example.demo.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class Madang1 {

	public static void main(String[] args) {
		Connection conn = null;
		Statement stmt = null;
		try {
			conn = DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:xe",
					"hmuser", "hmpass");
			stmt = conn.createStatement();
			String sql = "select * from customer";
			
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				int custid = rs.getInt(1);				// 첫번째 컬럼, 정수형
				String name = rs.getString(2);		// 두번째 컬럼, String type
				String address = rs.getString(3);
				String phone = rs.getString(4);
				System.out.printf("%d, %s, %s, %s%n", custid, name, address, phone);
			}
			rs.close();
			stmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}

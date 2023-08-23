package com.example.demo.oracle;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class CustomerDao {
	private String host;
	private String user;
	private String password;
	private String database;
	private int port;
	
	public CustomerDao() {
		// 아래 코드는 임시용
		this.host = "localhost";
		this.user = "hmuser";
		this.password = "hmpass";
		this.database = "xe";
		this.port = 1521;
		// 접속과 관련한 정보를 파일에 저장해서 보관하고, 이곳에서 읽어서 셋팅함.
	}
	Connection myConnection() {
		Connection conn = null;
		try {
			String connStr = "jdbc:oracle:thin:@" + host + ":" + port + ":" + database;
			conn = DriverManager.getConnection(connStr, user, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	public Customer getCustomer(int custId) {
		Connection conn = myConnection();
		String sql = "select * from customer where custid=?";
		Customer customer = null;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, custId);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				custId = rs.getInt(1);
				String name = rs.getString(2);
				String addr = rs.getString(3);
				String phone = rs.getString(4);
				customer = new Customer(custId, name, addr, phone);
			}
			rs.close(); pstmt.close(); conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return customer;
	}
	
	public List<Customer> getCustomerList() {
		Connection conn = myConnection();
		String sql = "select * from customer";
		List<Customer> list = new ArrayList<>();
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				int custId = rs.getInt(1);
				String name = rs.getString(2);
				String addr = rs.getString(3);
				String phone = rs.getString(4);
				Customer c = new Customer(custId, name, addr, phone);
				list.add(c);
			}
			rs.close(); stmt.close(); conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Customer> getCustomerListByAddress(String addr) {
		Connection conn = myConnection();
		String sql = "select * from customer where address like ?";
		List<Customer> list = new ArrayList<>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + addr + "%");
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				Customer c = new Customer(rs.getInt(1), rs.getString(2), 
										  rs.getString(3), rs.getString(4));
				list.add(c);
			}
			rs.close(); pstmt.close(); conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Customer> getCustomerListByFieldAndQuery(String field, String query) {
		Connection conn = myConnection();
		String sql = "select * from customer where " + field + " like ?";
		List<Customer> list = new ArrayList<>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + query + "%");
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				Customer c = new Customer(rs.getInt(1), rs.getString(2), 
										  rs.getString(3), rs.getString(4));
				list.add(c);
			}
			rs.close(); pstmt.close(); conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public void insertCustomer(Customer c) {
		Connection conn = myConnection();
		String sql = "insert into customer values (?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, c.getCustId());
			pstmt.setString(2, c.getName());
			pstmt.setString(3, c.getAddr());
			pstmt.setString(4, c.getPhone());
			pstmt.executeUpdate();
			
			pstmt.close(); conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void updateCustomer(Customer c) {
		Connection conn = myConnection();
		String sql = "update customer set name=?, address=?, phone=? where custid=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, c.getName());
			pstmt.setString(2, c.getAddr());
			pstmt.setString(3, c.getPhone());
			pstmt.setInt(4, c.getCustId());
			pstmt.executeUpdate();
			
			pstmt.close(); conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void deleteCustomer(int custId) {
		Connection conn = myConnection();
		String sql = "delete from customer where custid=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, custId);
			pstmt.executeUpdate();
			
			pstmt.close(); conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}

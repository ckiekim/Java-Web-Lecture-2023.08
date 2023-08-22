package com.example.demo.oracle;

public class Customer {
	private int custId;
	private String name;
	private String addr;
	private String phone;
	
	public Customer() { }
	public Customer(int custId, String name, String addr, String phone) {
		this.custId = custId;
		this.name = name;
		this.addr = addr;
		this.phone = phone;
	}
	
	@Override
	public String toString() {
		return "Customer [custId=" + custId + ", name=" + name + ", addr=" + addr + ", phone=" + phone + "]";
	}
	
	public int getCustId() {
		return custId;
	}
	public void setCustId(int custId) {
		this.custId = custId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
}

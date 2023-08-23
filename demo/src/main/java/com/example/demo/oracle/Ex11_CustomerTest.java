package com.example.demo.oracle;

import java.util.List;

public class Ex11_CustomerTest {

	public static void main(String[] args) {
		CustomerDao cDao = new CustomerDao();
		
		// custId 값으로 검색해서 Customer 객체를 구하고 출력
//		Customer c1 = cDao.getCustomer(6);
//		System.out.println(c1);
		
		// cDao.insertCustomer(Customer c)
//		Customer c3 = new Customer(8, "김민재", "독일 뮌헨", "010-3333-7777");
//		cDao.insertCustomer(c3);
		
		// cDao.updateCustomer(Customer c)
//		Customer c4 = cDao.getCustomer(8);
//		c4.setName("고영복"); c4.setAddr("대한민국 서울"); c4.setPhone("010-3456-9876"); 
//		cDao.updateCustomer(c4);
		
		// cDao.deleteCustomer(int custId)
//		cDao.deleteCustomer(8);
		
		// 모든 Customer List를 가져옴
//		List<Customer> list = cDao.getCustomerList();
//		List<Customer> list = cDao.getCustomerListByFieldAndQuery("name", "");
		
		// 대한민국에 거주하는 고객 명단
//		List<Customer> list = cDao.getCustomerListByAddress("대한민국");
//		List<Customer> list = cDao.getCustomerListByFieldAndQuery("address", "대한민국");
		
		// 이름에 '박'이 들어가는 고객 명단
		List<Customer> list = cDao.getCustomerListByFieldAndQuery("name", "박");
		for (Customer c2: list)
			System.out.println(c2);
	}

}

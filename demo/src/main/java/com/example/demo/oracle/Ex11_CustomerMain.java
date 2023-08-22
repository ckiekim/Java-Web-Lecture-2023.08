package com.example.demo.oracle;

import java.util.List;

public class Ex11_CustomerMain {

	public static void main(String[] args) {
		CustomerDao cDao = new CustomerDao();
		
		// custId 값으로 검색해서 Customer 객체를 구하고 출력
//		Customer c1 = cDao.getCustomer(6);
//		System.out.println(c1);
		
		// 모든 Customer List를 가져옴
		List<Customer> list = cDao.getCustomerList();
		for (Customer c2: list)
			System.out.println(c2);
		
		// cDao.insertCustomer(Customer c)
		
		
		// cDao.updateCustomer(Customer c)
		
		
		// cDao.deleteCustomer(int custId)
	}

}

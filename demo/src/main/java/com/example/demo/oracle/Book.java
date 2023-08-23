package com.example.demo.oracle;

public class Book {
	private int bookId;
	private String bookname;
	private String publisher;
	private int price;
	
	public Book() { }
	public Book(int bookId, String bookname, String publisher, int price) {
		this.bookId = bookId;
		this.bookname = bookname;
		this.publisher = publisher;
		this.price = price;
	}
	
	@Override
	public String toString() {
		return "Book [bookId=" + bookId + ", bookname=" + bookname + ", publisher=" + publisher + ", price=" + price
				+ "]";
	}
	
	public int getBookId() {
		return bookId;
	}
	public void setBookId(int bookId) {
		this.bookId = bookId;
	}
	public String getBookname() {
		return bookname;
	}
	public void setBookname(String bookname) {
		this.bookname = bookname;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
}

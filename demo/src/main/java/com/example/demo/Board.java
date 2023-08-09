package com.example.demo;

public class Board {
	private String title;
	private String languages;
	private String content;
	
	public Board() { }
	public Board(String title, String languages, String content) {
		this.title = title;
		this.languages = languages;
		this.content = content;
	}
	
	@Override
	public String toString() {
		return "Board [title=" + title + ", languages=" + languages + ", content=" + content + "]";
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getLanguages() {
		return languages;
	}
	public void setLanguages(String languages) {
		this.languages = languages;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
}

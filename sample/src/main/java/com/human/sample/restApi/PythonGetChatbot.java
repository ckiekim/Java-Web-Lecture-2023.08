package com.human.sample.restApi;

import java.net.URI;
import java.net.URLEncoder;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;

public class PythonGetChatbot {

	public static void main(String[] args) throws Exception {
		String userInput = "오늘 발표를 잘해서 기분이 너무 좋아요.";
		userInput = URLEncoder.encode(userInput, "utf-8");
		String apiUrl = "http://localhost:5000/chatbot/counsel_rest?userInput=" + userInput;
		
		URI uri = new URI(apiUrl);
		RestTemplate rest = new RestTemplate();
		ResponseEntity<String> response = rest.getForEntity(uri, String.class);
		System.out.println(response.getStatusCode());
		System.out.println(response.getBody());
		
		JSONParser json = new JSONParser();
		JSONObject obj = (JSONObject) json.parse(response.getBody().toString());
		String user = (String) obj.get("user");
		String chatbot = (String) obj.get("chatbot");
		System.out.println(user);
		System.out.println(chatbot);
	}

}

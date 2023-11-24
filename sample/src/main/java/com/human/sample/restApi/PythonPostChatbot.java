package com.human.sample.restApi;

import java.net.URI;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

public class PythonPostChatbot {

	public static void main(String[] args) throws Exception {
		String userInput = "오늘 발표를 잘해서 기분이 너무 좋아요.";
		String apiUrl = "http://localhost:5000/chatbot/counsel";
		URI uri = new URI(apiUrl);
		
		// parameter setting
		MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
		body.add("userInput", userInput);
		HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(body, new HttpHeaders());
		
		RestTemplate rest = new RestTemplate();
		ResponseEntity<String> response = rest.exchange(uri, HttpMethod.POST, entity, String.class);
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

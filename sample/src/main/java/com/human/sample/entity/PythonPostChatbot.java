package com.human.sample.entity;

import java.net.URI;
import java.net.URLEncoder;

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
		String userInput = "오늘 시험을 잘봐서 기분이 매우 좋아요.";
		String apiUrl = "http://localhost:5000/chatbot/counsel";
		
		MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
		body.add("userInput", userInput);
		URI uri = new URI(apiUrl);
        RestTemplate rest = new RestTemplate();
        
        HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(body, new HttpHeaders());;
        ResponseEntity<String> res = rest.exchange(uri, HttpMethod.POST, entity, String.class);
        System.out.println(res.getStatusCode());
        System.out.println(res.getBody());
        
        JSONParser json = new JSONParser();
        JSONObject obj = (JSONObject) json.parse(res.getBody().toString());
		String user = (String) obj.get("user");
		String chatbot = (String) obj.get("chatbot");
		System.out.println(user);
		System.out.println(chatbot);
	}

}

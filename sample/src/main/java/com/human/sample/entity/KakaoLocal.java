package com.human.sample.entity;

import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import java.net.URLEncoder;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;


public class KakaoLocal {

	public static void main(String[] args) throws Exception {
		String kakaoKey = "96a62d2d320e31813da2b007a192b15e";
		
		// 키워드로 장소 검색하기
		String apiUrl = "https://dapi.kakao.com/v2/local/search/keyword.json";
		// 서울 강남구 삼성동 10km 반경에서 카카오프렌즈 매장 검색
		double lat = 37.514323;
		double lng = 127.062831;
		String encodedQuery = URLEncoder.encode("카카오프렌즈", "UTF-8");
		String rawUri = apiUrl + "?y=" + lat + "&x=" + lng + "&radius=10000" + "&query=" + encodedQuery;
		URI uri = new URI(rawUri);
		
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        String appKey = "KakaoAK " + kakaoKey;
        headers.set("Authorization", appKey);
        HttpEntity<String> entity = new HttpEntity<>("parameters", headers);
        
        RestTemplate rest = new RestTemplate();
        ResponseEntity<String> res = rest.exchange(uri, HttpMethod.GET, entity, String.class);
        
        JSONParser json = new JSONParser();
        JSONObject obj = (JSONObject) json.parse(res.getBody().toString());
        JSONArray docuArray = (JSONArray) obj.get("documents");
        for (int i=0; i<docuArray.size(); i++) {
        	JSONObject docu = (JSONObject) docuArray.get(i);
        	String place_name = (String) docu.get("place_name");
        	String road_address_name = (String) docu.get("road_address_name");
        	String phone = (String) docu.get("phone");
        	System.out.println(place_name + ", " + road_address_name + ", " + phone);
        }
	}

}

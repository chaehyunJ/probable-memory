package com.itbank.controller;

import java.io.IOException;

import org.json.XML;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.itbank.service.WeatherService;

@RestController
public class AjaxController {

	@Autowired private WeatherService ws;
	
	@GetMapping(value="/getMidTa", produces="application/json; charset=utf-8")
	public String getMidTa() throws IOException {
		String xml = ws.getMidData();
		
		if(xml != null){
			String json = XML.toJSONObject(xml).toString();
			return json;
		}
		return "{\"message\" : \"no data\"}";
				
				
	}
	
	@GetMapping(value ="/getMidLandFcst", produces="application/json; charset=utf-8")
	public String getMidLandFcst() throws IOException {
		String xml = ws.getMidLandFcst();
		
		if(xml != null) {
			String json = XML.toJSONObject(xml).toString();
			return json;
		}
		return "{\"message\" : \"no data\"}";

	}
	
}

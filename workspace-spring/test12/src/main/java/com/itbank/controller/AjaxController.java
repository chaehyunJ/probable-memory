package com.itbank.controller;

import java.io.IOException;

import org.json.XML;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.itbank.service.TotalService;

@RestController
public class AjaxController {

	@Autowired private TotalService ts;
	
	@GetMapping(value="/covid", produces="application/json; charset=utf-8")
	public String covid() throws IOException {
		
		String xml = ts.getData();
		
		if(xml != null) {
			String json = XML.toJSONObject(xml).toString();
			
			return json;
		}
		
		return "{\"message\" : \"no data\"}";
	}
	
	@GetMapping(value="/vaccine", produces="application/json; charset=utf-8")
	public String vaccine() throws IOException {
		
		String xml = ts.getVaccine();
		
		if(xml != null) {
//			String json = XML.toJSONObject(xml).toString();
			
			return xml;
		}
		return "{\"message\" : \"no data\"}";
	}
}

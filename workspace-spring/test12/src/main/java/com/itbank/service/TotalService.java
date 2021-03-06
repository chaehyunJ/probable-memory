package com.itbank.service;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Scanner;

import org.springframework.stereotype.Service;

@Service
public class TotalService {

	public String getData() throws IOException {
		
//		String url = "http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19SidoInfStateJson?serviceKey=q6WAnLS1b6vUa9VoLCKmB14TY6kJ3AotCfHj10BgvLRuyQTk6nnlrOruwjHTWL9K8XZ%2B8L6Ic26%2BDJdRsSzOTw%3D%3D&pageNo=1&numOfRows=10&startCreateDt=20220127&endCreateDt=20220127";
		
		String url = "http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19SidoInfStateJson";
		String serviceKey = "q6WAnLS1b6vUa9VoLCKmB14TY6kJ3AotCfHj10BgvLRuyQTk6nnlrOruwjHTWL9K8XZ%2B8L6Ic26%2BDJdRsSzOTw%3D%3D";
		
		Date date = new Date();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMDDHH");
		
		String time3 = "";
		
		String time = sdf.format(date);
		
		String time1 = time.substring(0, 8);
		System.out.println("time1 : " + time1);
		
		int time1Hour = Integer.parseInt(time1);
		
		String time2 = time.substring(8);
		
		int time2Hour = Integer.parseInt(time2);
		
		// 10시기준으로 날짜 바꾸기
		if(time2Hour > 10) {
			time3 += time1;
		}
		else {
			time1Hour = (time1Hour-1);
			time3 += String.valueOf(time1Hour);
		}
		
		System.out.println(time3);
		
		String time4 = time1.substring(0,6);
		time4 += "01";
		
		System.out.println(time4);
		
		String queryString = "?";
		
		queryString += "serviceKey=" + serviceKey + "&";
		queryString += "pageNo=" + 1 + "&";
		queryString += "numOfRows=" + 10 + "&";
		queryString += "startCreateDt=" + time4 + "&";
		queryString += "endCreateDt=" + time3 + "&";
		
		
		URL requestURL = new URL(url + queryString);
		
		HttpURLConnection conn = (HttpURLConnection)requestURL.openConnection();

		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json; charset=utf-8");
		
		Scanner sc = null;
		
		String xmlData = "";
		
		if(conn.getResponseCode() == 200) {
			sc = new Scanner(conn.getInputStream());
			
			while(sc.hasNext()) {
				xmlData += sc.nextLine();
			}
			sc.close();
			conn.disconnect();
			return xmlData;
		}
		
		return null;
	}

	public String getVaccine() throws IOException {
		
		String url = "https://api.odcloud.kr/api/15077756/v1/vaccine-stat";
		String serviceKey = "q6WAnLS1b6vUa9VoLCKmB14TY6kJ3AotCfHj10BgvLRuyQTk6nnlrOruwjHTWL9K8XZ%2B8L6Ic26%2BDJdRsSzOTw%3D%3D";
		
		Date date = new Date();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		String time = sdf.format(date);
		System.out.println("vaccine : " + time);
		
		String time1 = time.substring(0, 8);
		System.out.println("vaccine1 : " + time1);
		
		String time2 = time1 + "01";
		
		String queryString = "?";
		
		queryString += "page=" + 1 + "&";
		queryString += "perPage=" + 31 + "&";
		queryString += "cond[baseDate::GTE]=" + time2 + "&";	
		queryString += "cond[baseDate::LTE]=" + time + "&";
		queryString += "cond[sido::EQ]=" + "부산광역시" + "&";
		queryString += "serviceKey=" + serviceKey + "&";
		
		
		URL requestURL = new URL(url + queryString);
		
		HttpURLConnection conn = (HttpURLConnection)requestURL.openConnection();

		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json; charset=utf-8");
		
		Scanner sc = null;
		
		String data = "";
		
		if(conn.getResponseCode() == 200) {
			sc = new Scanner(conn.getInputStream());
			
			while(sc.hasNext()) {
				data += sc.nextLine();
			}
			sc.close();
			conn.disconnect();
			return data;
		}
		
		return null;
	}

}

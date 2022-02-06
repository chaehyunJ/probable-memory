package com.itbank.service;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Scanner;

import org.springframework.stereotype.Service;

@Service
public class WeatherService {

	public String getMidData() throws IOException {
		String url = "http://apis.data.go.kr/1360000/MidFcstInfoService/getMidTa";
		
		String serviceKey = "q6WAnLS1b6vUa9VoLCKmB14TY6kJ3AotCfHj10BgvLRuyQTk6nnlrOruwjHTWL9K8XZ%2B8L6Ic26%2BDJdRsSzOTw%3D%3D";
		
		String queryString = "?";
		
		Date date = new Date();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMDDHH");
		
		String time = sdf.format(date);
		System.out.println("time : " + time);
		
		String time1 = time.substring(0, 8);
		System.out.println("time1 : " + time1);
		
		int time1Hour = Integer.parseInt(time1);
		
		System.out.println("time1Hour" + time1Hour);
		
		String time2 = time.substring(8);
		int time2Hour = Integer.parseInt(time2);
		System.out.println("time2Hour : " + time2Hour);
		System.out.println("time2 : "+time2);
		
		String hours = "";
		
		if(time2Hour > 18) {
			hours += "18";
		}
		else {
			hours += "06";
		}
		System.out.println(hours);
		
		int hoursInt = Integer.parseInt(hours);
		
		System.out.println("hoursInt : " + hoursInt);
		
		queryString += "serviceKey=" + serviceKey + "&";
		queryString += "pageNo=" + 1 + "&";
		queryString += "numOfRows=" + 10 + "&";
		queryString += "dataType=XML&";
		queryString += "regId=11H20201&";
		queryString += "tmFc=" + time1 + hours;
		
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

	public String getMidLandFcst() throws IOException {
		String url = "http://apis.data.go.kr/1360000/MidFcstInfoService/getMidLandFcst";
		String serviceKey = "q6WAnLS1b6vUa9VoLCKmB14TY6kJ3AotCfHj10BgvLRuyQTk6nnlrOruwjHTWL9K8XZ%2B8L6Ic26%2BDJdRsSzOTw%3D%3D";
		
		String queryString = "?";
		
		Date date = new Date();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMDDHH");
		
		String time = sdf.format(date);
		System.out.println("time : " + time);
		
		String time1 = time.substring(0, 8);
		System.out.println("time1 : " + time1);
		
		int time1Hour = Integer.parseInt(time1);
		
		System.out.println("time1Hour" + time1Hour);
		
		String time2 = time.substring(8);
		int time2Hour = Integer.parseInt(time2);
		System.out.println("time2Hour : " + time2Hour);
		System.out.println("time2 : "+time2);
		
		String hours = "";
		
		if(time2Hour > 18) {
			hours += "18";
		}
		else {
			hours += "06";
		}
		System.out.println(hours);
		
		int hoursInt = Integer.parseInt(hours);
		
		System.out.println("hoursInt : " + hoursInt);
		
		
		
		queryString += "serviceKey=" + serviceKey + "&";
		queryString += "pageNo=" + 1 + "&";
		queryString += "numOfRows=" + 10 + "&";
		queryString += "dataType=XML&";
		queryString += "regId=11H20000&";
		queryString += "tmFc=" + time1 + hours;
		
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

}

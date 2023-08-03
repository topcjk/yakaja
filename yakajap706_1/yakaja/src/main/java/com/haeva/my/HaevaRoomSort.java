package com.haeva.my;

import java.io.BufferedReader;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.google.gson.Gson;
import com.yakaja.dao.MainTelInfoDAO;
import com.yakaja.vo.MemberVO;
import com.yakaja.vo.RoomVO;

public class HaevaRoomSort implements HaevaImpl {

	@Override
	public void haeva(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		MainTelInfoDAO yakajaDao = new MainTelInfoDAO();
		String tmp = "";
		
		// JSON 데이터 읽기
		BufferedReader reader = request.getReader();
		StringBuilder stringBuilder = new StringBuilder();
		String line;
		
		while ((line = reader.readLine()) != null) {
		    stringBuilder.append(line);
		}
		
		String requestData = stringBuilder.toString();
		System.out.println("requestData : " + requestData);
		// JSON 파싱
		JSONParser parser = new JSONParser();
		JSONObject json = null;
		
		try {
			
			json = (JSONObject)parser.parse(requestData);
			
			// System.out.println("json :" + json);
			
			String hotel_name = (String)json.get("hotel_name");
			String reserv_in = (String)json.get("reserv_in");
			String reserv_out = (String)json.get("reserv_out");
			String room_imsi = (String)json.get("room_imsi");
			
			switch(room_imsi) {
			case "0":
				tmp = "a";
				break;
			case "1":
				tmp = "b";
				break;
			case "2":
				tmp = "c";
				break;
			default:
				break;
			}
			
			System.out.println("hotel_name : " + hotel_name);
			System.out.println("reserv_in : " + reserv_in);
			System.out.println("reserv_out : " + reserv_out);
			System.out.println("room_imsi : " + room_imsi);
			
			ArrayList<RoomVO> listRoom = new ArrayList<RoomVO>();
			listRoom = yakajaDao.getRoomInfo(tmp, reserv_out, room_imsi, hotel_name);
			
			if(listRoom == null) {
				response.setCharacterEncoding("UTF-8");
		        response.getWriter().write("full");
			} else {
				response.setCharacterEncoding("UTF-8");
			    
			    Gson gson = new Gson();
			    String json2 = gson.toJson(listRoom);
			    
			    System.out.println("json2 : " + json2);
			    System.out.println("json2.toString() : " + json2.toString());
			    
			    response.setCharacterEncoding("UTF-8");
			    response.setContentType("application/json");
			    response.getWriter().write(json2);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}		

		
		
		

	}

}

package com.haeva.my;

import java.io.BufferedReader;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.yakaja.dao.MainTelInfoDAO;

public class HaevaPaymentInsert implements HaevaImpl {

	@Override
	public void haeva(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		MainTelInfoDAO yakajaDao = new MainTelInfoDAO();
		
		// JSON 데이터 읽기
		BufferedReader reader = request.getReader();
		StringBuilder stringBuilder = new StringBuilder();
		String line;
		
		while ((line = reader.readLine()) != null) {
		    stringBuilder.append(line);
		}
		
		String requestData = stringBuilder.toString();
		
		System.out.println("안녕" + requestData);

		// JSON 파싱
		
		JSONParser parser = new JSONParser();
		JSONObject json = null;
		
		try {
			
			json = (JSONObject)parser.parse(requestData);
			String imp_uid = (String)json.get("imp_uid"); // 결제 고유번호
			String merchant_uid = (String)json.get("merchant_uid"); // 주문번호
			
			int room_num = Integer.parseInt((String)json.get("room_num"));
			String hotel_name = (String)json.get("hotel_name");
			int room_price = ((Long) json.get("room_price")).intValue();
			String reserv_in = (String)json.get("reserv_in");
			String reserv_out = (String)json.get("reserv_out");  
			String mem_id = (String)json.get("mem_id");
			
			String hotel_id = yakajaDao.searchHotelId(hotel_name);
			
			boolean result = yakajaDao.getReservHotel(hotel_id, room_num, reserv_in, reserv_out, mem_id, room_price);
			
			
	        // 응답을 직접 작성하여 반환
			response.setContentType("application/json");
	        response.setCharacterEncoding("UTF-8");
	        
			if(result)
				response.getWriter().write("{ \"result\": \"success\" }");  
			else 
				response.getWriter().write("{ \"result\": \"fail\" }"); 
			
		} catch (Exception e) {
			e.printStackTrace();
			// JSON 파싱 실패 시 예외 처리 코드 작성
		}
		
	}

}

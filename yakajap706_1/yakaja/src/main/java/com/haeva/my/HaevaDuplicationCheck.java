package com.haeva.my;

import java.io.BufferedReader;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.yakaja.dao.MainTelInfoDAO;
import com.yakaja.vo.MemberVO;

public class HaevaDuplicationCheck implements HaevaImpl {

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
		System.out.println("requestData : " + requestData);
		// JSON 파싱
		
		JSONParser parser = new JSONParser();
		JSONObject json = null;
		
		try {
			
			json = (JSONObject)parser.parse(requestData);
			
			
			
			// System.out.println("json :" + json);
			String mem_id = (String)json.get("mem_id"); // 아이디
			// System.out.println("mem_id : " + mem_id);
			
			
			
			MemberVO memberVO = yakajaDao.findMember(mem_id);
			
			if(memberVO == null) {
				response.setCharacterEncoding("UTF-8");
		        response.getWriter().write("success");
			} else {
				response.setCharacterEncoding("UTF-8");
			    response.getWriter().write("fail");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}		

	}

}

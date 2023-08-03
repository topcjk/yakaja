package com.haeva.my;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yakaja.dao.MainTelInfoDAO;
import com.yakaja.vo.HotelVO;

public class HaevaGoHotel implements HaevaImpl{

	@Override
	public void haeva(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		MainTelInfoDAO tidao1 = new MainTelInfoDAO();
		
		String hotel_name = request.getParameter("hotel_name");
		
		ArrayList<HotelVO>harray = tidao1.getHotelInfo(hotel_name);
		
		request.setAttribute("harray", harray);
		
	}
}

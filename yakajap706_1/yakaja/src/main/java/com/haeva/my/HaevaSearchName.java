package com.haeva.my;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yakaja.dao.MainTelInfoDAO;
import com.yakaja.vo.HotelVO2;

public class HaevaSearchName implements HaevaImpl {

	@Override
	public void haeva(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		MainTelInfoDAO hidao = new MainTelInfoDAO();
		
		
		String name = request.getParameter("hotelName");
		System.out.println(name);
		
		ArrayList<HotelVO2> alist1 = null;
		
		alist1 = hidao.searchNameInfo(name);
		
		request.setAttribute("alist1", alist1);
		request.setAttribute("name", name);

	}

}

package com.haeva.my;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yakaja.dao.MainTelInfoDAO;
import com.yakaja.vo.HotelVO2;
import com.yakaja.vo.SearchVO;

public class HaevaSearchWhere implements HaevaImpl {

	@Override
	public void haeva(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		MainTelInfoDAO hidao = new MainTelInfoDAO();
		
		// String state = "showLocationHotel";
		String name = request.getParameter("hotelWhere");
		
		System.out.println(name);
		
		ArrayList<HotelVO2> alist1 = null;
		// ArrayList<SearchVO> alist1 = null;
		// alist1 = hidao.getSearchInfo(name);
		alist1 = hidao.searchWhereInfo(name);
		
		System.out.println(alist1.size());
		
		request.setAttribute("alist1", alist1);
		request.setAttribute("name", name);

	}
}

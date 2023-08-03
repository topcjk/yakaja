package com.haeva.my;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yakaja.dao.MainTelInfoDAO;
import com.yakaja.vo.HotelVO2;

public class HaevaGetAllInfo_Sort implements HaevaImpl {

	@Override
	public void haeva(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		MainTelInfoDAO hidao = new MainTelInfoDAO();
		
		String howSort = request.getParameter("sorter");
		
		System.out.println("sort값 받은거 : " + howSort);
		
		ArrayList<HotelVO2> alist1 = null;
		alist1 = hidao.getAllInfo_Sorted(howSort);
		
		System.out.println(alist1.size());
		
		request.setAttribute("alist1", alist1);
	}

}

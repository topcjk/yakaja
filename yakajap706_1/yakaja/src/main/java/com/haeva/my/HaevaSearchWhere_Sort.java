package com.haeva.my;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yakaja.dao.MainTelInfoDAO;
import com.yakaja.vo.HotelVO2;

public class HaevaSearchWhere_Sort implements HaevaImpl {

	@Override
	public void haeva(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		MainTelInfoDAO hidao = new MainTelInfoDAO();
		
		
		String howSort = request.getParameter("sorter");
		// String where = request.getParameter("where");
		String where2 = request.getParameter("where2");
		
		System.out.println("sort값 받은거 : " + howSort);
		//System.out.println("받은 지역:"+where);
		System.out.println("받은 지역2 : " + where2);

		ArrayList<HotelVO2> alist1 = null;
		
		alist1 = hidao.searchWhereInfo_Sort(howSort, where2);
		
		request.setAttribute("alist1", alist1);
		request.setAttribute("name", where2);

	}

}

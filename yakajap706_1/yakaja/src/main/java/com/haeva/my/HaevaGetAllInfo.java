package com.haeva.my;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yakaja.dao.MainTelInfoDAO;
import com.yakaja.vo.HotelVO2;

public class HaevaGetAllInfo implements HaevaImpl {

	@Override
	public void haeva(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		// String checkstate = (String)request.getAttribute("checkstate");
		// String chooseval = (String)request.getAttribute("chooseval");
		String state = "getallhotel";
		
		MainTelInfoDAO hidao = new MainTelInfoDAO();
		ArrayList<HotelVO2> alist1 = null;
		
		alist1 = hidao.getAllInfo();
		// System.out.println("받은정보는" + checkstate + ", " + chooseval);
		
		request.setAttribute("alist1", alist1);
		request.setAttribute("state", state);

	}

}

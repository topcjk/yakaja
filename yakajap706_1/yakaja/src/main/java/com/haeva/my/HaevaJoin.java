package com.haeva.my;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yakaja.dao.MainTelInfoDAO;

public class HaevaJoin implements HaevaImpl {

	@Override
	public void haeva(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		MainTelInfoDAO tidao1 = new MainTelInfoDAO();
		
		String id = request.getParameter("mem_id");
		String pw = request.getParameter("mem_pw");
		String email = request.getParameter("mem_email");
		String name = request.getParameter("mem_name");
		String tel = request.getParameter("mem_tel");
		int admin = Integer.parseInt(request.getParameter("mem_admin"));
		
		boolean b = tidao1.insertData(id, pw, email, name, tel, admin);
		
		if(b == true) {
			request.setAttribute("msg", "회원가입 성공!");
	        request.setAttribute("url", "login.jsp");
		} else {
			request.setAttribute("msg", "회원가입 실패!");
	        request.setAttribute("url", "join.jsp");
		}
		
	}

}

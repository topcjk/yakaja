package com.haeva.my;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yakaja.dao.MainTelInfoDAO;
import com.yakaja.vo.MemberVO;

public class HaevaFindId implements HaevaImpl {

	@Override
	public void haeva(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String mem_name = request.getParameter("mem_name");
		String mem_email = request.getParameter("mem_email");

		MainTelInfoDAO tidao1 = new MainTelInfoDAO();
		MemberVO memberVO = tidao1.findId(mem_name, mem_email);
		
		String msg = "";
		
		// System.out.println("mem_id : " + memberVO.getMem_name());
		
		if(memberVO == null) {
			msg = "아이디 찾기 실패";
			request.setAttribute("msg", msg); 
			request.setAttribute("url", "findId.jsp");
		}else {
			msg = memberVO.getMem_name() + "님의 아이디는 " + memberVO.getMem_id() + "입니다.";
			request.setAttribute("msg", msg); 
			request.setAttribute("url", "login.jsp");
	
		}
	}

}

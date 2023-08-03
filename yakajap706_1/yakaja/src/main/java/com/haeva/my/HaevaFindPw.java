package com.haeva.my;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yakaja.dao.MainTelInfoDAO;
import com.yakaja.vo.MemberVO;

public class HaevaFindPw implements HaevaImpl {

	@Override
	public void haeva(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String mem_id = request.getParameter("mem_id");
		String mem_name = request.getParameter("mem_name");
		
		MainTelInfoDAO tidao1 = new MainTelInfoDAO();
		MemberVO mv = tidao1.findPw(mem_id, mem_name);
		
		String msg="";
		
		if(mv == null) {
			msg = "비밀번호 찾기 실패";
			request.setAttribute("msg", msg); 
			request.setAttribute("url", "findpw.jsp");
		} else {
			msg = mv.getMem_id() + "님의 비밀번호는 " + mv.getMem_pw() + "입니다.";
			request.setAttribute("msg", msg); 
			request.setAttribute("url", "login.jsp");
		}

	}

}

package com.haeva.my;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yakaja.dao.MainTelInfoDAO;
import com.yakaja.vo.MemberVO;

public class HaevaMyUpdate implements HaevaImpl {

	@Override
	public void haeva(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String msg = "";
		
		MainTelInfoDAO yakajaDAO = new MainTelInfoDAO();
		
		String mem_id = request.getParameter("mem_id");
		String mem_pw = request.getParameter("mem_pw");
		String mem_email = request.getParameter("mem_email");
		String mem_tel = request.getParameter("mem_tel");
		
		boolean success = yakajaDAO.updateData(mem_id, mem_pw, mem_email, mem_tel);
		
		if(success) {
           
			msg = "수정 성공";
			
            MemberVO memberVO = yakajaDAO.findMember(mem_id);
            
            HttpSession session = request.getSession();
            session.setAttribute("memberVO", memberVO);
            
            request.setAttribute("msg", msg);
            request.setAttribute("url", "myInfo.jsp");
         
        } else {
            msg = "수정 실패";
            request.setAttribute("msg", msg);
            request.setAttribute("url", "myUpdate.jsp");
            
        }
		
	}

}

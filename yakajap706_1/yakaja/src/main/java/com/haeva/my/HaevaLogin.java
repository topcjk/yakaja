package com.haeva.my;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yakaja.dao.MainTelInfoDAO;
import com.yakaja.vo.MemberVO;


public class HaevaLogin implements HaevaImpl {

	@Override
	public void haeva(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		MainTelInfoDAO yakajaDAO = new MainTelInfoDAO();
		
		// 로그인 폼에서 전송된 id, pw
		String mem_id = request.getParameter("mem_id");
		String mem_pw = request.getParameter("mem_pw");
		
		System.out.println("mem_id : " + mem_id);
		System.out.println("mem_pw : " + mem_pw);
		
		MemberVO memberVO = yakajaDAO.findMember(mem_id);
		
		if(memberVO == null) {
		    // 멤버를 찾을 수 없는 경우 예외 처리 또는 오류 메시지 추가
		    request.setAttribute("msg", "로그인 실패! 아이디와 비밀번호를 확인해주세요");
		    request.setAttribute("url", "login.jsp");
		} else {
		    // memberVO가 null이 아닌 경우에만 비밀번호 확인
		    if (memberVO.getMem_pw().equals(mem_pw)) {
		        // 로그인 성공 처리
		        request.setAttribute("msg", "로그인 성공!");
		        request.setAttribute("url", "yakajaMain.jsp");

		        HttpSession session = request.getSession();
		        session.setAttribute("memberVO", memberVO);
		    } else {
		        // 비밀번호 불일치 처리
		        request.setAttribute("msg", "로그인 실패! 아이디와 비밀번호를 확인해주세요");
		        request.setAttribute("url", "login.jsp");
		    }
		}
		
		
	}

}

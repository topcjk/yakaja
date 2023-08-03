package com.haeva.my;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yakaja.dao.MainTelInfoDAO;
import com.yakaja.vo.MemberVO;

public class HaevaMemerList implements HaevaImpl {

	@Override
	public void haeva(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		MainTelInfoDAO yakajaDAO = new MainTelInfoDAO();
		
		ArrayList<MemberVO> listMember = yakajaDAO.listMember();
		
		request.setAttribute("listMember", listMember);
	}

}

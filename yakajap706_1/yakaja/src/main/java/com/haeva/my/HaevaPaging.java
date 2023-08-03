package com.haeva.my;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yakaja.dao.MainTelInfoDAO;
import com.yakaja.vo.ReviewVO;
import com.yakaja.vo.PagingVO;


public class HaevaPaging implements HaevaImpl {

	@Override
	public void haeva(HttpServletRequest request, HttpServletResponse response)
			throws IOException, SQLException, ClassNotFoundException {
		// TODO Auto-generated method stub

		MainTelInfoDAO dao = new MainTelInfoDAO();

		int totalCount = dao.getTotalCount();
		int page = request.getParameter("page") 
				== null ? 1 : Integer.parseInt(request.getParameter("page"));
		
		System.out.println("page="+page);
		
		PagingVO paging = new PagingVO();
		paging.setPageNo(page); // get방식의 parameter값으로 받은 page변수, 현재 페이지 번호
		paging.setPageSize(10); // 한 페이지에 불러낼 게시물의 개수 지정
		paging.setTotalCount(totalCount);
		
		page = (page - 1) * 10; // select해오는 기준을 구한다.

		ArrayList<ReviewVO> list = dao.getList(page, paging.getPageSize());

		request.setAttribute("list", list);
		request.setAttribute("paging", paging);

	}
}
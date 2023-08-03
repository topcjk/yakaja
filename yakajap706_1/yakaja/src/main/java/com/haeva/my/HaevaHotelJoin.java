package com.haeva.my;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yakaja.dao.MainTelInfoDAO;
import com.yakaja.vo.MemberVO;

public class HaevaHotelJoin implements HaevaImpl {

	@Override
	public void haeva(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		 String msg = "";
	     String url = "";

	     request.setCharacterEncoding("UTF-8");
	     response.setCharacterEncoding("UTF-8");

	     MainTelInfoDAO tidao1 = new MainTelInfoDAO();
	     HttpSession session = request.getSession();

	     String hotel_name = request.getParameter("hotel_name");
	     String hotel_address = request.getParameter("hotel_address");
	     
	     System.out.println("room_aprice : " + request.getParameter("room_aprice"));
	     
	     int room_aprice = Integer.parseInt(request.getParameter("room_aprice"));
	     int room_bprice = Integer.parseInt(request.getParameter("room_bprice"));
	     int room_cprice = Integer.parseInt(request.getParameter("room_cprice"));
	     
	     MemberVO memberVO = (MemberVO)session.getAttribute("memberVO");
	     String mem_id = memberVO.getMem_id();
	     
	     System.out.println("mem_id : " + mem_id);
	     
	     // 체크박스 값을 확인하여 변수를 설정합니다.
	     int hotel_wifi = request.getParameter("hotel_wifi") != null ? 1 : 0;
	     int hotel_pet = request.getParameter("hotel_pet") != null ? 1 : 0;
	     int hotel_bf = request.getParameter("hotel_bf") != null ? 1 : 0;
	     int hotel_rs = request.getParameter("hotel_rs") != null ? 1 : 0;
	     int hotel_ciga = request.getParameter("hotel_ciga") != null ? 1 : 0;
	     int hotel_wc = request.getParameter("hotel_wc") != null ? 1 : 0;
	     //String mem_id = (String) session.getAttribute("MEM_ID");
	        
	     System.out.println(mem_id);
	     boolean result = tidao1.insertHotelData(hotel_name, hotel_address, room_aprice, room_bprice, room_cprice, 
	    		 mem_id, hotel_wifi, hotel_pet, hotel_bf, hotel_rs, hotel_ciga, hotel_wc);

	     if (result == false) {
	         msg = "호텔 등록에 실패했습니다.";
	         url = "hotelJoin.jsp";
	     } else {
	         // 시퀀스를 사용하여 hotel_id를 생성합니다.
	         msg = "호텔 등록에 성공하셨습니다.";
	         url = "yakajaMain.jsp";
	     }

	     request.setAttribute("msg", msg);
	     request.setAttribute("url", url);

	}

}

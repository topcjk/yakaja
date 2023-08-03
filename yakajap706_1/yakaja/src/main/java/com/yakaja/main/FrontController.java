package com.yakaja.main;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.haeva.my.HaevaDuplicationCheck;
import com.haeva.my.HaevaFindId;
import com.haeva.my.HaevaFindPw;
import com.haeva.my.HaevaGetAllInfo;
import com.haeva.my.HaevaGetAllInfo_Sort;
import com.haeva.my.HaevaGoHotel;
import com.haeva.my.HaevaHotelJoin;
import com.haeva.my.HaevaHotelList;
import com.haeva.my.HaevaImpl;
import com.haeva.my.HaevaJoin;
import com.haeva.my.HaevaLogin;
import com.haeva.my.HaevaLogout;
import com.haeva.my.HaevaMemerList;
import com.haeva.my.HaevaMyReserv;
import com.haeva.my.HaevaMyUpdate;
import com.haeva.my.HaevaPaging;
import com.haeva.my.HaevaPaymentInsert;
import com.haeva.my.HaevaReservList;
import com.haeva.my.HaevaReviewWrite;
import com.haeva.my.HaevaRoomSort;
import com.haeva.my.HaevaSearchName;
import com.haeva.my.HaevaSearchWhere;
import com.haeva.my.HaevaSearchWhere_Sort;
import com.haeva.my.HaevaSearchname_Sort;


@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FrontController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String c = request.getRequestURI().substring(request.getContextPath().length());
		String str = null;
		
		
		HaevaImpl scmd = null;

		switch (c) {
		// ####################################### 상민, 진규 #######################################
		
		case "/getAllHotel.do": // 전체목록 보기
			scmd = new HaevaGetAllInfo();
			try {
				scmd.haeva(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			str = "showAllHotel.jsp";
			break;
		
		case "/searchHotelWhere.do": // 지역으로 검색 (진규)
			scmd = new HaevaSearchWhere();
			try {
				scmd.haeva(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			str = "showLocationHotel.jsp";
			break;
			
		case "/searchHotelName.do": // 검색어로 검색 (진규)
			scmd = new HaevaSearchName();
			try {
				scmd.haeva(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			str = "showSearchedHotel.jsp";
			break;
		
		case "/goHotel.do": // 호텔 정보
			scmd = new HaevaGoHotel();
			try {
				scmd.haeva(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			str = "showHotelInfo.jsp";
			break;
		
		case "/getAllHotel_Sort.do": // 전체검색 sort	
			scmd = new HaevaGetAllInfo_Sort();
			try {
				scmd.haeva(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			str = "showAllHotel.jsp";
			break;
			
		case "/searchHotelWhere_Sort.do": // 지역검색 sort
			scmd = new HaevaSearchWhere_Sort();
			try {
				scmd.haeva(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			str = "showLocationHotel.jsp";
			break;	
		
		case "/searchHotelName_Sort.do": // 검색어검색 sort
			scmd = new HaevaSearchname_Sort();
			try {
				scmd.haeva(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			str = "showSearchedHotel.jsp";
			break;
			
		// ####################################### 준엽, 우림 #######################################
		case "/main.do":
			str = "yakajaMain.jsp";
			break;
			
		// 로그인 관련 case
		case "/join.do":
			str = "join.jsp";
			break;
			
		case "/join_ok.do":
			scmd = new HaevaJoin();
			try {
                scmd.haeva(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
            str = "msg.jsp"; // 
            break;
            
		case "/checkDuplication.do": // 중복확인
			scmd = new HaevaDuplicationCheck();
			try {
				scmd.haeva(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return; // 서블릿의 실행 종료
		
		case "/login.do":
			str = "login.jsp";
			break;
		
		case "/login_ok.do":
			scmd = new HaevaLogin();
			try {
				scmd.haeva(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			str = "msg.jsp";
			break;
		
		case "/logout.do":
			scmd = new HaevaLogout();
			try {
				scmd.haeva(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			str = "yakajaMain.jsp";
			break;
			
		case "/findId.do":
			str = "findId.jsp";
			break;
			
		case "/findId_ok.do":
			scmd = new HaevaFindId();
            try {
            	
            	System.out.println("find");
                scmd.haeva(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
           str = "msg.jsp";
           break;
           
		case "/findPw.do":
			str = "findPw.jsp";
			break;
		
		case "/findPw_ok.do":
			scmd = new HaevaFindPw();
            try {
                scmd.haeva(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
            str = "msg.jsp";
			break;
			
		// 관리자 페이지 관련 case
		case "/adminMember.do": // 멤버 관리 페이지
			scmd = new HaevaMemerList();
			try {
				scmd.haeva(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			str = "adminMember.jsp";
			break;
			
		case "/adminHotel.do": // 호텔 관리 페이지
			scmd = new HaevaHotelList();
			try {
				scmd.haeva(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			str = "adminHotel.jsp";
			break;
			
		case "/adminReserv.do": // 예약 관리 페이지
			scmd = new HaevaReservList();
			try {
				scmd.haeva(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			str = "adminReserv.jsp";
			break;
		// 결제 관련 case
		case "/payment.do": // 결제 페이지로 이동.
			str = "payment.jsp";
			break;
			
		case "/payment_create.do": // 결제 진행(DB에 예약정보 입력)
			scmd = new HaevaPaymentInsert();
			try {
				scmd.haeva(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return; // 서블릿의 실행 종료

		case "/paymentComplete.do":
			str = "paymentComplete.jsp";
			break;
			
		// 사용자 정보 관련
		case "/myInfo.do":
			str = "myInfo.jsp";
			break;
			
		case "/myUpdate.do":
			str = "myUpdate.jsp";
			break;
			
		case "/myUpdate_ok.do":
			scmd = new HaevaMyUpdate();
			try {
				scmd.haeva(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			str = "msg.jsp";
			break;
			
		case "/myReserv.do":
			scmd = new HaevaMyReserv();
			try {
				scmd.haeva(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			str = "myReserv.jsp";
			break;
		// 업주 관련
		case "/hotelJoinForm.do":
			str = "hotelJoin.jsp";
			break;
			
		case "/hotelJoin.do":
			scmd = new HaevaHotelJoin();
            try {
            	System.out.println("hoteljoin");
                scmd.haeva(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
            str = "msg.jsp"; // 
            break;
		
			// ####################################### 지애 #######################################
		case "/roomSort.do":
			scmd = new HaevaRoomSort();
			try {
				scmd.haeva(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return;
		case "/roomInfo.do":
			str = "roomInfo.jsp";
			break;
		// 게시판
			
		case "/paging.do":
			scmd = new HaevaPaging();
			try {
				scmd.haeva(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
			str="writeReview.jsp";
			break;
			
		case "/makereview.do":
			scmd = new HaevaReviewWrite();
			try {
				scmd.haeva(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
			str="yakajaMain.jsp";
			break;	
		}
		
		RequestDispatcher rd1 = request.getRequestDispatcher(str);
		rd1.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

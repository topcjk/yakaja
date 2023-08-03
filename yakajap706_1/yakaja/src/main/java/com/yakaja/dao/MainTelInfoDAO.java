package com.yakaja.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import com.yakaja.db.MainTelInfoDBConn;
import com.yakaja.vo.HotelVO;
import com.yakaja.vo.HotelVO2;
import com.yakaja.vo.MemberVO;
import com.yakaja.vo.ReservVO;
import com.yakaja.vo.ReviewVO;
import com.yakaja.vo.RoomVO;
import com.yakaja.vo.SearchVO;

public class MainTelInfoDAO {

	private Connection con;
	PreparedStatement pstmt = null;
	PreparedStatement pstmt2 = null;
	PreparedStatement pstmt3 = null;
	PreparedStatement pstmt4 = null;
	PreparedStatement pstmt5 = null;
	ResultSet rs = null;

	public MainTelInfoDAO() throws ClassNotFoundException, SQLException {
		con = new MainTelInfoDBConn().getConnection();
	}

	public ArrayList<SearchVO> getSearchInfo(String hotelName) throws SQLException {
		ArrayList<SearchVO> siarray = new ArrayList<SearchVO>();
		String sql = "select h.hotel_id, h.hotel_name, h.hotel_address, nvl(to_char(round(avg(r.review_score),1)),'별점없음')as ravg, h.room_imsi"
				+ " from pr2hotel h left outer join pr2review r" + " on h.hotel_id=r.hotel_id"
				+ " where h.hotel_name like '%' ||?|| '%'" + " or h.hotel_address like '%'||?||'%'"
				+ " group by h.hotel_id, h.hotel_name, h.hotel_address, h.room_imsi" + " order by h.hotel_name desc";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, hotelName);
		pstmt.setString(2, hotelName);
		rs = pstmt.executeQuery();
		while (rs.next()) {
			String hotel_id = rs.getString("hotel_id");
			String hotel_name = rs.getString("hotel_name");
			String hotel_address = rs.getString("hotel_address");
			String ravg = rs.getString("ravg");
			String room_imsi = rs.getString("room_imsi");

			SearchVO tv = new SearchVO(hotel_id, hotel_name, hotel_address, ravg, room_imsi);
			siarray.add(tv);
		}
		return siarray;
	}

	public ArrayList<SearchVO> getLocationInfo(String address) throws SQLException {
		ArrayList<SearchVO> tiarray = new ArrayList<SearchVO>();
		String sql = "select h.hotel_id, h.hotel_name, h.hotel_address, nvl(to_char(round(avg(r.review_score),1)),'별점없음')as ravg, h.room_imsi"
				+ " from pr2hotel h left outer join pr2review r" + " on h.hotel_id=r.hotel_id"
				+ " where h.hotel_address like '%' ||?|| '%'"
				+ " group by h.hotel_id, h.hotel_name, h.hotel_address, h.room_imsi" + " order by h.hotel_name desc";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, address);
		rs = pstmt.executeQuery();
		while (rs.next()) {
			String hotel_id = rs.getString("hotel_id");
			String hotel_name = rs.getString("hotel_name");
			String hotel_address = rs.getString("hotel_address");
			String ravg = rs.getString("ravg");
			String room_imsi = rs.getString("room_imsi");

			SearchVO tv = new SearchVO(hotel_id, hotel_name, hotel_address, ravg, room_imsi);
			tiarray.add(tv);
		}
		return tiarray;
	}

	public ArrayList<SearchVO> getRankInfo() throws SQLException {
		ArrayList<SearchVO> tiarray = new ArrayList<SearchVO>();
		String sql = "SELECT ROWNUM AS rank1, A.* FROM (SELECT h.hotel_id, h.hotel_name, ROUND(AVG(r.review_score),1) AS ravg FROM pr2hotel h INNER JOIN pr2review r ON h.hotel_id = r.hotel_id GROUP BY h.hotel_id, h.hotel_name ORDER BY ravg DESC)A";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while (rs.next()) {
			int rank1 = rs.getInt("rank1");
			String hotel_name = rs.getString("hotel_name");
			String ravg = rs.getString("ravg");
			String hotel_id = rs.getString("hotel_id");
			SearchVO tv = new SearchVO(rank1, hotel_name, ravg, hotel_id);
			tiarray.add(tv);
		}
		// System.out.println(tiarray.size());
		return tiarray;
	}

	public ArrayList<ReviewVO> getReviewInfo() throws SQLException {
		ArrayList<ReviewVO> riarray = new ArrayList<ReviewVO>();
		String sql = "select h.hotel_id, h.hotel_name, r.review_title, m.mem_name , r.review_content,"
				+ " r.review_score"
				+ " from pr2hotel h, pr2review r, pr2member m where h.hotel_id=r.hotel_id and r.mem_id=m.mem_id"
				+ " order by h.hotel_name";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while (rs.next()) {
			String hotel_id = rs.getString("hotel_id");
			String hotel_name = rs.getString("hotel_name");
			String review_title = rs.getString("review_title");
			String mem_name = rs.getString("mem_name");
			String review_content = rs.getString("review_content");
			String review_score = rs.getString("review_score");
			ReviewVO tv = new ReviewVO(hotel_id, hotel_name, review_title, mem_name, review_content, review_score);
			riarray.add(tv);
		}
		return riarray;

	}
	// 게시판 관련 메소드
	
	public ArrayList<ReviewVO> getList(int startRow, int endRow) throws SQLException {
		
		ArrayList<ReviewVO> list = new ArrayList<ReviewVO>();
		
		String sql = "select r.bunho, h.hotel_id, h.hotel_name, r.review_title, m.mem_name , r.review_content,"
				+ " r.review_score"
				+ " from pr2hotel h, pr2review r, pr2member m where h.hotel_id = r.hotel_id and r.mem_id = m.mem_id"
				+ " order by r.bunho desc" 
				+ " offset ? rows fetch first ? rows only";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, startRow);
		pstmt.setInt(2, endRow);
		rs = pstmt.executeQuery();
		
		while (rs.next()) {
			
			String hotel_id = rs.getString("hotel_id");
			String hotel_name = rs.getString("hotel_name");
			String review_title = rs.getString("review_title");
			String mem_name = rs.getString("mem_name");
			String review_content = rs.getString("review_content");
			String review_score = rs.getString("review_score");
			ReviewVO tv = new ReviewVO(hotel_id, hotel_name, review_title, mem_name, review_content, review_score);
			list.add(tv);
		}

		return list;
	}

	public int getTotalCount() throws SQLException {
		
		int total = 0;
		String sql = "select count(*) from pr2review";
		pstmt = con.prepareStatement(sql);

		rs = pstmt.executeQuery();
		if (rs.next()) {
			total = rs.getInt(1);
		}
		return total;

	}
	
	public boolean writeReview(String head, String mem_id, String body, int score, int hotelnum) {
		String sql = "insert into pr2review" + " values(pr2review_sequencel.nextval,?,?,?,?,?)";
		try {
			pstmt = con.prepareStatement(sql);
			// pstmt.setInt(1, number);
			pstmt.setString(1, head);
			pstmt.setString(2, mem_id);
			pstmt.setString(3, body);
			pstmt.setInt(4, score);
			pstmt.setInt(5, hotelnum);
			pstmt.executeUpdate();

			return true;

		} catch (Exception e) {
			System.out.println("no");
			return false;
		}

	}
	
	public String getHotelName(int num) throws SQLException {
		String sql="select hotel_name from pr2hotel where hotel_id="+num+"";
		pstmt=con.prepareStatement(sql);
		rs=pstmt.executeQuery();
		
		String hotelname = null;
		while(rs.next()) {
			hotelname=rs.getString("hotel_name");
		}
		return hotelname;
		
	}
	
	// 특정 hotel_name 으로 전체 정보 select
	public ArrayList<HotelVO> getHotelInfo(String shotel_name) throws SQLException {
		ArrayList<HotelVO> harray = new ArrayList<HotelVO>();
		String sql = "select h.hotel_name, h.hotel_address, h.room_imsi, h.room_aprice, h.room_bprice, h.room_cprice"
				+ " ,h.hotel_wifi, h.hotel_pet, h.hotel_bf, h.hotel_rs, h.hotel_ciga, h.hotel_wc"
				+ " ,r.review_title, r.review_score, nvl('없음',m.mem_name)memname, r.review_content"
				+ " from pr2hotel h, pr2review r, pr2member m"
				+ " where h.hotel_id=r.hotel_id(+) and r.mem_id=m.mem_id(+) " + " and h.hotel_name=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, shotel_name);
		rs = pstmt.executeQuery();

		while (rs.next()) {
			String hotel_name = rs.getString("hotel_name");
			String hotel_address = rs.getString("hotel_address");
			String room_imsi = rs.getString("room_imsi");
			int room_aprice = rs.getInt("room_aprice");
			int room_bprice = rs.getInt("room_bprice");
			int room_cprice = rs.getInt("room_cprice");
			int hotel_wifi = rs.getInt("hotel_wifi");
			int hotel_pet = rs.getInt("hotel_pet");
			int hotel_bf = rs.getInt("hotel_bf");
			int hotel_rs = rs.getInt("hotel_rs");
			int hotel_ciga = rs.getInt("hotel_ciga");
			int hotel_wc = rs.getInt("hotel_wc");
			String review_title = rs.getString("review_title");
			String review_score = rs.getString("review_score");
			String mem_name = rs.getString("memname");
			String review_content = rs.getString("review_content");
			HotelVO tv = new HotelVO(hotel_name, hotel_address, room_imsi, room_aprice, room_bprice, room_cprice,
					hotel_wifi, hotel_pet, hotel_bf, hotel_ciga, hotel_rs, hotel_wc, review_title, review_score,
					review_content, mem_name);
			harray.add(tv);
		}
		return harray;
	}

	public ArrayList<RoomVO> getRoomImsi(String hotel_name) throws SQLException {
		ArrayList<RoomVO> iarray = new ArrayList<RoomVO>();
		String sql = "select room_imsi, hotel_id from pr2hotel where hotel_name=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, hotel_name);
		rs = pstmt.executeQuery();
		while (rs.next()) {
			String room_imsi = rs.getString("room_imsi");
			String hotel_id = rs.getString("hotel_id");
			RoomVO tv = new RoomVO(room_imsi, hotel_id);
			iarray.add(tv);

		}
		return iarray;
	}

	public ArrayList<RoomVO> getRoomInfo(String tmp, String selected_in, String selected_out, String hotel_name)
			throws SQLException {
		ArrayList<RoomVO> room_array = new ArrayList<RoomVO>();
		String table = "pr2room" + tmp;
		String sql = "select distinct r.*" + " from " + table + " r" + " where r.room_num not in("
				+ " select distinct substr(v2.pr2record,5,3) from pr2reserv2 v2, pr2hotel h"
				+ " where substr(v2.pr2record,1,4)"
				// +" =(select hotel_id from pr2hotel where hotel_name=?)"
				+ " =?" + " and to_char(to_date(substr(v2.pr2record,8,6),'YYMMDD'), 'YYYY-MM-DD') between ? and ?)"
				+ " order by r.room_num";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, hotel_name);
		pstmt.setString(2, selected_in);
		pstmt.setString(3, selected_out);
		rs = pstmt.executeQuery();
		while (rs.next()) {
			int room_num = rs.getInt("room_num");
			String room_rank = rs.getString("room_rank");
			int room_bath = rs.getInt("room_bath");
			int room_bed = rs.getInt("room_bed");
			int room_kit = rs.getInt("room_kit");
			int room_size = rs.getInt("room_size");
			RoomVO tv = new RoomVO(room_num, room_rank, room_bath, room_bed, room_kit, room_size);
			room_array.add(tv);
		}
		return room_array;
	}
	
	// 호텔 이름으로 호텔 id 가져오기
	
	public String searchHotelId(String hotel_name) throws SQLException {
		
		String sql = "select hotel_id from pr2hotel where hotel_name = ?";
		
		String hotel_id = "";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, hotel_name);
		
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			hotel_id = rs.getString("hotel_id");		
		}
		
		return hotel_id;
	}
	
	// reserv 호텔 reserv2 호텔 데이터 삽입
	public boolean getReservHotel(String hotel_id, int room_num, String reserv_in, String reserv_out, String mem_id,
			int room_price) throws SQLException {

		String sql = "insert into pr2reserv" + " values(pr2reserv_sequencel.nextval, ?,?,?,?,?,?)";
		System.out.println(hotel_id + room_num + mem_id + room_price);
		System.out.println(reserv_in);
		System.out.println(reserv_out);
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, room_num);
			pstmt.setString(2, hotel_id);
			pstmt.setInt(3, room_price);
			pstmt.setString(4, reserv_in);
			pstmt.setString(5, reserv_out);
			pstmt.setString(6, mem_id);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("pr2reserv error");
			return false;
		}
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate startDate = LocalDate.parse(reserv_in, formatter);
		LocalDate endDate = LocalDate.parse(reserv_out, formatter);

		int dateDiff = Period.between(startDate, endDate).getDays() + 1;

		for (int i = 0; i < dateDiff; i++) {
			LocalDate currentDate = startDate.plusDays(i);
			if (currentDate.getMonthValue() > endDate.getMonthValue()
					|| (currentDate.getMonthValue() == endDate.getMonthValue()
							&& currentDate.getDayOfMonth() > endDate.getDayOfMonth())) {
				break;
			}
			String datePlus = currentDate.format(formatter);
			String sql2 = "insert into pr2reserv2 (pr2record) VALUES(?||?||to_char(to_date(?,'YYYY-MM-DD'), 'YYMMDD'))";
			System.out.println(datePlus);
			try {
				pstmt2 = con.prepareStatement(sql2);
				pstmt2.setString(1, hotel_id);
				pstmt2.setInt(2, room_num);
				pstmt2.setString(3, datePlus);
				pstmt2.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("pr2reserv2 error");
				return false;
			}
		}
		return true;
	}

	// ############################################## 준엽 파트 ##############################################

	// 멤버테이블 전체 select
	public ArrayList<MemberVO> listMember() throws SQLException {

		ArrayList<MemberVO> listMember = new ArrayList<MemberVO>();
		String sql = "select * from pr2member";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();

		while (rs.next()) {

			MemberVO memberVO = new MemberVO();
			memberVO.setMem_id(rs.getString("mem_id"));
			memberVO.setMem_pw(rs.getString("mem_pw"));
			memberVO.setMem_email(rs.getString("mem_email"));
			memberVO.setMem_name(rs.getString("mem_name"));
			memberVO.setMem_tel(rs.getString("mem_tel"));
			memberVO.setMem_admin(rs.getInt("mem_admin"));

			listMember.add(memberVO);
		}

		return listMember;
	}

	// 멤버테이블 특정 id로 select
	public MemberVO findMember(String mem_id) throws SQLException {

		String sql = "select * from pr2member where mem_id = ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, mem_id);
		rs = pstmt.executeQuery();

		if (rs.next()) {

			MemberVO memberVO = new MemberVO();

			memberVO.setMem_id(rs.getString("mem_id"));
			memberVO.setMem_pw(rs.getString("mem_pw"));
			memberVO.setMem_email(rs.getString("mem_email"));
			memberVO.setMem_name(rs.getString("mem_name"));
			memberVO.setMem_tel(rs.getString("mem_tel"));
			memberVO.setMem_admin(rs.getInt("mem_admin"));

			return memberVO;

		} else {

			return null;

		}
	}

	// 호텔테이블 전체 select
	public ArrayList<HotelVO> listHotel() throws SQLException {

		ArrayList<HotelVO> listHotel = new ArrayList<HotelVO>();
		String sql = "select * from pr2hotel";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();

		while (rs.next()) {

			HotelVO hotelVO = new HotelVO();

			hotelVO.setHotel_id(rs.getString("hotel_id"));
			hotelVO.setHotel_name(rs.getString("hotel_name"));
			hotelVO.setHotel_address(rs.getString("hotel_address"));
			hotelVO.setRoom_aprice(rs.getInt("room_aprice"));
			hotelVO.setRoom_bprice(rs.getInt("room_bprice"));
			hotelVO.setRoom_cprice(rs.getInt("room_cprice"));
			hotelVO.setRoom_imsi(rs.getString("room_imsi"));
			hotelVO.setMem_id(rs.getString("mem_id"));
			hotelVO.setHotel_wifi(rs.getInt("hotel_wifi"));
			hotelVO.setHotel_pet(rs.getInt("hotel_pet"));
			hotelVO.setHotel_bf(rs.getInt("hotel_bf"));
			hotelVO.setHotel_rs(rs.getInt("hotel_rs"));
			hotelVO.setHotel_ciga(rs.getInt("hotel_ciga"));
			hotelVO.setHotel_wc(rs.getInt("hotel_wc"));

			listHotel.add(hotelVO);
		}

		return listHotel;

	}

	// 예약 테이블 전체 select
	public ArrayList<ReservVO> listReserv() throws SQLException {

		ArrayList<ReservVO> reservList = new ArrayList<ReservVO>();
		String sql = "select * from pr2reserv";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();

		while (rs.next()) {

			ReservVO reservVO = new ReservVO();

			reservVO.setReserv_id(rs.getInt("reserv_id"));
			reservVO.setRoom_num(rs.getInt("room_num"));
			reservVO.setHotel_id(rs.getInt("hotel_id"));
			reservVO.setRoom_price(rs.getInt("room_price"));
			reservVO.setReserv_in(rs.getString("reserv_in").substring(0, 10));
			reservVO.setReserv_out(rs.getString("reserv_out").substring(0, 10));
			reservVO.setMem_id(rs.getString("mem_id"));

			reservList.add(reservVO);
		}

		return reservList;
	}

	// 예약테이블 insert
	public boolean insertReserv(int room_num, int hotel_id, int room_price, String reserv_in, String reserv_out,
			String mem_id) throws SQLException {

		String sql = "insert into pr2reserv values (pr2reserv_seq.nextval, ?, ?, ?, ?, ?, ?)";

		pstmt = con.prepareStatement(sql);

		pstmt.setInt(1, room_num);
		pstmt.setInt(2, hotel_id);
		pstmt.setInt(3, room_price);
		pstmt.setString(4, reserv_in);
		pstmt.setString(5, reserv_out);
		pstmt.setString(6, mem_id);

		pstmt.executeUpdate();

		return true;
	}

	// ############################################## 우림 파트 ##############################################

	// 멤버 테이블 insert
	public boolean insertData(String id, String pw, String email, String name, String tel, int admin)
			throws SQLException {

		String sql = "insert into pr2member values (?,?,?,?,?,?)";

		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		pstmt.setString(3, email);
		pstmt.setString(4, name);
		pstmt.setString(5, tel);
		pstmt.setInt(6, admin);

		int res = pstmt.executeUpdate();

		if (res > 0) {
			return true;
		} else {
			return false;
		}

	}

	public MemberVO findId(String mem_name, String mem_email) {
		// 아이디 찾기 메서드

		String sql = "select * from pr2member where mem_name = ? and mem_email = ?";

		MemberVO tidao1 = new MemberVO(); // 회원정보를 저장하는 객체

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mem_name);
			pstmt.setString(2, mem_email);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				tidao1.setMem_name(rs.getString("mem_name"));
				tidao1.setMem_email(rs.getString("mem_email"));
				tidao1.setMem_id(rs.getString("mem_id"));
				System.out.println();
				return tidao1;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	public MemberVO findPw(String mem_id, String mem_name) {

		String sql = "select * from pr2member where mem_id = ? and mem_name =?";
		MemberVO tidao1 = new MemberVO(); // 회원정보를 저장하는 객체

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mem_id);
			pstmt.setString(2, mem_name);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				tidao1.setMem_id(rs.getString("mem_id"));
				tidao1.setMem_name(rs.getString("mem_name"));
				tidao1.setMem_pw(rs.getString("mem_pw"));

				return tidao1;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				con.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}
		return null;
	}

	// id로 회원정보 update
	public boolean updateData(String mem_id, String mem_pw, String mem_email, String mem_tel) {

		String sql = "UPDATE pr2member SET mem_pw = ?, mem_email = ?, mem_tel = ? WHERE mem_id = ?";

		try {
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, mem_pw);
			pstmt.setString(2, mem_email);
			pstmt.setString(3, mem_tel);
			pstmt.setString(4, mem_id);

			pstmt.executeUpdate();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return false;
	}

	public ArrayList<ReservVO> findReserv(String mem_id) {

		String sql = "SELECT * FROM pr2reserv where mem_id = ?";

		ReservVO tidao1 = null;
		ArrayList<ReservVO> listReserv = new ArrayList<ReservVO>();
		
		try {
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mem_id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				
				tidao1 = new ReservVO();
				tidao1.setReserv_id(rs.getInt("reserv_id"));
				tidao1.setRoom_num(rs.getInt("room_num"));
				tidao1.setHotel_id(rs.getInt("hotel_id"));
				tidao1.setRoom_price(rs.getInt("room_price"));
				tidao1.setReserv_in(rs.getString("reserv_in"));
				tidao1.setReserv_out(rs.getString("reserv_out"));
				tidao1.setMem_id(rs.getString("mem_id"));

				listReserv.add(tidao1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return listReserv;
	}
	
	// 호텔 등록
	public boolean insertHotelData(String hotel_name, String hotel_address, int room_aprice, int room_bprice, int room_cprice, String mem_id, 
			int hotel_wifi, int hotel_pet, int hotel_bf, int hotel_rs, int hotel_ciga, int hotel_wc)
				throws SQLException {

			String sql = "insert into pr2hotel values (pr2hotel_sequence.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, mod(pr2hotel_sequence.currval, 3))";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, hotel_name);
			pstmt.setString(2, hotel_address);
			pstmt.setInt(3, room_aprice);
			pstmt.setInt(4, room_bprice);
			pstmt.setInt(5, room_cprice);
			pstmt.setString(6, mem_id);
			pstmt.setInt(7, hotel_wifi);
			pstmt.setInt(8, hotel_pet);
			pstmt.setInt(9, hotel_bf);
			pstmt.setInt(10, hotel_rs);
			pstmt.setInt(11, hotel_ciga);
			pstmt.setInt(12, hotel_wc);
			
			int res = pstmt.executeUpdate();

			if(res > 0) {
				return true;
			}else {
				return false;
			}

	}
	
	// ############################################## 진규 파트 ##############################################
	
	public ArrayList<HotelVO2> searchWhereInfo(String searchName) throws SQLException{
		
		ArrayList<HotelVO2> tiarray = new ArrayList<HotelVO2>();
		
		String sql = "select h.hotel_name, h.hotel_address, h.room_aprice, h.room_bprice, h.room_cprice, nvl(round(avg(r.review_score), 2), 0) as ravg, h.room_imsi"
		+ " from pr2hotel h left outer join pr2review r" 
		+ " on h.hotel_id = r.hotel_id"
		+ " where h.hotel_address like '%' ||?|| '%'"
		+ " group by h.hotel_id, h.hotel_name, h.hotel_address, h.room_imsi, h.room_aprice, h.room_bprice, h.room_cprice";
		// + " order by h.hotel_name desc";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, searchName);
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			
			String name = rs.getString("hotel_name");
			String addr = rs.getString("hotel_address");
			int aprice = rs.getInt("room_aprice");
			int bprice = rs.getInt("room_bprice");
			int cprice = rs.getInt("room_cprice");
			String ravg = rs.getString("ravg");
			
			HotelVO2 hvo = new HotelVO2(/* id, */name, addr, aprice, bprice, cprice/* , imsi */,ravg);
			
			tiarray.add(hvo);
		}
		
		return tiarray;
	}
	
	public ArrayList<HotelVO2> searchNameInfo(String searchName) throws SQLException{
		
		ArrayList<HotelVO2> tiarray = new ArrayList<HotelVO2>();
		
		String sql = "select h.hotel_name, h.hotel_address, h.room_aprice, h.room_bprice, h.room_cprice, nvl(round(avg(r.review_score), 2), 0) as ravg, h.room_imsi"
				+ " from pr2hotel h left outer join pr2review r" 
				+ " on h.hotel_id = r.hotel_id"
				+ " where h.hotel_name like '%' ||?|| '%'"
				+ " group by h.hotel_id, h.hotel_name, h.hotel_address, h.room_imsi, h.room_aprice, h.room_bprice, h.room_cprice";
				// + " order by h.hotel_name desc";
		
		pstmt = con.prepareStatement(sql);
		//pstmt.setString(1, searchName);
		pstmt.setString(1, searchName);
		
		rs=pstmt.executeQuery();
		
		while(rs.next()) {
			
			String name = rs.getString("hotel_name");
			String addr = rs.getString("hotel_address");
			int aprice = rs.getInt("room_aprice");
			int bprice = rs.getInt("room_bprice");
			int cprice = rs.getInt("room_cprice");
			String ravg = rs.getString("ravg");
			
			HotelVO2 hvo = new HotelVO2(name, addr, aprice, bprice, cprice, ravg);
			
			tiarray.add(hvo);
		}
		return tiarray;	
	}
	
	public ArrayList<HotelVO2> getAllInfo() throws SQLException{
		
		ArrayList<HotelVO2> tiarray = new ArrayList<HotelVO2>();
	
		String sql = "select h.hotel_name, h.hotel_address, h.room_aprice, h.room_bprice, h.room_cprice, nvl(round(avg(r.review_score), 2), 0) as ravg, h.room_imsi"
				+ " from pr2hotel h left outer join pr2review r" 
				+ " on h.hotel_id = r.hotel_id"
				+ " group by h.hotel_id, h.hotel_name, h.hotel_address, h.room_imsi, h.room_aprice, h.room_bprice, h.room_cprice";
				// + " order by h.hotel_name desc";
		
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			String name = rs.getString("hotel_name");
			String addr = rs.getString("hotel_address");
			int aprice = rs.getInt("room_aprice");
			int bprice = rs.getInt("room_bprice");
			int cprice = rs.getInt("room_cprice");
			String ravg = rs.getString("ravg");

			HotelVO2 hvo = new HotelVO2(name, addr, aprice, bprice, cprice, ravg);
			tiarray.add(hvo);
		}
		return tiarray;
	}
	
	public ArrayList<HotelVO2> getAllInfo_Sorted(String howSorted) throws SQLException{
		
		ArrayList<HotelVO2> tiarray = new ArrayList<HotelVO2>();
		
		String plus = "";
		
		System.out.println("넘어온 문자열은 : " + howSorted);
		System.out.println("plus의 값은 : " + plus);
		String sql = "select h.hotel_name, h.hotel_address, h.room_aprice, h.room_bprice, h.room_cprice, nvl(round(avg(r.review_score), 2), 0) as ravg, h.room_imsi"
				+ " from pr2hotel h left outer join pr2review r" 
				+ " on h.hotel_id = r.hotel_id"
				+ " group by h.hotel_id, h.hotel_name, h.hotel_address, h.room_imsi, h.room_aprice, h.room_bprice, h.room_cprice"
				+ " order by ";
		
		if (howSorted.equals("descname"))
		    sql += "h.hotel_name desc";
		else if (howSorted.equals("ascname"))
		    sql += "h.hotel_name asc";
		else if (howSorted.equals("descscore"))
		    sql += "ravg desc";
		else if (howSorted.equals("ascscore"))
		    sql += "ravg asc";
		
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			
			String name = rs.getString("hotel_name");
			String addr = rs.getString("hotel_address");
			int aprice = rs.getInt("room_aprice");
			int bprice = rs.getInt("room_bprice");
			int cprice = rs.getInt("room_cprice");
			String ravg = rs.getString("ravg");
			
			HotelVO2 hvo = new HotelVO2(name, addr, aprice, bprice, cprice,ravg);
			tiarray.add(hvo);
		}
		return tiarray;
	}
	
	public ArrayList<HotelVO2> searchWhereInfo_Sort(String howSorted, String searchName) throws SQLException{
		
		ArrayList<HotelVO2> tiarray = new ArrayList<HotelVO2>();
		String plus="";
		
		String sql = "select h.hotel_name, h.hotel_address, h.room_aprice, h.room_bprice, h.room_cprice, nvl(round(avg(r.review_score), 2), 0) as ravg, h.room_imsi"
				+ " from pr2hotel h left outer join pr2review r" 
				+ " on h.hotel_id = r.hotel_id"
				+ " where h.hotel_address like '%' ||?|| '%'"
				+ " group by h.hotel_id, h.hotel_name, h.hotel_address, h.room_imsi, h.room_aprice, h.room_bprice, h.room_cprice"
				+ " order by ";
		
		if (howSorted.equals("descname"))
		    sql += "h.hotel_name desc";
		else if (howSorted.equals("ascname"))
		    sql += "h.hotel_name asc";
		else if (howSorted.equals("descscore"))
		    sql += "ravg desc";
		else if (howSorted.equals("ascscore"))
		    sql += "ravg asc";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, searchName);
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			String name = rs.getString("hotel_name");
			String addr = rs.getString("hotel_address");
			int aprice = rs.getInt("room_aprice");
			int bprice = rs.getInt("room_bprice");
			int cprice = rs.getInt("room_cprice");
			String ravg = rs.getString("ravg");
			
			HotelVO2 hvo = new HotelVO2(name, addr, aprice, bprice, cprice, ravg);
			tiarray.add(hvo);
		}
		return tiarray;
	}
	
	public ArrayList<HotelVO2> searchNameInfo_Sorted(String howSorted, String searchName) throws SQLException{
		
		ArrayList<HotelVO2> tiarray = new ArrayList<HotelVO2>();
		String plus="";
		
		String sql = "select h.hotel_name, h.hotel_address, h.room_aprice, h.room_bprice, h.room_cprice, nvl(round(avg(r.review_score), 2), 0) as ravg, h.room_imsi"
				+ " from pr2hotel h left outer join pr2review r" 
				+ " on h.hotel_id = r.hotel_id"
				+ " where h.hotel_address like '%' ||?|| '%' or h.hotel_name like '%' ||?|| '%'"
				+ " group by h.hotel_id, h.hotel_name, h.hotel_address, h.room_imsi, h.room_aprice, h.room_bprice, h.room_cprice"
				+ " order by ";
		
		if (howSorted.equals("descname"))
		    sql += "h.hotel_name desc";
		else if (howSorted.equals("ascname"))
		    sql += "h.hotel_name asc";
		else if (howSorted.equals("descscore"))
		    sql += "ravg desc";
		else if (howSorted.equals("ascscore"))
		    sql += "ravg asc";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, searchName);
		pstmt.setString(2, searchName);
		rs=pstmt.executeQuery();
		
		while(rs.next()) {
			String name = rs.getString("hotel_name");
			String addr = rs.getString("hotel_address");
			int aprice = rs.getInt("room_aprice");
			int bprice = rs.getInt("room_bprice");
			int cprice = rs.getInt("room_cprice");
			String ravg = rs.getString("ravg");
			
			HotelVO2 hvo = new HotelVO2(name, addr, aprice, bprice, cprice, ravg);
			tiarray.add(hvo);
		}
		return tiarray;
		
	}
	
}

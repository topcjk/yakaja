<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- adminReserv.jsp -->
<!-- 예약관리 페이지 -->

<%@ include file="top.jsp"%>
    <!-- Contact Start -->
<div class="container-xxl py-5">
	<div class="container">
    	<div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                <h6 class="bg-white text-center text-primary px-3">Hotel List</h6>
                <h1 class="mb-5">호텔목록</h1>
        </div>
        <c:if test="${empty requestScope.listHotel}">
   			<h4 align="center" style="color:blue;">No hotel information found.</h4>
		</c:if>
		<div class="container col-lg-8">
		  <div class="row justify-content-center">
		    <div class="table-responsive">
		        <table class="table table-bordered">
		          <tr align="center">
		          	<th>호텔id</th>
		          	<th>호텔명</th>
		          	<th>주소</th>
		          	<th>room_a/b/c</th>
		          	<th>분류코드</th>
		          	<th>업주id</th>
		          	<th>편의시설</th>
		          </tr>
		         
		       	  <c:forEach var="hotelVO" items="${listHotel}">
		          <tr align="center">
					<td>
					  <div class="text-primary">
					  	${hotelVO.hotel_id}
					  </div>
					</td>
		            <td style="white-space: nowrap;">${hotelVO.hotel_name}</td>
		            <td style="white-space: nowrap;">${hotelVO.hotel_address}</td>
		            <td style="white-space: nowrap;">${hotelVO.room_aprice}/${hotelVO.room_bprice}/${hotelVO.room_cprice}</td>
		            <td style="white-space: nowrap;">${hotelVO.room_imsi}</td>
		            <td style="white-space: nowrap;">${hotelVO.mem_id}</td>
		            <td style="white-space: nowrap;">${hotelVO.hotel_wifi}/${hotelVO.hotel_pet}/${hotelVO.hotel_bf}/${hotelVO.hotel_rs}/${hotelVO.hotel_ciga}/${hotelVO.hotel_wc}</td>
		          </tr>
		          </c:forEach> 

		          <tr>
		            <td colspan="7" align="center">
		            	<input type="button" value="뒤로가기" onclick="history.back()" class="btn btn-primary">
		            </td>
		          </tr>
		        </table>
		    </div>
		  </div>
		</div>
	</div>
</div>
<%@ include file="bottom.jsp"%>
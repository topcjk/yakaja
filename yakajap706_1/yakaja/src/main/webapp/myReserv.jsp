<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- myReserv.jsp -->
<!-- 나의 예약목록 보기 -->

<%@ include file="top.jsp"%>

<div class="container-xxl py-5">
	<div class="container">
    	<div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                <h6 class="bg-white text-center text-primary px-3">MY RESERVATION</h6>
                <h1 class="mb-5">나의 예약목록 보기</h1>
        </div>
        <c:if test="${empty requestScope.listReserv}">
   			<h4 align="center" style="color:blue;">No reservation information found.</h4>
		</c:if>
		<div class="container col-lg-8">
		  <div class="row justify-content-center">
		    <div class="table-responsive">
		        <table class="table table-bordered">
		          <tr align="center">
		          	<th>예약id</th>
		          	<th>방번호</th>
		          	<th>호텔id</th>
		          	<th>결제금액</th>
		          	<th>체크인</th>
		          	<th>체크아웃</th>
		          </tr>
		         
		       	  <c:forEach var="reservVO" items="${requestScope.listReserv}">
		          <tr align="center">
					<td>
					  <div class="text-primary">
					  	${reservVO.reserv_id}
					  </div>
					</td>
		            <td style="white-space: nowrap;">${reservVO.room_num}</td>
		            <td style="white-space: nowrap;">${reservVO.hotel_id}</td>
		            <td style="white-space: nowrap;">${reservVO.room_price}</td>
		            <td style="white-space: nowrap;">${reservVO.reserv_in}</td>
		            <td style="white-space: nowrap;">${reservVO.reserv_out}</td>
		          </tr>
		          </c:forEach> 

		          <tr>
		            <td colspan="6" align="center">
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
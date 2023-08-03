<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- adminMember.jsp -->
<!-- 회원관리 페이지 -->

<%@ include file="top.jsp"%>


    <!-- Contact Start -->
<div class="container-xxl py-5">
	<div class="container">
    	<div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                <h6 class="bg-white text-center text-primary px-3">Member List</h6>
                <h1 class="mb-5">회원목록</h1>
        </div>
        <c:if test="${empty requestScope.listMember}">
   			<h4 align="center" style="color:blue;">No member information found.</h4>
		</c:if>
		<div class="container col-lg-8">
		  <div class="row justify-content-center">
		    <div class="table-responsive">
		        <table class="table table-bordered">
		          <tr align="center">
		          	<th>번호</th>
		          	<th>아이디</th>
		          	<th>이메일</th>
		          	<th>이름</th>
		          	<th>전화번호</th>
		          	<th>구분</th>
		          </tr>
		         
		       	  <c:forEach var="memberVO" items="${listMember}" varStatus="status">
		          <tr align="center">
					<td>
					  <div class="text-primary">
					  	${status.index + 1}
					  </div>
					</td>
		            <td>${memberVO.mem_id}</td>
		            <td>${memberVO.mem_email}</td>
		            <td>${memberVO.mem_name}</td>
		            <td>${memberVO.mem_tel}</td>
		            <td>${memberVO.mem_admin}</td>
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
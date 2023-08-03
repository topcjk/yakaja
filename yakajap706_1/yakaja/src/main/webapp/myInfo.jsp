<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- myInfo.jsp -->
<!-- 내 정보보기 페이지 -->

<%@ include file="top.jsp"%>

<div class="container-xxl py-5">
	<div class="container">
    	<div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                <h6 class="section-title bg-white text-center text-primary px-3">My Information</h6>
                <h2 class="mb-5">환영합니다!, ${sessionScope.memberVO.mem_name}님!</h2>
                <h1 class="mb-5">내 정보</h1>
        </div>
		<div class="container">
		  <div class="row justify-content-center">
		    <div class="col-lg-6">
		        <table class="table table-bordered">
		          <tr align="center">   
					<td>
					    <h5 class="text-primary">
					    	<span style="flex-grow: 1;">아이디</span>
						</h5>
					</td>
		            <td>${sessionScope.memberVO.mem_id}</td>
		          </tr>
		          <tr align="center">   
					<td>
					    <h5 class="text-primary">
					    	<span style="flex-grow: 1;">이메일</span>
						</h5>
					</td>
		            <td>${sessionScope.memberVO.mem_email}</td>
		          </tr>
		          <tr align="center">   
					<td>
					    <h5 class="text-primary">
					    	<span style="flex-grow: 1;">이름</span>
						</h5>
					</td>
		            <td>${sessionScope.memberVO.mem_name}</td>
		          </tr>
		          <tr align="center">   
					<td>
					    <h5 class="text-primary">
					    	<span style="flex-grow: 1;">전화번호</span>
						</h5>
					</td>
		            <td>${sessionScope.memberVO.mem_tel}</td>
		          </tr>
		          <tr>
		            <td colspan="2" align="center">
		            	<input type="button" value="수정" style="width:100px;" onclick="location.href='myUpdate.do'" class="btn btn-primary">
		            	<input type="button" value="탈퇴" style="width:100px;" onclick="location.href='myDelete.do'" class="btn btn-primary">
		            </td>
		          </tr>
		        </table>
		    </div>
		  </div>
		</div>
	</div>
</div>
<%@ include file="bottom.jsp"%>
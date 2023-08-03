<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- myUpdate.jsp -->
<!-- 회원정보 수정 -->
<%@ include file="top.jsp"%>

<style>
    .center-align {
        text-align: center;
    }
</style>


<div class="container-xxl py-5">
	<div class="container">
    	<div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                <h6 class="section-title bg-white text-center text-primary px-3">UPDATE</h6>
                <h1 class="mb-5">내 정보 수정</h1>
        </div>
		<div class="container">
		  <div class="row justify-content-center">
		    <div class="col-lg-6">
		      <form action="myUpdate_ok.do" method="post">
		        <table class="table table-bordered">
		          <tr align="center">   
					<td>
					  <div>
					    <span>
					      <h5 class="text-primary">
					        <span>ID</span>
					      </h5>
					    </span>
					  </div>
					</td>
		            <td><input type="text" id="mem_id" name="mem_id" value="${sessionScope.memberVO.mem_id}" readonly class="form-control center-align"></td>
		          </tr>
		          <tr align="center">   
					<td>
					  <div>
					    <span>
					      <h5 class="text-primary">
					        <span>비밀번호</span>
					      </h5>
					    </span>
					  </div>
					</td>
		            <td><input type="password" id="mem_pw" name="mem_pw" value="${sessionScope.memberVO.mem_pw}" class="form-control center-align" required></td>
		          </tr>
		          <tr align="center">   
					<td>
					  <div>
					    <span>
					      <h5 class="text-primary">
					        <span>이메일</span>
					      </h5>
					    </span>
					  </div>
					</td>
		            <td><input type="text" id="mem_email" name="mem_email" value="${sessionScope.memberVO.mem_email}" class="form-control center-align" required></td>
		          </tr>
		          <tr align="center">   
					<td>
					  <div>
					    <span>
					      <h5 class="text-primary">
					        <span>이름</span>
					      </h5>
					    </span>
					  </div>
					</td>
		            <td><input type="text" id="mem_name" name="mem_name" value="${sessionScope.memberVO.mem_name}" readOnly class="form-control center-align"></td>
		          </tr>
		          <tr align="center">   
					<td>
					  <div>
					    <span>
					      <h5 class="text-primary">
					        <span>전화번호</span>
					      </h5>
					    </span>
					  </div>
					</td>
		            <td><input type="text" id="mem_tel" name="mem_tel" value="${sessionScope.memberVO.mem_tel}" class="form-control center-align" required></td>
		          </tr>
		          <tr>
		            <td colspan="2" align="center">
		            	<input type="submit" value="수정하기" class="btn btn-primary" style="width:100px;">
		            	<input type="button" value="취소" onclick="location.href='myInfo.do'" class="btn btn-primary" style="width:100px;">
		            </td>
		          </tr>
		        </table>
		      </form>
		    </div>
		  </div>
		</div>
	</div>
</div>
<%@ include file="bottom.jsp"%>

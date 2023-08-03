<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- login.jsp -->
<!-- 로그인 -->
<%@ include file="top.jsp"%>

<div class="container-xxl py-5">
	<div class="container">
    	<div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                <h6 class="section-title bg-white text-center text-primary px-3">Login</h6>
                <h1 class="mb-5">로그인</h1>
        </div>
		<div class="container">
		  <div class="row justify-content-center">
		    <div class="col-lg-6">
		      <form action="login_ok.do" method="post">
		        <table class="table table-bordered">
		          <tr>   
					<td>
					    <h5 align="center">
					    	<span style="flex-grow: 1;">아이디</span>
						</h5>
					</td>
		            <td><input type="text" id="mem_id" name="mem_id" class="form-control" maxlength="20" required></td>
		          </tr>
		          <tr>   
					<td>
					    <h5 align="center">
					    	<span style="flex-grow: 1;">비밀번호</span>
						</h5>
					</td>
		            <td><input type="password" id="mem_pw" name="mem_pw" class="form-control" required></td>
		          </tr>
		          <tr align="center">
		            <td colspan="2" align="center">
		            	<input type="button" value="회원가입" style="width:100px;" onclick="location.href='join.do'" class="btn btn-primary">
		            	<input type="submit" value="로그인" style="width:100px;" class="btn btn-primary">
		            </td>
		          </tr>
		        </table>
		        <div align="center">
		        	<a href="findId.do">아이디찾기</a>  /  <a href="findPw.do">비밀번호찾기</a>
		        </div>
		      </form>
		    </div>
		  </div>
		</div>
	</div>
</div>

<%@ include file="bottom.jsp"%>
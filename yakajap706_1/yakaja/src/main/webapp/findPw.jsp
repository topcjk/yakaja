<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- findId.jsp -->
<%@ include file="top.jsp"%>

<script>
	window.onload = function(){
		// 취소버튼 누르면 뒤로 가기
		document.getElementById('btnCancel').onclick = function(){
			history.go(-1);
		}
	}
</script>

<div class="container-xxl py-5">
	<div class="container">
    	<div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                <h6 class="section-title bg-white text-center text-primary px-3">Find_Password</h6>
                <h1 class="mb-5">비밀번호 찾기</h1>
        </div>
		<div class="container">
		  <div class="row justify-content-center">
		    <div class="col-lg-6">
		      <form action="findPw_ok.do" method="post">
		        <table class="table table-bordered">
		          <tr>   
					<td>
					    <h5 align="center">
					    	<span style="flex-grow: 1;">아이디</span>
						</h5>
					</td>
		            <td><input type="text" id="mem_id" name="mem_id" class="form-control" required></td>
		          </tr>
		          <tr>   
					<td>
					    <h5 align="center">
					    	<span style="flex-grow: 1;">이름</span>
						</h5>
					</td>
		            <td><input type="text" id="mem_name" name="mem_name" class="form-control" required></td>
		          </tr>
		          <tr>
		            <td colspan="2" align="center">
		            	<input type="submit" value="비밀번호 찾기" class="btn btn-primary">
		            	<button type="reset" id="btnCancel" style="width:100px;" class="btn btn-primary">취소</button>
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
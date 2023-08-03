<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- join.jsp -->
<!-- 회원가입 -->
<%@ include file="top.jsp"%>

<script src="https://cdn.iamport.kr/v1/iamport.js"></script>

<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<script type="text/javascript">
	
	function checkDuplication(){
		
		var duplicateMessage = document.getElementById('duplicateMessage')
		var mem_id = document.getElementById('mem_id').value
		console.log(mem_id)
		
		if(mem_id == ""){
			$("#duplicateMessage").html('아이디를 입력하세요.')
			$("#duplicateMessage").css('color', 'red')
			return 
		}
		
		// Ajax 요청 수행 및 중복 여부 확인
		$.ajax({
			url : "checkDuplication.do",
			type : "POST",
			headers : {"Content-Type" : "application/json"},
			data : JSON.stringify({
				mem_id : mem_id
			}),
			success : function(result){
				
				console.log(result)
				if(result == "fail"){ // 사용불가능, 중복 o
					$("#duplicateMessage").html('중복된 아이디입니다.')
					$("#duplicateMessage").css('color', 'red')
					// duplicateMessage.innerText = '중복된 아이디입니다.';
				} else{ // 사용가능
					$("#duplicateMessage").html('사용가능한 아이디입니다.')
					$("#duplicateMessage").css('color', 'green')
					// duplicateMessage.innerText = '사용가능한 아이디입니다.';
				}
			}
		});
	}
	
	
</script>

    <!-- Contact Start -->
<div class="container-xxl py-5">
	<div class="container">
    	<div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                <h6 class="bg-white text-center text-primary px-3">Join</h6>
                <h1 class="mb-5">회원가입</h1>
        </div>
		<div class="container">
		  <div class="row justify-content-center">
		    <div class="col-lg-6">
		      <form action="join_ok.do" method="post">
		        <table class="table table-bordered">
		          <tr>   
					<td>
					    <h5 align="center" class="text-primary">
					    	<span style="flex-grow: 1;">아이디</span>
						</h5>
					</td>
					<td>
						<span style="flex-grow: 1;">
							<input type="text" id="mem_id" name="mem_id" class="form-control" required>
						</span>
						<div>
						<div style="display:flex;;">
							<div align="center" align="left">	
								<input type="button" value="중복체크" class="form-control" onclick="checkDuplication()">
							</div>
							&nbsp;&nbsp;
							<div id="duplicateMessage" class="form-control"></div>
						</div>
					</div>
					</td>
		          </tr>
		          <tr>   
					<td>
					    <h5 align="center" class="text-primary">
					    	<span style="flex-grow: 1;">패스워드</span>
						</h5>
					</td>
		            <td><input type="password" id="mem_pw" name="mem_pw" class="form-control" required></td>
		          </tr>
		          <tr>   
					<td>
					    <h5 align="center" class="text-primary">
					    	<span style="flex-grow: 1;">이메일</span>
						</h5>
					</td>
		            <td><input type="text" id="mem_email" name="mem_email" class="form-control" required></td>
		          </tr>
		          <tr>   
					<td>
					    <h5 align="center" class="text-primary">
					    	<span style="flex-grow: 1;">이름</span>
						</h5>
					</td >
		            <td><input type="text" id="mem_name" name="mem_name" class="form-control" required></td>
		          </tr>
		          <tr>   
					<td>
					    <h5 align="center" class="text-primary">
					    	<span style="flex-grow: 1;">전화번호</span>
						</h5>
					</td>
		            <td><input type="text" id="mem_tel" name="mem_tel" class="form-control" required></td>
		          </tr>
		          <tr>   
					<td>
					    <h5 align="center" class="text-primary">
					    	<span style="flex-grow: 1;">회원 구분</span>
						</h5>
					</td>
		            <td>
		            	<div align="center">
			            	일반사용자&nbsp;<input type="radio" name="mem_admin" value="0" checked>&nbsp;&nbsp;&nbsp;
			            	업주&nbsp;<input type="radio" name="mem_admin" value="1">
		            	</div>
		            </td>
		          </tr>
		          <tr>
		            <td colspan="2" align="center">
		            	<input type="submit" value="회원가입" class="btn btn-primary">
		            	<input type="button" value="메인으로" onclick="location.href='main.do'" class="btn btn-primary">
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

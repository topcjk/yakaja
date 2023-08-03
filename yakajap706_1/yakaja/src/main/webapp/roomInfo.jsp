<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="top.jsp"%>

<!-- roomInfo.jsp -->
<!-- 호실 상세 페이지 -->

<style>
	.table {
  width: 500px;
  align: center;
}
</style>

<script>

	function reserv(){
		
		var hotel_id = document.getElementById('hotel_id').value;
		var hotel_name = document.getElementById('hotel_name').value;
		var total_day = document.getElementById('total_day').value;

		var room_price = document.getElementById('room_price').innerText;
		var room_num = document.getElementById('room_num').innerText;
		var reserv_in = document.getElementById('reserv_in').innerText;
		var reserv_out = document.getElementById('reserv_out').innerText;
		
		var total_price = total_day * room_price;
		
		window.location.href = "payment.do?hotel_id=" + hotel_id + "&hotel_name=" + hotel_name
				+ "&total_price=" + total_price + "&reserv_in=" + reserv_in + "&reserv_out=" + reserv_out
				+ "&room_num=" + room_num;
		
	}
</script>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

	<div class="backgroundDiv">
		<div class="innerDiv1">
			<div class="titleDiv" align="center">
				<h4 class="title text-primary">객실정보</h4>
				<hr>
			</div>
		</div><!-- innerDiv1-end -->
	</div><!-- backgroundDiv-end -->
	<div class="mainDiv" align="center">
				<div class="roomImgDiv">
					<img src="${param.img}" class="roomImg" width="500px">
				</div>
				<div>체크인 : 12:00 / 체크아웃 14:00</div>
	</div><!-- mainDiv-end -->
		<div class="container">
		  <div class="row justify-content-center" align="center">
		    <div class="col-lg-6">
		        <table class="table table-bordered">
		        <tr align="center">   
					<td>
					    <h5 class="text-primary">
					    	<span>호실</span>
						</h5>
					</td>
					<td>
						<div>
							<h4 class="roomName" id="room_num">${param.room_num}</h4>	
						</div>
					</td>
		          </tr>
		          <tr align="center">   
					<td>
					    <h5 align="center" class="text-primary">
					    	<span>등급</span>
						</h5>
					</td>
					<td>
						<div>
							<h6 class="room_rank" id="room_rank">${param.room_rank}</h6>	
						</div>
					</td>
		          </tr>
		          <tr>   
					<td>
					    <h5 align="center" class="text-primary">
					    	<span>인실</span>
						</h5>
					</td>
		            <td align="center"><h6>${param.room_bed}인실</h6></td>
		          </tr>
		          <tr>   
					<td>
					    <h5 align="center" class="text-primary">
					    	<span>체크인</span>
						</h5>
					</td>
		            <td align="center" id="reserv_in"><h6>${param.reserv_in}</h6></td>
		          </tr>
		          <tr>   
					<td>
					    <h5 align="center" class="text-primary">
					    	<span>체크아웃</span>
						</h5>
					</td>
		            <td align="center" id="reserv_out"><h6>${param.reserv_out}</h6></td>
		          </tr>
		          <tr>   
					<td>
					    <h5 align="center" class="text-primary">
					    	<span>가격</span>
						</h5>
					</td >
		            <td align="center" id="room_price"><h6><strong>${param.room_price}</strong></h6></td>
		          </tr>
		          <tr>   
					<td>
					    <h5 align="center" class="text-primary">
					    	<span>방 사이즈</span>
						</h5>
					</td>
		            <td align="center"><h6>${param.room_size}</h6></td>
		          </tr>
		          <tr>   
					<td>
					    <h5 align="center" class="text-primary">
					    	<span>욕실</span>
						</h5>
					</td>
		            <td align="center"><h6>${param.room_bath}</h6></td>
		          </tr>
		          <tr>   
					<td>
					    <h5 align="center" class="text-primary">
					    	<span>옵션</span>
						</h5>
					</td>
		            <td align="center">
		            	<c:if test="${param.room_bath == 1}">
							욕조
						</c:if>
						<c:if test="${param.room_kit == 1}">
							주방 O
						</c:if>
		            </td>
		          </tr>
		          <tr>
		            <td colspan="2" align="center">
		            	<input type="hidden" value="${param.total_day}" id="total_day">
		            	<input type="hidden" value="${param.hotel_id}" id="hotel_id">
		            	<input type="hidden" value="${param.hotel_name}" id="hotel_name">
		            	<input type="button" value="예약페이지로 이동" class="btn btn-primary" onclick="reserv()">
		            	<input type="button" value="뒤로가기" onclick="history.back()" class="btn btn-primary">
		            </td>
		          </tr>
		        </table>
		    </div>
		  </div>
		</div>		
				
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<%@ include file="bottom.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp"%>

<!-- showHotelInfo.jsp -->
<!-- 특정호텔 날짜 입력, 호실 선택 -->

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
	
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />


<style>

.image-size {
  width: 500px;
  height: 300px;
  align: center;
}  

</style>

<script type="text/javascript">
	
	function timeSort(){
		
		var hotel_name = document.getElementById('hotel_name').value
		var hotel_address = document.getElementById('hotel_address').value
		var room_aprice = document.getElementById('room_aprice').value
		var room_bprice = document.getElementById('room_bprice').value
		var room_cprice = document.getElementById('room_cprice').value
		var room_imsi = document.getElementById('room_imsi').value
		var reserv_in = document.getElementById('reserv_in').value
		var reserv_out = document.getElementById('reserv_out').value
		var floor = document.getElementById('floor').value
		
		// 유효한 날짜 값 확인
	    if (reserv_in === "" || reserv_out === "") {
	      alert("체크인과 체크아웃 날짜를 입력해주세요.");
	      return;
	    }

	    var checkinDate = new Date(reserv_in);
	    var checkoutDate = new Date(reserv_out);

	    // 차이 계산 (밀리초 단위)
	    var timeDiff = Math.abs(checkoutDate.getTime() - checkinDate.getTime());

	    // 일수로 변환
	    var total_day = Math.ceil(timeDiff / (1000 * 3600 * 24));

		console.log(floor)
		console.log(total_day)
		// Ajax 요청 수행 및 중복 여부 확인
		$.ajax({
			url : "roomSort.do",
			type : "POST",
			headers : {"Content-Type" : "application/json"},
			data : JSON.stringify({
				hotel_name : hotel_name,
				room_imsi : room_imsi,
				reserv_in : reserv_in,
				reserv_out : reserv_out
			}),
			success : function(response){
				if(response === "full"){
					console.log("List is full")
				} else{
					
					var jsonData = response;
					
					var roomSelectDiv = document.getElementById("roomSelectDiv");
					
					roomSelectDiv.innerHTML = ""; // 기존 내용 초기화
					
					roomSelectDiv.classList.add("container-xxl");
					roomSelectDiv.classList.add("py-5");
					
					var containerDiv = document.createElement("div");
					containerDiv.classList.add("container");
					
					roomSelectDiv.appendChild(containerDiv);
					
					var div1 = document.createElement("div");
					
					div1.classList.add("row");
					div1.classList.add("g-4");
					div1.classList.add("justify-content-center");
					
					containerDiv.appendChild(div1);
					
					// JSON 데이터를 반복하여 HTML 생성
					
					for(var i=0; i<jsonData.length; i++){
						
						var room = jsonData[i];
						console.log(room)
						var roomNum = room.room_num.toString();
						
						
						if(floor !== "all" && roomNum.charAt(0) !== floor)
							continue;
						
						var div2 = document.createElement("div");
						div2.classList.add("col-lg-4");
						div2.classList.add("col-md-6");
						div2.classList.add("wow");
						div2.classList.add("fadeInUp");
						
						div1.appendChild(div2);
						
						div3 = document.createElement("div");
						
						div3.classList.add("course-item");
						div3.classList.add("bg-light");
						
						div2.appendChild(div3);
						
						var div4 = document.createElement("div");
						
						div4.classList.add("position-relative");
						div4.classList.add("overflow-hidden");
						div4.align="center";
						
						div3.appendChild(div4);
						
						var img = document.createElement("img"); // img 엘리먼트 생성
					    img.src = "img/hotel/" + ((i + 1) % 8) + ".png";
						
					    img.classList.add("position-relative");
					    img.classList.add("image-size");
					    div4.appendChild(img);
					    
					    var div5 = document.createElement("div");
					    div5.classList.add("text-center");
						div5.classList.add("p-4");
						div5.classList.add("pb-0");
						div3.appendChild(div5);
						
						var h1 = document.createElement("h3");
						h1.classList.add("mb-0");
						h1.classList.add("text-primary")
						h1.innerText = room.room_num + "호";
						div5.appendChild(h1);
						
						var h2 = document.createElement("h4");
						h2.classList.add("mb-4");
						h2.innerText = room.room_rank + " / 사이즈 : " + room.room_size;
						div5.appendChild(h2);
						
						if(room.room_rank == '디럭스')
							var room_price = room_aprice;
						else if (room.room_rank == '스탠다드')
							var room_price = room_bprice;
						else
							var room_price = room_cprice;
						
						var div6 = document.createElement("div");
						div6.classList.add("d-flex");
						div6.classList.add("border-top");
						div6.classList.add("justify-content-center"); // 중앙 정렬 클래스 추가
						div3.appendChild(div6);
						
						var input = document.createElement("input");
						input.type = "button";
						input.value = "예약";
						input.classList.add("btn");
						input.classList.add("btn-primary");
						
						input.onclick = (function(room, hotel_name, room_imsi, reserv_in, reserv_out, img, room_price, total_day) {
						    return function() {
						        var queryString = "hotel_name=" + hotel_name
						        	+ "&room_num=" + room.room_num + "&room_rank=" + room.room_rank
						            + "&room_bath=" + room.room_bath + "&room_bed=" + room.room_bed + "&room_kit=" + room.room_kit
						            + "&room_size=" + room.room_size + "&room_imsi=" + room_imsi
						            + "&reserv_in=" + reserv_in + "&reserv_out=" + reserv_out + "&img=" + img.src
						            + "&room_price=" + room_price + "&total_day=" + total_day;

						        console.log("queryString: " + queryString);
						        window.location.href = "roomInfo.do?" + queryString;
						    };
						})(room, hotel_name, room_imsi, reserv_in, reserv_out, img, room_price, total_day);
						
						div6.appendChild(input);
						
					} // for-end
				} // if-end
			} // success-function end
		}); // ajax-end
	}
</script>

<h4 align="center" class="text-primary">객실선택</h4>

<div align="center">
	<table>
		<tr>
			<td>
				<img src="img/hotel/1.png" class="hotelImg" style="width:500px; height:300px;">
			</td>
		</tr>
		<c:if test="${not empty harray[0]}">
		<tr align="center">
			<td>
				<h5>${harray[0].hotel_name}</h5>
			</td>
		</tr>
		</c:if>
		<tr align="center">
			<td>
				<c:if test="${harray[0].hotel_wifi == 1}">
					<i class="fa-solid fa-wifi" id="icon"></i>
				</c:if>
				<c:if test="${harray[0].hotel_bf == 1}">
					<i class="fa-solid fa-bell-concierge" id="icon"></i>
				</c:if>
				<c:if test="${harray[0].hotel_ciga == 1}">
					<i class="fa-solid fa-ban-smoking" id="icon"></i>
				</c:if>
				<c:if test="${harray[0].hotel_rs == 1}">
					<i class="feather-home" id="icon"></i>
				</c:if>
				<c:if test="${harray[0].hotel_pet == 1}">
					<i class="fa-solid fa-dog" id="icon"></i>
				</c:if>
				<c:if test="${harray[0].hotel_wc == 1}">
					<i class="fa-solid fa-wheelchair" id="icon"></i>
				</c:if>
			</td>
		</tr>
	</table>
</div>

<div align="center">
	<table>
		<tr>
			<td>체크인</td>
			<td><input type="date" name="reserv_in" id ="reserv_in" required>&nbsp;&nbsp;
			<td>체크아웃</td>
			<td><input type="date" name="reserv_out" id ="reserv_out" required></td>
		</tr>
		<tr align="center">
			<td colspan="4">
				<input type="hidden" id="hotel_name" value="${harray[0].hotel_name}" name="hotel_name">
				<input type="hidden" id="room_imsi" value="${harray[0].room_imsi}" name="room_imsi">
				<input type="hidden" id="hotel_address" value="${harray[0].hotel_address}" name="hotel_address">
				<input type="hidden" id="room_aprice" value="${harray[0].room_aprice}" name="room_aprice">
				<input type="hidden" id="room_bprice" value="${harray[0].room_bprice}" name="room_bprice">
				<input type="hidden" id="room_cprice" value="${harray[0].room_cprice}" name="room_cprice">
				<input type="button" onclick="timeSort()" style="width:100%;" value="검색" class="btn btn-primary">
			</td>
		</tr>
	</table>
</div>

<div align="center">
	<label>층별로 보기</label>	
	<select class="selectBox" onchange="timeSort()" id="floor">
		<option value="all">전체</option>
		<option value="1">1F</option>
		<option value="2">2F</option>
		<option value="3">3F</option>
		<option value="4">4F</option>
		<option value="5">5F</option>
		<option value="6">6F</option>
	</select>
</div>

<div id="roomSelectDiv">

</div>
		

<%@ include file="bottom.jsp"%>
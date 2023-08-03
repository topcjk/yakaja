<%@page import="com.yakaja.vo.SearchVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.yakaja.dao.MainTelInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="mainStyle.jsp" %>
<%@ include file="top.jsp"%>
<%@ include file="mainMap.jsp" %> 

<!-- yakajaMain.jsp -->
<!-- 메인 -->

<br><br><br>

<form action="searchHotelName.do" method="post" id="searchForm">
	<table style="border:3px; align:center; width:100%; font-size: 20px">
		<tr align="center">
			<td style="background-color:white; width:5%"></td>
			<td>
				<div>
					<h2 class="text-primary">호텔명으로 검색</h2>
				</div>
			</td>
			<td style="background-color:white; width:5%"></td>
		</tr>
		<tr>
			<td style="background-color:white; width:5%"></td>
			<td align="center">
				<img src="img/searchicon.png" width="30px" height="30px">
				<input type="text" name="hotelName" id="searchBox">
				<input type="submit" value="검색">
			</td>
			<td style="background-color:white; width:5%"></td>
		</tr>
	</table>
</form>
<br><br><br>
<hr>

<!--  지역선택부분 -->
<!--  toggle방식 -->

<script>
	function sendLocation(buttonId) {
		alert("요청된 지역: " + buttonId);
		var form = document.getElementById("locationForm");
		var input = document.createElement("input");
		input.setAttribute("type", "hidden");
		input.setAttribute("name", "hotelWhere");
		input.setAttribute("value", buttonId);
		form.appendChild(input);
		form.submit();
	}
</script>

<style>
    .text{
        text-align: center;
    }
</style>

<div align="center">
	<h2 class="text-primary">지역으로 호텔 찾기</h2>
</div>

<form action="searchHotelWhere.do" method="post" id="locationForm">
	<table style=" border:3px; align:center; width:100%; font-size:20px">
		<tr align="center">
			<td style="background-color: white; width:5%"></td>
			<td>
				<div class="outer">
					<div class="incheon">
						<input type="button" value="인천" class="incheonbtn" onclick="sendLocation(this.value)">
					</div>
					<div class="gyeonggi">
						<input type="button" value="경기" class="gyeonggibtn" onclick="sendLocation(this.value)">
					</div>
					<div class="seoul">
						<input type="button" value="서울" class="seoulbtn" onclick="sendLocation(this.value)">
					</div>
					<div class="kangwon">
						<input type="button" value="강원" class="kangwonbtn" onclick="sendLocation(this.value)">
					</div>
					<div class="chungnam">
						<input type="button" value="충청남도" class="chungnambtn"onclick="sendLocation(this.value)">
					</div>
					<div class="chungbuk">
						<input type="button" value="충청북도" class="chungbukbtn"onclick="sendLocation(this.value)">
					</div>
					<div class="daejeon">
						<input type="button" value="대전" class="daejeonbtn"onclick="sendLocation(this.value)">
					</div>
					<div class="gyeongbuk">
						<input type="button" value="경상북도" class="gyeongbukbtn"onclick="sendLocation(this.value)">
					</div>
					<div class="gyeongnam">
						<input type="button" value="경상남도" class="gyeongnambtn"onclick="sendLocation(this.value)">
					</div>
					<div class="busan">
						<input type="button" value="부산" class="busanbtn"onclick="sendLocation(this.value)">
					</div>
					<div class="ulsan">
						<input type="button" value="울산" class="ulsanbtn"onclick="sendLocation(this.value)">
					</div>
					<div class="daegu">
						<input type="button" value="대구" class="daegubtn"onclick="sendLocation(this.value)">
					</div>
					<div class="jeonbuk">
						<input type="button" value="전라북도" class="jeonbukbtn"onclick="sendLocation(this.value)">
					</div>
					<div class="kwangju">
						<input type="button" value="광주" class="kwangjubtn" onclick="sendLocation(this.value)">
					</div>
					<div class="jeonnam">
						<input type="button" value="전라남도" class="jeonnambtn"onclick="sendLocation(this.value)">
					</div>
					<div class="jeju">
						<input type="button" value="제주" class="jejubtn"onclick="sendLocation(this.value)">
					</div>
				</div>
			</td>
			<td style="background-color: white; width:5%"></td>
		</tr>
	</table>
</form>
<br><br><br><br><br>

<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
	MainTelInfoDAO tidao = new MainTelInfoDAO();
	ArrayList<SearchVO>tiArray = tidao.getRankInfo();
%>
<div align="center">
<table id="rankingTable">

	<tr>
		<th>순위</th>
		<th>사진</th>
		<th>이름</th>
		<th>평균평점</th>
	</tr>
	<% for(SearchVO imsi : tiArray) { %>
	<tr>
		<td><%=imsi.getRank1() %></td>
		<td><img src="img/hotel/<%=Integer.parseInt(imsi.getHotel_id()) % 3 %>.png" width="50px"></td>
		<td>
			<a href="goHotel.do?hotel_name=<%=imsi.getHotel_name() %>"><%=imsi.getHotel_name() %></a></td>
		<td><%=imsi.getRavg() %></td>
	</tr>
	<% } %>
</table>
</div>

<%@ include file="bottom.jsp"%>
<%@page import="java.util.Collection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp"%>

<!-- showAllHotel.jsp -->
<!-- 호텔 전체 목록 보기.jsp -->

<% String stateCheck=""; %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모든 호텔 출력하기</title>
<style>
 th, td {
    border-bottom: 1px solid #444444;
  }
  table {
    width: 80%;
    border-top: 1px solid #444444;
    border-collapse: collapse;
  }
  img{
  	width:100px;
  	height: 100px;
  }
  select{
   	margin-left:80%;
  }
</style>


<% stateCheck=String.valueOf(request.getAttribute("state")); %>

<h1  align="center">모든 호텔 보기</h1>
	
<table border=0 align="center">
	
	<tr>
		<td colspan=8>
		<form action="getAllHotel_Sort.do" method="post">	<!-- .do -->	<!-- <form action="Telallview" method="post"> -->
			<div align="center">
					<select id="sel" name=sorter onchange="submit(this.options[this.selectedIndex].value)">
						<option selected disabled value="#" >정렬선택</option>
						<option value="ascname">이름순(ㄱ~ㅎ)</option>
						<option value="descname">이름순(ㅎ~ㄱ)</option>
							    
						<option value="descscore">높은 평점순</option>
						<option value="ascscore">낮은 평점순</option>
					</select>
			</div>
		</form>
		</td>
	</tr>
	
	<tr>
		<td colspan=8>
		<form action="getAllHotel.do">	<!-- .do -->	<!-- <form action="Telallview" method="post"> -->
			<div align="center"><input type="submit" value="모두보기"></div>
		</form>
		</td>
	</tr>
	<tr>
		<td colspan=8>
		<form action="searchHotelWhere.do" method="post">	<!-- .do -->	<!-- <form action="Telallview" method="post"> -->
			<div align="center">
 			<a><input type="text" placeholder="지역 검색하기" onfocus="this.placeholder=''" onblur="this.placeholder='호텔위치 검색하기'" name="hotelWhere"></a>
			<a><input type="submit" value="검색"></a>
			</div>
		</form>
		</td>
	</tr>
	<tr>
		<td colspan=8>
		<form action="searchHotelName.do" method="post">	<!-- .do -->	<!-- <form action="Telallview" method="post"> -->
<!-- 			<div align="center"><input type="text" value="호텔이름 검색하기" name="hotelname"></div>
 -->		<div align="center">
 			<a><input type="text" placeholder="호텔명 검색하기" onfocus="this.placeholder=''" onblur="this.placeholder='호텔이름 검색하기'" name="hotelName"></a>
			<a><input type="submit" value="검색"></a>
			</div>
		</form>
		</td>
	</tr>
	
	
	<tr>
		<td style=”word-break:break-all;”>사진</td>
		<!-- <td>호탤 아이디</td> -->
		<td style='word-break:break-all;'>호텔이름</td>
		<td style='word-break:break-all;'>주소</td>
		<td style='word-break:break-all;'>a급 방</td>
		<td style='word-break:break-all;'>b급 방</td>
		<td style='word-break:break-all;'>c급 방</td>
		<td style='word-break:break-all;'>평점</td>
		
	</tr>
	
	
	
	<c:forEach var="vo1" items="${alist1}">		<!-- request scope에 객체전체를 ArrayList alist1에 저장 -->
	<tr>
			
			<%
				Random r = new Random(); 
				int i = r.nextInt(7)+1; 
			%>
			
			<td style=”word-break:break-all;”><img src="<%=i%>.png" /></td>
			<td style=”word-break:break-all;”><a href="goHotel.do?hotel_name=${vo1.hotel_name}">${vo1.hotel_name}</a></td>
			<%-- <td><a href="sawonSearchOne.do?name=${vo1.name}"> ${vo1.name} </a></td> --%>	
			<td style=”word-break:break-all;”>${vo1.hotel_addr}</td>
			<td style=”word-break:break-all;”>${vo1.room_aprice}</td>
			<td style=”word-break:break-all;”>${vo1.room_bprice}</td>
			<td style=”word-break:break-all;”>${vo1.room_cprice}</td>
			<td style=”word-break:break-all;”>${vo1.ravg}</td>
				
			
	</tr>
	</c:forEach>
	
	<tr>          
		<td colspan=8 align="center"><a href="#top">맨 위로</a></td>
	</tr>
	
<%-- 	<tr>
		<%Object a=request.getAttribute("alist"); %>
		<td><%=a%></td>
	</tr> --%>
</table>

</body>
</html>
<%@ include file="bottom.jsp"%>
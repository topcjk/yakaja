<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp"%>
<!DOCTYPE html>

<form action="makereview.do" >
	<%
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String id=(String)request.getAttribute("checked");
		
	%>
	<%=id %>
<div align="center">
	<input type="hidden" name="<%=id%>">
	리뷰 제목<input type="text" name="reviewHead"><br>
	리뷰 내용<p><textarea name="reviewBody" cols="40" rows="10" placeholder="여기에 리뷰 쓰기 "></textarea></p>
	평점 0<input type="range" name="number" min="0" max="5">5 <br>
	호텔번호 <input type="number" name="hotelnum" min="1001" max="9999"> <br>
	
	<input type="submit" value="리뷰 쓰기">
	<input type="reset" value="전부 지우기">
</div>

</form>
<%@ include file="bottom.jsp"%>

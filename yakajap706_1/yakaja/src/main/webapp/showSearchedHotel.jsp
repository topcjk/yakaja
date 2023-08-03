<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp"%>

<!-- showSearchedHotel.jsp -->
<!-- 검색어로 호텔 검색 -->

<style>
 th, td {
    border-bottom: 1px solid #444444;
  }
  #tab{
  	border-collapse: separate;
     border-spacing: 10px;
  
  }
  table {
    width: 80%;
    border-top: 1px solid #444444;
  }
  img{
  	width:100px;
  	height: 100px;
  }
  select{
   	margin-left:80%;
  }
</style>
<script>
function nullcheck(stateCheck){
	
	if(stateCheck!=null){
		hotelName=stateCheck;
	}
}

</script>

<script>
var htmlstate="모든 호텔 보기";
var testsen;
</script>
<% String stateCheck; /* 	빈칸 			빈칸 */
	String hotelName="";%><!-- 	빈칸			빈칸 -->
<% stateCheck=String.valueOf(request.getAttribute("name")); %> <!-- 여기서 널			지역이름 -->
<script>
testsen="<%=stateCheck %>"
	if(testsen !='null'){
		htmlstate="'"+testsen+"' 검색결과";
	}
</script>

<script>document.write( '<h1 align="center">' + htmlstate  +'</h1>' );</script>


<table border=0 align="center">
	<tr>
		<td colspan=8 id="tab">

			<form action="searchHotelName_Sort.do" method="post">
					<div align="center">
							<select id="sel" name=sorter onchange="this.form.submit(this.options[this.selectedIndex].value)">
								<option selected disabled value="#" >정렬선택</option>
								<option value="ascname">이름순(ㄱ~ㅎ)</option>
								<option value="descname">이름순(ㅎ~ㄱ)</option>
									    
								<option value="descscore">높은 평점순</option>
								<option value="ascscore">낮은 평점순</option>
							</select>
							<input type="hidden" name="what" value="<%=stateCheck%>">
					</div>			
			</form>
	</td>
	</tr>
	<tr>
		<td colspan=8 id="tab">
		<form action="getAllHotel.do">
			<div align="center"><input type="submit" value="모두보기"></div>
		</form>
		</td>
	</tr>
	<tr>
		<td colspan=8 id="tab">
		<form action="searchHotelWhere.do" method="post">
			<div align="center">
	 			<a ><input type="text" placeholder="지역 검색하기" onfocus="this.placeholder=''" onblur="this.placeholder='호텔위치 검색하기'" name="hotelWhere"></a>
				<a><input type="submit" value="검색"></a>
			</div>
		</form>
		</td>
	</tr>
	<tr>
		<td colspan=8 id="tab">
		<form action="searchHotelName.do" method="post">
			<div align="center">
	 			<a ><input type="text" placeholder="호텔명 검색하기" onfocus="this.placeholder=''" onblur="this.placeholder='호텔이름 검색하기'" name="hotelName"></a>
				<a><input type="submit" value="검색"></a>
			</div>	
		</form>
		</td>
	</tr>
	
	<tr>
		<td style=”word-break:break-all;”>사진</td>
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
			<td style=”word-break:break-all;”>${vo1.hotel_addr}</td>
			<td style=”word-break:break-all;”>${vo1.room_aprice}</td>
			<td style=”word-break:break-all;”>${vo1.room_bprice}</td>
			<td style=”word-break:break-all;”>${vo1.room_cprice}</td>
			<td style=”word-break:break-all;”>${vo1.ravg}</td>
		
	</tr>
	</c:forEach>
	

	<table border=0 align="center">
		<tr>        
			<td align="center"><a href="#top">맨 위로</a></td>	       
		</tr>
	</table>
</table>

<%@ include file="bottom.jsp"%>
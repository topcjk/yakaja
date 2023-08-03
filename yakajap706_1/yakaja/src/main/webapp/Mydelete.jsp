<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 삭제 페이지</title>
</head>
<body>

        <h2>비밀번호 확인</h2>
        <form action="delete.do" method="post">
            <input type="hidden" name="action" value="confirm"> <!-- 액션 값 설정 -->
            <input type="hidden" name="MEM_ID" value="confirm">           
            <input type="password" name="MEM_PW" placeholder="비밀번호 입력" required> 
            <input type="submit" value="확인">
        </form>
<%
    

%>
</body>
</html>

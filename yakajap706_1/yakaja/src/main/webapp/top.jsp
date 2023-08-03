<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- top.jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="lib/wow/wow.min.js"></script>
<script src="lib/easing/easing.min.js"></script>
<script src="lib/owlcarousel/owl.carousel.min.js"></script>
<!-- Template Javascript -->
<script src="js/main.js"></script>

<head>
    <meta charset="utf-8">
    <title>야가자 - Yakaja</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    
    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
	
    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
</head>

<body>
    <!-- Spinner Start -->
    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
            <span class="sr-only">Loading...</span>
        </div>
    </div>
    <!-- Spinner End -->


    <!-- Navbar Start -->
    <nav class="navbar navbar-expand-lg bg-white navbar-light shadow sticky-top p-0">
        <a href="main.do" class="navbar-brand d-flex align-items-center px-4 px-lg-5">
            <h2 class="m-0 text-primary"><i class="fas fa-hotel"></i>야가자 Yakaja</h2>
        </a>
        <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav ms-auto p-4 p-lg-0">
	            <c:if test="${not empty sessionScope.memberVO}">
	            	<c:if test="${sessionScope.memberVO.mem_admin == 0}">
	            		 <a href="myInfo.do" class="nav-item nav-link">내정보</a>
	                	 <a href="myReserv.do?mem_id=${sessionScope.memberVO.mem_id}" class="nav-item nav-link">예약정보확인</a>
	            	</c:if>
	                <c:if test="${sessionScope.memberVO.mem_admin == 1}">
	            		 <a href="hotelJoinForm.do" class="nav-item nav-link">호텔등록</a>
	                	 <a href="index.jsp" class="nav-item nav-link">예약목록확인</a>
	                	 <a href="myInfo.do" class="nav-item nav-link">내정보</a>
	            	</c:if>
	            	<c:if test="${sessionScope.memberVO.mem_id == 'admin'}">
	            		 <a href="adminMember.do" class="nav-item nav-link">회원관리</a>
	                	 <a href="adminHotel.do" class="nav-item nav-link">호텔관리</a>
	                	 <a href="adminReserv.do" class="nav-item nav-link">예약관리</a>
	            	</c:if>
	            </c:if>
	            <a href="main.do" class="nav-item nav-link active">홈</a>
	            <a href="paging.do" class="nav-item nav-link">리뷰</a>
            </div>
            <c:if test="${empty sessionScope.memberVO}">
            	<a href="login.do" class="btn btn-primary py-4 px-lg-5 d-none d-lg-block">로그인<i class="fa fa-arrow-right ms-3"></i></a>
        	</c:if>
            <c:if test="${not empty sessionScope.memberVO}">
            	<a href="logout.do" class="btn btn-primary py-4 px-lg-5 d-none d-lg-block">로그아웃<i class="fa fa-arrow-right ms-3"></i></a>
        	</c:if>
        </div>
    </nav>
    <!-- Navbar End -->
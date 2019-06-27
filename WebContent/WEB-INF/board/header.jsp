<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Document</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<style>
	nav ul{
		list-style: none;
		background-color: rgba(243,242,240,0.7);
		text-align: center;
	}
	nav ul li{
		font-size:18px;
		display: inline-block;
		margin-left: 50px;
		padding: 10px;
	}
	nav ul li:hover{
		color:black;
		background-color: rgba(0, 0, 0, 0.2);
	}
	
	nav ul li a:link{
		color:black;
		text-decoration: none;
	}
	nav ul li a:hover{
		color:black;
		text-decoration: none;
	}
	nav ul li a:visited, nav ul li a:focus, nav ul li a:active{
		color:black;
		text-decoration: none;
	}
	.header{
		padding:0 !important;
	}
</style>
</head>

<body>
	<c:set var="member" value="${sessionScope.member }"/>
	<div class="container-fluid header">
		<nav>
			<ul>
				<li><a href="#">비트펀딩</a></li>
				<li><a href="sponlist.do">후원하기</a></li>
				<li><a href="#">공지사항</a></li>
				<c:choose>
					<c:when test="${empty member }">
						<li class="hlogin"><a href="#">로그인</a></li>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${member.mtier eq 3}">
								<li class="hlogin"><a href="#">로그아웃</a></li>
								<li class="hlogin"><a href="#">사용자 정보</a></li>
								<li class="hpage"><a href="#">관리자 페이지</a></li>
							</c:when>
							<c:otherwise>
								<li class="hlogin"><a href="#">로그아웃</a></li>
								<li class="hlogin"><a href="#">사용자 정보</a></li>
							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>			
			</ul>
			<ul>
			
			</ul>
		</nav>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#wrapper {
	width: 50%;
	margin: 0 auto;
	padding: 5%;
}

form .card-body {
	margin: 5%;
}

.card.border-primary.mb-3 {
	margin: 5%;
}

.submit {
	padding: 5%;
}
</style>
</head>
<body>
	<c:set var="memberdto" value="${sessionScope.member }"></c:set>
	<c:set var="spondto" value="${requestScope.spondto }"></c:set>
	<div id="wrapper">
		<form method="post" action="payment2.do">
			<div class="card border-primary mb-3">
				<div class="card-header">
					<h3>후원 정보</h3>
				</div>
				<div class="card-body">
					<div class="form-group">
						<label for="amount">후원 금액 입력</label><input type="number"
							name="amount" id="amount" min="${spondto.minmoney}"
							class="form-control">
					</div>
				</div>
			</div>
			<div class="card border-primary mb-3">
				<div class="card-header">
					<h3>배송지 정보</h3>
				</div>
				<div class="card-body">
					<div class="form-group">
						<label for="name">이름</label><input type="text" name="name"
							id="name" required class="form-control" size="10">
					</div>
					<div class="form-group">
						<label for="tel">연락처</label><input type="text" name="tel" id="tel"
							required class="form-control">
					</div>
					<div class="form-group">
						<label for="addr">주소</label><input type="text" name="addr"
							id="addr" required class="form-control">
					</div>
					<div class="form-group">
						<input type="hidden" name="boardno" value=${spondto.boardno }
							class="form-control">
					</div>
				</div>
			</div>
			<div class="submit">
				<input type="submit" value="후원하기"
					class="btn btn-primary btn-lg btn-block">
			</div>
		</form>
	</div>
</body>
</html>
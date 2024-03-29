<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko-kr">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="css/jquery.fancybox.css">
<link rel="stylesheet" href="css/sponlist.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="js/jquery.fancybox.js"></script>
<%
	boolean isFinish = (boolean)request.getAttribute("isFinish");
%>
<script>
	$(document).ready(function(){
		$(".fancybox").fancybox({
	          openEffect  : 'none',
	          closeEffect : 'none'
	    });
		if(<%=isFinish%>==true){
			document.getElementById("finishcheck").checked = true;
		}
		$('#finishcheck').on('click', function(){
			if(document.getElementById("finishcheck").checked == true){
				$('#frm').prop('action', 'sponlist.do?tag=${tag}&isFinish=true');
			}else{
				$('#frm').prop('action', 'sponlist.do?tag=${tag}&isFinish=false');
			}
		})
	})
</script>

</head>
<body style="background-color: rgba(250,239,220, 0.1);">
	<c:set var="pageinfo" value="${requestScope.pageinfo }"></c:set>
	<c:set var="list" value="${requestScope.list }"></c:set>
	<c:set var="tag" value="${requestScope.tag }"></c:set>
	<c:set var="search" value="${requestScope.search }"></c:set>
	<jsp:useBean id="now" class="java.util.Date"/>
	
	<div class="container-fluid sponfilter">
		<div class="container">
			<div class="row header">
				<div class="col-12 d-flex justify-content-center">
					<c:choose>
						<c:when test="${tag==null || tag=='' }">
							<h3>모든 프로젝트</h1>
						</c:when>
						<c:otherwise>
							<h3>${tag }</h1>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div class="row">
				<div class="dropdown col-md-4 col-sm-4 col-xs-4 d-flex justify-content-start filterline">
					<c:choose>
						<c:when test="${tag==null || tag=='' }">
							<a class="btn btn-default" data-toggle="dropdown" href="#">태그</a>
						</c:when>
						<c:otherwise>
							<a class="btn btn-default" data-toggle="dropdown" href="#">${tag }</a>
						</c:otherwise>
					</c:choose>
			   		<ul class="dropdown-menu" role="menu">
			   			<li role="presentation">
				    		<a role="menuitem" tabindex="-1" href="sponlist.do">모두</a>
				    	</li>
				    	<li role="presentation">
				    		<a role="menuitem" tabindex="-1" href="sponlist.do?tag=<%=URLEncoder.encode("게임", "UTF-8")%>">게임</a>
				    	</li>
				    	<li role="presentation">
				    		<a role="menuitem" tabindex="-1" href="sponlist.do?tag=<%=URLEncoder.encode("디자인", "UTF-8")%>">디자인</a>
				    	</li>
				    	<li role="presentation">
				    		<a role="menuitem" tabindex="-1" href="sponlist.do?tag=<%=URLEncoder.encode("책", "UTF-8")%>">책</a>
				    	</li>
				    	<li role="presentation">
				    		<a role="menuitem" tabindex="-1" href="sponlist.do?tag=<%=URLEncoder.encode("공연", "UTF-8")%>">공연</a>
				    	</li>
				    	<li role="presentation">
				    		<a role="menuitem" tabindex="-1" href="sponlist.do?tag=<%=URLEncoder.encode("미술", "UTF-8")%>">미술</a>
				    	</li>
				    	<li role="presentation">
				    		<a role="menuitem" tabindex="-1" href="sponlist.do?tag=<%=URLEncoder.encode("만화", "UTF-8")%>">만화</a>
				    	</li>
				    	<li role="presentation">
				    		<a role="menuitem" tabindex="-1" href="sponlist.do?tag=<%=URLEncoder.encode("음악", "UTF-8")%>">음악</a>
				    	</li>
				    	<li role="presentation">
				    		<a role="menuitem" tabindex="-1" href="sponlist.do?tag=<%=URLEncoder.encode("푸드", "UTF-8")%>">푸드</a>
				    	</li>
				    	<li role="presentation">
				    		<a role="menuitem" tabindex="-1" href="sponlist.do?tag=<%=URLEncoder.encode("캠페인", "UTF-8")%>">캠페인</a>
				    	</li>
				    	
			 		 </ul>
				</div>
				
				<div class="col-md-8 col-sm-8 col-xs-8 d-flex justify-content-end filterline">
					<input type="checkbox" id="finishcheck" name="finishcheck" value="true">
					<label for="finishcheck"><strong>마감 제외</strong></label>
				</div>
			</div>
		</div>
	</div>
	<hr id="lhr">
	<div class="container site">
			<div class="row" style="position: relative;">
				<c:choose>
					<c:when test="${empty list }">
						<tr><td colspan="5">게시물이 없습니다.</td></tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="board" items="${list }">
							<c:set var="date" value="${board.finaldate }"/>
							<fmt:parseDate var="parsedate" value="${date }" pattern="yyyy-MM-dd"></fmt:parseDate>
							<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 d-flex justify-content-center">
								<div class="thumbnail thum">
									<a class="fancybox" rel="img" href="upload/${board.imagepath }"><img class="img-responsive" src="upload/${board.imagepath }" alt="img"></a>
         							<div class="caption">
            							<h5><a href="spondetail.do?no=${board.boardno }">${board.boardtitle }</a> </h5>
            								<p>${board.boardwriter }</p>
            							<div class="progress">
            								<div class="progress-bar" role="progressbar" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100" style="width: ${board.nowmoney div board.destmoney *100}%;">
            									<span class="sr-only">90% Complete</span>
            								</div>
            							</div>
            							
            								<fmt:parseNumber value="${now.time/(1000*60*60*24) }" integerOnly="true" var="nowDays"/>
            								<fmt:parseNumber value="${parsedate.time/(1000*60*60*24) }" integerOnly="true" var="oldDays"/>
            								<c:set value="${oldDays - nowDays }" var="dateDiff"/>
            								<div class="row">
            									<p class="col-6"><span class="glyphicon glyphicon-gift"></span><span>${dateDiff+1 }일</span></p>
            									<p class="col-6 d-flex justify-content-center"><span class="glyphicon glyphicon-usd"></span><span>${board.nowmoney }만원</span></p>
            								</div>
            								
            							
       								</div>
								</div>
							</div>
						</c:forEach>
					</c:otherwise>	
				</c:choose>
			</div>
		
	<div class="row searchfield">
		<div class="col-md-4 col-sm-1">
			<a id="downloadfile" href="download.do?currpage=${pageinfo.currpage }&search=${search}&tag=${tag}&isFinish=${isFinish}"><span class="glyphicon glyphicon-floppy-save"></span><p style="display: inline">파일 목록 다운로드</p></a>
		</div>
		
		<div class="col-md-5 col-sm-7 d-flex justify-content-center">
			<form class="form-inline" role="form" action="sponlist.do?tag=${tag}&isFinish=${isFinish}" method="post" id="frm">
				<div class="form-group">
					<label for="search" class="sr-only"></label>
					<input type="text" class="form-control" id="search" name="search" value="${search }" placeholder="입력해주세요">
				</div>
				<div class="form-group">
					<input type="submit" class="btn btn-sm btn-default" value="검색">
				</div>
			</form>
		</div>
		<div class="col-md-1 col-md-offset-2 col-sm-4 d-flex justify-content-center">
			<a class="btn btn-success" id="boardwrite" href="sponadd.do">게시글 작성</a>
		</div>
	</div>
	<div class="row d-flex justify-content-center">
		<ul class="pagination">
			<c:if test="${pageinfo.startblock > 1 }">
				<li><a href="sponlist.do?currpage=${pageinfo.startblock-1 }&search=${search}&tag=${tag}&isFinish=${isFinish}">◀</a></li>
			</c:if>
			<c:forEach var="i" begin="${pageinfo.startblock }" end="${pageinfo.endblock }">
				<c:if test="${i==pageinfo.currpage }">
					<li class="active"><a href="#"><c:out value="${i }"></c:out></a></li>
				</c:if>
				<c:if test="${i!=pageinfo.currpage }">
					<li><a href="sponlist.do?currpage=${i }&search=${search}&tag=${tag}&isFinish=${isFinish}"><c:out value="${i}"></c:out></a></li>
				</c:if>
			</c:forEach>
			<c:if test="${pageinfo.endblock < pageinfo.totalpage }">
				<li><a href="sponlist.do?currpage=${pageinfo.endblock+1}&search=${search}&tag=${tag}&isFinish=${isFinish}">▶</a></li>
			</c:if>
		</ul>
	</div>
</div>
</body>
</html>
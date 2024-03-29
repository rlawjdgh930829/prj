<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<script>
	$(document).ready(function(){
		let no = ${ result.boardno }
		$.ajax({
            url:"sponsublist.do",
		    data:"no="+no,
		    dataType:"html",
		    success:function(data) {
			    $('#result').append(data);
		    } ,error:function(data) {
			    console.log('error');
		    }
	   });	
	});
	
	function formSubmit() {
		
		$('#result').empty();
		
	    var params = $("#frm").serialize();
	    
	    $.ajax({
	    	url:"sponsubadd.do",
	    	data:params,
	    	type:'post',
	    	success:function() {
	    		console.log('성공');
	    	}
	    });

	    let no = ${ result.boardno }
	    $.ajax({
            url:"sponsublist.do",
		    data:"no="+no,
		    dataType:"html",
		    success:function(data) {
			    $('#result').append(data);
		    } ,error:function(data) {
			    console.log('error');
		    }
	   });
	};
	
	function Submit() {
		$('#result').empty();
		let no = ${ result.boardno }
		$.ajax({
            url:"sponsublist.do",
		    data:"no="+no,
		    dataType:"html",
		    success:function(data) {
			    $('#result').append(data);
		    } ,error:function(data) {
			    console.log('error');
		    }
	   });
	};
</script>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	@media (max-width: 767px) {
		#pay{
			padding: 20px 100px;
			width: 100%;
		}
		
		#del{
			padding: 10px 100px;
			width: 100%;
		}
		
		#main{
			padding-top: 20px;
			padding-bottom: 60px;
			background-color: #FBF6F6;
		}
		
		#sub{
			margin-top: 0px;
			width: 100%;
		}
		
		#content1{
			box-sizing: border-box;
			padding: 35px 100px;
			margin-top: -10px;
			background-color: #FFFCFC;
		}
		
		#content2{
			margin-top: -40px;
			padding-top: 20px;
			padding-bottom: 20px;
			background-color: #F6EAEA;
		}
		
	}
	
	
	@media (min-width: 768px) {
		#main{
			padding-top: 20px;
			padding-bottom: 60px;
			background-color: #FBF6F6;
			height: 870px;
		}
		
		#sub{
			margin-top: 0px;
			width: 60%;
		}
		
		#content1{
			box-sizing: border-box;
			box-shadow: 5px 5px silver;
			margin-top: -10px;
			padding: 35px 100px;
			background-color: #FFFCFC;
		}
		
		#content2{
			padding-top: 10px;
			padding-bottom: 20px;
			background-color: #FEB6B6;
			box-shadow: 5px 5px silver;
		}
		
	}
	
	#bg{
		background-color: #EEEEEE;
	}
	
	#pay{
		padding: 20px 100px;
	}
	
	#del{
		padding: 20px 100px;
	}
	
	#disabledInput{
		width: 110px;
	}
	
	#imagepath{
		border: 1px double;
		border-radius: 5px;
	}
	
	.tr{
		background-color: white;
	}

</style>
</head>
<body id="bg">
	<c:set var="path" value="${ requestScope.image }"></c:set> 
	<c:set var="result" value="${ requestScope.result }"></c:set>
	<c:set var="writer" value="${ requestScope.writer }"></c:set>
	<c:set var="dateResult" value="${ requestScope.dateResult }"></c:set>
	<c:set var="member" value="${ sessionScope.member }"></c:set> <!-- 세션 스코프 -->
	
	<div class="center-block" style='width:100%;' id="main">
		<br>
		<br>
		<br>
		<h1 class="text-center"><small><${ result.boardtag }> </small>${ result.boardtitle }</h1><br> <!-- 태그, 글제목 -->
		<div class="row">
			<div class="col-md-2">
	  		</div>
	  		<div class="col-md-5">
	  			<img class="img-responsive" id="imagepath" src="upload/${ result.imagepath }" alt="img"> <!-- 이미지 -->
	  		</div>
	  		<div class="col-md-5">
	  			<br>
	  			<p>현재모금액</p>
	  			<h2>${ result.nowmoney }만원</h2><br><br> <!-- 현재모금액 -->
	  			
	  			<p>마감일</p>
	  			<h2>${ result.finaldate }</h2><br><br> <!-- 마감일 -->
	  			
	  			<p>목표금액</p>
	  			<h2>${ result.destmoney }만원</h2><br><br> <!-- 목표모금액 -->
	 
	  			<br>
	  			<br>
	  			
	  			<form action="spondel.do" method="post">
	  				<input type="hidden" name="boardno" value="${ result.boardno }"> <!-- 글번호 -->
	  				<input type="hidden" name="imagepath" value="${ result.imagepath }"> <!-- 이미지이름 -->
	  				<c:if test="${ member.mtier == 3 || member.mid == writer.mid }">
	  				<button type="submit" class="btn btn-danger" id="del">삭제하기</button>
	  				</c:if>
	  			</form>
	  			
	  			<br>
	  			
	  			<!-- 멤버 세션이 없으면 후원버튼 비활성화 -->
	  			<c:if test="${ member == null }">
	  				<br>
	  				<br>
	  				<br>
				  	<button type="submit" class="btn btn-primary" id="pay" disabled="disabled">후원하기</button>
			  	</c:if>
				
				<!-- 멤버 세션이 있으면 후원버튼 활성화 -->
				<c:if test="${ member != null }">
					<c:if test="${ member.mtier == 1 || member.mtier == 2}">
						<c:if test="${ member.mid != writer.mid }">
							<br>
							<br>
							<br>
						</c:if>
					</c:if>
					<c:if test="${ dateResult >= 0 }">
			  			<!-- 글번호 넘겨주기 -->
			  			<form action="payment1.do" method="post">
			  				<input type="hidden" name="boardno" value="${ result.boardno }">
			  				<button type="submit" class="btn btn-primary" id="pay">후원하기</button>
			  			</form>
		  			</c:if>
		  			<c:if test="${ dateResult < 0 }">
			  			<button type="submit" class="btn btn-primary" id="pay" disabled="disabled">후원하기</button>
		  			</c:if>
				</c:if>
	  		</div>
		</div>
	</div>
	
	<div class="center-block" id="sub">
  		<!-- Nav tabs -->
  		<ul class="nav nav-tabs" role="tablist">
		    <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">상세내용</a></li>
		    <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">댓글</a></li>
  		</ul>

  		<!-- Tab panes -->
	  	<div class="tab-content">
		    <div role="tabpanel" class="tab-pane active" id="home">
		    	
		    	<div class="row">
			    	<div class="col-md-9">
			    		<p></p>
						<!-- 글내용 -->
			    		<div class="jumbotron" id="content1">
							<h2><em>${ result.boardtitle }</em></h2>
  							<p>${ result.boardcontent }</p>
  							<p><a class="btn btn-primary btn-lg" href="#" role="button">상단으로</a></p>
						</div>
		  			</div>
		  			<div class="col-md-3">
		  				<div id="content2">
		  					<h3 class="text-center">창작자정보</h3><br>
		  					<hr/>
						    <p class="text-center"><span class="glyphicon glyphicon-user">${ writer.mid }</span></p> <!-- 창작자 -->
						    <p class="text-center"><span class="glyphicon glyphicon-envelope">${ writer.email1 }@${ writer.email2 }</span></p> <!-- 이메일 -->
						    <p class="text-center"><span class="glyphicon glyphicon-earphone">${ writer.tel }</span></p> <!-- 전화번호 -->
					    </div>
			    	</div>
		    	</div>
		    	
		    </div>
		    <div role="tabpanel" class="tab-pane" id="profile">
		    	<form action="sponsubadd.do" method="post" id="frm"> <!-- 글번호랑 같이 넘겨줌 -->
		    		<input type="hidden" name="boardno" value="${ result.boardno }">
		    		<!-- 멤버 세션에 따라 텍스트창 확성화/비활성화 -->
		    		<c:if test="${ member == null }">
						<textarea name="content" class="form-control" rows="3" maxlength="100" disabled></textarea>
					</c:if>
					<c:if test="${ member != null }">
						<textarea name="content" class="form-control" rows="3" maxlength="100"></textarea> <!-- 댓글내용 -->
					</c:if>
					
					<!-- 회원 번호를 세션에서 받아 넘겨줌-->
					<c:if test="${ member == null }">
						<input id="disabledInput" type="text" placeholder="로그인 해주세요" disabled>
					</c:if>
					<c:if test="${ member != null }">
						<input id="disabledInput" type="text" placeholder="${ member.mid }" disabled>
					</c:if>
					<input type="hidden" name="mno" value="${ member.mno }">
					
					<!-- 멤버 세션에 따라 댓글작성 버튼 활성화/비활성화 -->
					<c:if test="${ member == null }">
						<input type="button" class="btn btn-info" value="댓글작성" onclick="formSubmit()" disabled/>
					</c:if>
					<c:if test="${ member != null }">
						<input type="button" class="btn btn-info" value="댓글작성" onclick="formSubmit()"/>
					</c:if>
					
					<input type="button" class="btn btn-info" value="새로고침" onclick="Submit()"/>
				</form>
				<div id="result"></div>
		    </div>
  		</div>

	</div>
	<%-- 
	회원번호: ${ result.writerno }<br>
	후원최소액: ${ result.minmoney }<br>
	 --%>
</body>
</html>
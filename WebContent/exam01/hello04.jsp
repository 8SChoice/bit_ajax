<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	#msgView {
		border: 1px solid red;
		height: 200px;
		width: 500px;
	}	
</style>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<!-- <script src="https://code.jquery.com/jquery-latest.js"></script> -->
<script>
	$(document).ready(function(){
		$(':button').click(function() {
			/*
				ajax 주요 key
				- type    : 메소드(문자열)
				- url     : 요청주소(문자열)
				- data    : 파라미터(문자열, 객체)
				- success : 요청시 응답성공(함수)
				- error   : 요청시 응답실패(함수)
				- async	  : 동기/비동기 설정
			*/
			$.ajax({
				url: "hello.html",
				success: function(data) {
					//document.getElementById("msgView").innerHTML += data;
					$('#msgView').html(data);
				},
				error: function() {
					console.log(arguments)
				}
			});
				
		});
		
		
	});
	
	
	
</script>
</head>
<body>
	<h1>서버에서 받은 메세지</h1>
	<div id="msgView"></div>
	<input type="button" value="서버에 자료요청" >
	
</body>
</html>






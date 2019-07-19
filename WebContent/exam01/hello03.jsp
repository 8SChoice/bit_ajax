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
<!-- 필요시 jQuery 버전 1,3 모두 쓸 수도 있다.(충돌날 수 있음) -->
<script>
	$(document).ready(function() { //js의 onload 함수와 같다. => body를 다 읽고 나서 함수를 실행.
		$(':button').click(function() { //input:button : input 태그 중 type이 button인 것.=> :button : 태그상관없이 type이 button인 것(<button>도 포함). button만 : <button>만.
			/*
				ajax 주요 key
				- type : 메서드(get or post. 문자열로 써야함)
				- url : 요청 주소(문자열)
				- data : 파라미터(문자열, 객체)
				- success : 요청시 응답성공(함수)
				- error : 요청시 응답실패(함수)
				- async : 동기/비동기 설정
			 */
			$.ajax({
				type : "get", //type 미설정시 자동으로 get방식으로 전송.
				url : "hello2.html",
				success : function(data) {
					$("#msgView").append(data);  //append : 뒤에 붙이기. prepend : 앞에 붙이기
				},
				error : function() {
					console.log(arguments);
				}
			});
		});
	});
</script>
</head>
<body>
	<h1>서버에서 받은 메세지</h1>
	<div id="msgView"></div>
	<input type="button" value="서버에 자료요청">
</body>
</html>
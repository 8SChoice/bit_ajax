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
<script>
	var httpRequest=null;
	function requestMsg(){
		//alert("!!!")
		//console.log("!!!");
		//document.write("!!!");
		
		//1. XMLHttpRequest 객체 생성
		if(window.XMLHttpRequest){
			httpRequest = new XMLHttpRequest();	
		} else if(window.ActiveXObject){
			httpRequest = new ActiveXObject("microsoft.XMLHTTP");
		}
		//2. callback 함수 설정
		httpRequest.onreadystatechange = responseMsg;
		
		//3. 서버에 비동기 요청
		httpRequest.open("GET", "/Ajax/hello", true); //true : 비동기방식
		httpRequest.send(null);
	}
	function responseMsg(){
		//4. 서버에서 응답을 완료한 경우(성공)
		if(httpRequest.readyState==4){
			if(httpRequest.status==200){
				var msgView=document.getElementById("msgView")
				msgView.innerHTML+=httpRequest.responseText;
			}
			console.log("responseMsg호출");
		}
		
	}
</script>
</head>
<body>

	<h1>서버에서 받은 메세지</h1>
	<div id="msgView"></div>
	<input type="button" value="서버에 자료요청" onclick="requestMsg()">
	<!-- requestMsg() : js함수 -->

</body>
</html>
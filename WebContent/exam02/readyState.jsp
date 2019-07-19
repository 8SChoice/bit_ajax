<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	var httpRequest = null;
	function getXMLHttpRequest(){
		if(window.XMLHttpRequest)
			return new XMLHttpRequest();
		if(window.ActiveXObject)
			return new ActiveXObject("microsoft.XMLHTTP");
		return null;
	}
	function sendProcess(){
		//1단계
		httpRequest = getXMLHttpRequest();
		console.log(httpRequest);
		//2단계 : callback 함수 정의
		httpRequest.onreadystatechange = callbackFunc
		//3단계
		httpRequest.open("GET", "/ajax/exam01/hello.html", true);
		httpRequest.send(null);
	}
	function callbackFunc(){
		console.log("callback...");
		

 //readystate
 /*
 0: 호출전
 1:open() 호출,send()호출전
 2 send() 호출, 서버 응답전
 3.서버응답중, header전송, body 미전송
 4.서버응답완료, body 전송완료
 status(상태코드)
 200:성공(ok)
 403:액세스 거부
 404:File Not Found
 405: Servlet 에러
 500: 내부서버 에러
 */
	}

	var debug = document.getElementById("debug");
	switch(httpRequest.readystate){
	case 1:
		debug.value+='Loading...\n';
		break;
	case 2:
	debug.value+='Loading...\n';
		break;
	case 3:
	debug.value+='Interactive...\n';	
	break;
	case 4:
	debug.value+='Complet...\n';
	if(httpRequest.status==200){
		debug.value+="정상적으로 처리가 완료되었습니다.\n";
	}else debug.value += '오류발생 :' + httpRequest.status + '\n\n';
	// httpRequest.statusText라는 상태 이름을 표기하는 방법은 tomcat8까지 지원.
	break;

	}
	function clearOnclick(){
		var debug = document.getElementbyId("debug");
		debug.valule='';
	}
</script>
</head>
<body>
	<textarea rows="10" cols="80" id="debug"></textarea>
	<br>
	<input type="button" value="서버호출" onclick="sendProcess()">
	<input type="button" value="초기화" onclick="clearOnclick()">


</body>
</html>
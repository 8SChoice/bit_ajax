<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="httpRequest.js"></script>
<script>
	function onSendClick(){
		//sendProcess("GET", "sample.jsp", "name=hong&age=25", callbackFunc);
		/*
		ID속성을 이용한 추출
		var name = document.getElementById("name").value;
		var age = document.getElementById("age").value;
		var addr = document.getElementById("addr").value;
		*/
		//name속성을 이용한 추출
		var name = document.inputForm.name.value;
		var age = document.inputForm.age.value;
		var addr = document.inputForm.addr; //value값을 밑에 넣어도 가능하다.
		//var params={name:"hong","age":25, "addr":"서울시 서초구 서초동"};
		var params={name:name,"age":age, "addr":addr.value};  //json에서는 : 기준으로 왼쪽은 무조건 문자로 인식하기때문에 ""생략가능...addr.value도 가능하다.
		//sendProcess("POST","sample.jsp",params,callbackFunc);
		sendProcess("POST", "sample.jsp", "name=hong&age=25&addr=서울시 서초구", callbackFunc);
	}
	function callbackFunc(){
		if(httpRequest.readyState==4){
			if(httpRequest.status==200){
				debugTrace(httpRequest.responseText+'\n');
			}
		}
	}
	function debugTrace(msg) {
		var debug = document.getElementById("debug");
		debug.value += msg;
	}
</script>
</head>
<body>
	<h2>XMLHttpRequest 모듈을 사용한 예제</h2>
	<textarea rows="10" cols="80" id="debug"></textarea>
	<br>
	<form name="inputForm"> <!--name속성을 가지고 있는 form태그 안에서는 id나 class없어도 name값으로 값을 뽑아낼 수 있다.  : document.form name(폼의 이름).name -->
		이름 : <input type="text" name="name" id="name"><br>
		나이 : <input type="text" name="age" id="age"><br>
		주소 : <input type="text" name="addr" id="addr"><br>
		<input type="button" value="서버에 자료전송" onclick="onSendClick()">
	</form>
</body>
</html>
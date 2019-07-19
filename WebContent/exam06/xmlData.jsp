<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="/Ajax/exam04/httpRequest.js"></script>
<script>
	function sendOnClick(){
		sendProcess('GET','sample.xml',null,callback);
	}
	function callback(){
		if(httpRequest.readyState==4){
			if(httpRequest.status==200){
				var xmlDoc = httpRequest.responseXML;
				var memberList=xmlDoc.getElementsByTagName("member");
				console.log(memberList);
				var msg='회원수:'+memberList.length+'명\n';
				for(var i =0; i<memberList.length; i++){
					var member= memberList[i];
					var id = member.getElementsByTagName("id")[0].innerHTML;
					var name = member.getElementsByTagName("name")[0].innerHTML;
					msg+=id+'('+name+')\n';
				}
				debugTrace(msg);
				
			}
		}
	}
	function debugTrace(msg){
		var debug = document.getElementById("debug");
		debug.value+=msg;
	}
	
</script>
</head>
<body>
	<h2>xmlData 예제</h2>
	<textarea rows="10" cols="80" id="debug"></textarea>
	<br>
	<input type="button" value="서버에 자료요청" onclick="sendOnClick()">

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="/Ajax/exam04/httpRequest.js"></script>
<script src="jquery-3.4.1.min.js"></script>
<script>
//jQuery의 시작은 $
//xmlDoc.getElementsByTagName("member") => $(xmlDoc).find('member') // id, tagname, class 다 찾기 가능
	function sendOnClick(){
		sendProcess('GET','sample.xml',null,callback);
	}
	//$.ajax() : 비동기 통신 하는 jQuery함수
	 // method, url, parameter, 성공, 실패 필요. => JSON형태로 쓴다. //인자들이 정해져 있지 않기 때문.
	function callback(){
		if(httpRequest.readyState==4){
			if(httpRequest.status==200){
				//var xmlDoc = $.parseXML(httpRequest.responseText);
				var xmlDoc = httpRequest.responseXML;
				var memberList=$(xmlDoc).find("member");
				//jQuery객체에서는 jQuery 함수를 써야한다. console.log 찍어볼것. 
				var msg='회원수:'+memberList.length+'명\n';
				//console.log(memberList.eq(0).find('id').html());
				
				memberList.each(function(index){
					var id=$(this).find('id').html();
					var name=$(this).find('name').text();
					msg+=id+'('+name+')\n';
				});
				/* for(var i =0; i<memberList.length; i++){
					//
					var member=memberList.eq(i);
					var id = $(member).find('id').html();
					var name = $(member).find('name').text();
					msg+=id+'('+name+')\n';
				} */
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
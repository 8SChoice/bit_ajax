<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	#searchResult{
		border : 1px solid red;
		width: 70%;
		height : 700px;
	}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	var movieCd;
	$(document).ready(function(){
		$("#searchBtn").click(function(){
			//지우는 함수
			$("#searchResult").empty();
			//검색날짜 추출
			var date=$("#searchDate").val();
			//console.log(date);
			//2019-07-15 => 20190715 로 변경
			var searchDate=date.split('-').join('');
			/* console.log(searchDate); */
			/* var searchDate='';
			date.split('-').forEach(function(d){
				searchDate+=d;
			})
			console.log(searchDate); */
			$.ajax({
				url : "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json",
				data:
				{
					key:"2a06801ba861c20caf69c52b2758c384",
					targetDt : searchDate
				},
				datatype:"jsonp",
				success : callback,
				error : function(){
					alert("실패")
				}
			
			});
			$.ajax({
				url : "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json",
				data:
				{
					key:"2a06801ba861c20caf69c52b2758c384",
					movieCd : movieCd
				},
				datatype:"jsonp",
				success : callback,
				error : function(){
					alert("실패")
				}
			
			});
		});
	});
	
	function callback(data){
		var list = data.boxOfficeResult.dailyBoxOfficeList;
		for(var i=0; i<1; i++){
			var movie = list[i];
			var rank = movie.rank;
			var name=movie.movieNm;
			var audiCnt = movie.audiCnt;
			movieCd=movie.movieCd;
			var peopleNm = movieCd.peopleNm;
			$("#searchResult").append("<h4>"+rank+"위</h4>");
			$("#searchResult").append("<strong>"+name+"</strong>("+audiCnt+"명)<br>");
			$("#searchResult").append("<strong>"+peopleNm+"</strong>");
			$("#searchResult").append("<hr>");
		}
		/* for(var i=0; i<list.length; i++){
			var movie = list[i];
			var rank = movie.rank;
			var name=movie.movieNm;
			var audiCnt = movie.audiCnt;
			$("#searchResult").append("<h4>"+rank+"위</h4>");
			$("#searchResult").append("<strong>"+name+"</strong>("+audiCnt+"명)<br>");
			$("#searchResult").append("<hr>");
		} */
	}
</script>
</head>
<body>
	<h2>일일 박스오피스 조회서비스</h2>
	검색일 : <input type="date" id="searchDate" >
	<button id="searchBtn">검색</button>
	<br>
	<h4>검색결과</h4>
	<div id="searchResult"></div>
</body>
</html>
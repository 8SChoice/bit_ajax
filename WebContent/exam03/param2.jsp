<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	if (request.getMethod().equalsIgnoreCase("POST"))
		request.setCharacterEncoding("utf-8"); //POST방식에서 BODY를 한글인코딩 하기위해 사용
%>
name=${param.name }

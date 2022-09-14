<%@page import="com.dto.SawonDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리 페이지</title>
<link href="css/Page2.css?ver=1" rel="stylesheet" type="text/css">
<%
   String mesg = (String)session.getAttribute("select");
  SawonDTO dto = (SawonDTO)session.getAttribute("login");
  
  if(dto != null){
	  String sawongrade = dto.getSawongrade();
%>
</head>
<body>
<div class="intro">
 
 <div class="mation">
 <ul class="grade">
 <li><a>직위 : <%= sawongrade %></a></li>
 </ul>
   <ul class="logo">
    <li><a href="Mainpage1.jsp">DMN COFFEE</a></li>
   </ul>
   </div>
   
   <div class="main2">
    <jsp:include page="common/menu.jsp" flush="true" ></jsp:include>
 
   </div> 
   
        <div class="back">
		<ul>
		<li><a href="main.jsp"><img class="backimage" src="images/back.png"></a></li>
		</ul>
		</div>
		
</div><!-- end intro -->
<%
}
  %>
</body>
</html>
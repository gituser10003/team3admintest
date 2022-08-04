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
  
%>
</head>
<body>
<div class="intro">
 
   <ul class="logo">
    <li><a href="Mainpage1.jsp">DMN COFFEE</a></li>
   </ul>
   
   <div class="main2">
    <jsp:include page="common/menu.jsp" flush="true" ></jsp:include>
 
   </div> 
   
</div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body class="container">
<%
   String mesg = (String)session.getAttribute("sawonAdd");
   if(mesg!=null){
%>
   <script type="text/javascript">
     alert('<%=mesg%>');
   </script>
   <%
session.removeAttribute("sawonAdd");
   } 
%>


<jsp:include page="Mainpage1.jsp" flush="true"></jsp:include><br>
</body>
</html>
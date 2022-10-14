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
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
   <script type="text/javascript">
     Swal.fire({
         icon: 'success',
         title: '<%=mesg%>',
         confirmButtonColor: '#6495ED'
       })
   </script>
   <%
session.removeAttribute("sawonAdd");
   } 
%>


<jsp:include page="Mainpage1.jsp" flush="true"></jsp:include><br>
</body>
</html>
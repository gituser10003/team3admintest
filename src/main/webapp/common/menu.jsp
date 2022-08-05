<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.dto.SawonDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link href="css/Page2.css?ver=1.1" rel="stylesheet" type="text/css">
    
    <%
    SawonDTO dto = (SawonDTO)session.getAttribute("login");
    String sawongrade = dto.getSawongrade();
    System.out.println("jsp"+dto.getSawongrade());%>
    
    
    <%if("Admin".equals(sawongrade)){  %>
<a href="SawonList" class="SawonM" style="color : white">사원관리</a>
<a href="SawonList" class="MemberM" style="color : white">회원관리</a>
<a href="SawonList" class="ProductM" style="color : white">상품관리</a>
<%} %>

<%
   if("Manager".equals(sawongrade)){
%>
<a href="SawonList" class="MemberM" style="color : white">회원관리</a>
<a href="SawonList" class="ProductM" style="color : white">상품관리</a>
<% 
} 
%>

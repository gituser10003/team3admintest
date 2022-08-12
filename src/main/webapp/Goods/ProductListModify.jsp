<%@page import="com.dto.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="css/Page5.css?ver=1.1" rel="stylesheet" type="text/css">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

$(document).ready(function () {

/* $("#userid").on("keyup",function(event){	
	 $.ajax({
			type : "GET",
			url : "SawonIdCheckServlet",
			dataType : "text",//응답 데이터 타입
			data : {  //서버에 넘겨줄 데이터 
				userid : $("#userid").val()
			},
			success : function(responseData, status, xhr) {
				console.log(responseData);
			   $("#result").text(responseData);
			},
			error : function(xhr, status, error) {
				console.log("error");
			}
		});
	 
}); */

//삭제버튼
	$(".del").on("click",function(){
		var userid= $(this).attr("data-id");
		location.href="ProductDelServlet?pdno="+pdno;
	});
})//end document
</script>
<%
ProductDTO dto = (ProductDTO)request.getAttribute("dto");
String pdno=dto.getPdno();
String pdnm=dto.getPdnm();
int pdprice=dto.getPdprice();
String ctno=dto.getCtno();
String pdfile=dto.getPdfile();
%>

<div class="intro">
 <form action="ProductUpdateServlet" method="get">
   <ul class="logo">
    <li><a href="Mainpage1.jsp">DMN COFFEE</a></li>
   </ul>
   
   <ul class="jemog">
    <li>상품 Product 수정 페이지</li>
   </ul>
   
   <div class="account">
   
   상품번호<input type="text" class="input_text" id="pdno" name="pdno" value="<%=pdno%>">
   <span id="result"></span>
   </div>
   <div class="account">
   상품명<input type="password" class="input_text" id="pdnm" name="pdnm" value="<%=pdnm%>">
   </div>
   <div class="account">
   상품금액<input type="text" class="input_text" id="pdprice" name="pdprice" value="<%=pdprice%>">
   </div>
   
    <div class="account">
   분류번호
   <input type="text" class="input_text" id="ctno" name="ctno" value="<%=ctno%>">
   </div>
   
   <div class="account">
   물품파일
    <input type="text" class="input_text" id="pdfile" name="pdfile" value="<%=pdfile%>">
   </div>
  <div class="button">
   <div>
   <input class="cancell" type="reset" value="취소">
   </div>
   <div>
   <input onclick="return confirm('정말로 수정하시겠습니까?')" class="check" type="submit" value="확인">
   </div>
   </div>
   </form>
     <div>
     <input onclick="return confirm('정말로 삭제하시겠습니까?')" type="button" class="del"  value="삭제" id="xx<%=pdno %>" data-id="<%=pdno%>" />
     </div> 


</div>
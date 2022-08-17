<%@page import="com.dto.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link href="css/memberedit.css?ver=1.1" rel="stylesheet" type="text/css">
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
});//end userid */

//삭제버튼
$(".del").on("click",function(){
	var memno= $(this).attr("data-id");
	location.href="MemberDelServlet?memno="+memno;
});

})//end document
</script>
<%
MemberDTO dto = (MemberDTO)request.getAttribute("dto");
String memno = dto.getMemno();
String phone1 = dto.getPhone1();
String phone2 = dto.getPhone2();
String phone3 = dto.getPhone3();
int mempoint = dto.getMempoint();
%>

<div class="intro">
 <form action="MemberUpdateServlet" method="get">
   <ul class="logo">
    <li><a href="Mainpage1.jsp">DMN COFFEE</a></li>
   </ul>
   
   <ul class="jemog">
    <li>회원 수정 페이지</li>
   </ul>
   
   <div class="account">
   회원번호<input type="text" class="input_text" id="memno" name="memno" value="<%=memno%>">
   </div>
   
    <div class="account">
   핸드폰번호
   <select class="input_text" id="phone1" name="phone1">
   <option value="010" <% if("010".equals(phone1)){ %> selected<%} %>>010</option>
   <option value="011" <% if("011".equals(phone1)){ %> selected<%} %>>011</option>
   <option value="012" <% if("012".equals(phone1)){ %> selected<%} %>>012</option>
   <option value="070" <% if("070".equals(phone1)){ %> selected<%} %>>070</option>
   </select>&nbsp;-
   <input type="text" class="input_text" id="phone2" name="phone2" value="<%=phone2%>">&nbsp;-
   <input type="text" class="input_text" id="phone3" name="phone3" value="<%=phone3%>">
   </div>
   
  <div class="account">
  포인트
  <input type="text" class="input_text" id="mempoint" name="mempoint" value="<%=mempoint%>">
  </div>
  
  <div class="button">
  
   <div>
   <input class="cancell" type="reset" value="취소">
   </div>
   <div>
   <input onclick="return confirm('정말로 수정하시겠습니까?')" class="check" type="submit" value="수정">
   </div>
   
   </div>
   </form>
   
     <div>
     <input onclick="return confirm('정말로 삭제하시겠습니까?')" type="button" class="del"  value="삭제" id="xx<%=memno %>" data-id="<%=memno%>" />
     </div> 


</div>



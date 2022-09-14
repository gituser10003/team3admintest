<%@page import="com.dto.CategoryDTO"%>
<%@page import="com.dto.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link href="css/categoryedit.css?ver=1" rel="stylesheet" type="text/css">
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
	var ctno= $(this).attr("data-id");
	location.href="CategoryDelServlet?ctno="+ctno;
});

})//end document
</script>
<%
CategoryDTO dto = (CategoryDTO)request.getAttribute("dto");
int ctno = dto.getCtno();
String ctnm = dto.getCtnm();
%>

<div class="intro">
 <form action="CategoryUpdateServlet" method="get">
   <ul class="logo">
    <li><a href="Mainpage1.jsp">DMN COFFEE</a></li>
   </ul>
   
   <ul class="jemog">
    <li>카테고리 수정 페이지</li>
   </ul>
   
   <table class="table">
   
	<tr>
	<th class="name">카테고리번호</th>
	<th><input type="text" class="input_text" id="ctno" name="ctno" value="<%=ctno%>"></th>
	</tr>
	
	<tr>
	<th class="name">카테고리이름</th>
	<th><input type="text" class="input_text" id="ctnm" name="ctnm" value="<%=ctnm%>"></th>
	</tr>

</table>
  <div class="bottom1">
  
  <div class="button">
  
   <div>
   	<input class="cancell" type="reset" onclick="location.href='CategoryListServlet'" value="취소">
   </div>
   
   <div>
   	<input onclick="return confirm('정말로 수정하시겠습니까?')" class="check" type="submit" value="수정">
   </div>
   
   </div>
   
   <div>
   	<input onclick="return confirm('정말로 삭제하시겠습니까?')" type="button" class="del"  value="삭제" id="xx<%=ctno %>" data-id="<%=ctno%>" />
   </div> 
   
   </div>
   
   </form>
   
   


</div>



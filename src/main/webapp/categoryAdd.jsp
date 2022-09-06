<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="css/categoryAdd.css?ver=1.1" rel="stylesheet" type="text/css">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function () {
		$("#userid").on("keyup",function(event){	
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
})//end document
</script>
<form action="CategoryAddServlet" method="get">
<div class="intro">
 
   <ul class="logo">
    <li><a href="Mainpage1.jsp">DMN COFFEE</a></li>
   </ul>
   
   <ul class="jemog">
    <li>카테고리 생성</li>
   </ul>
   
   <div class="account">
   카테고리 번호<input type="text" class="input_text" id="ctno" name="ctno">
   <span id="result"></span>
   </div>
   
   <div class="account">
   카테고리 이름
   <input type="text" class="input_text" id="ctnm" name="ctnm">
   </div>
  
  <div class="button">
  
   <div>
   <input class="cancell" type="reset" value="취소">
   </div>
   <div>
   <input class="check" type="submit" value="카테고리등록">
   </div>
   </div> 
</div>

</form>

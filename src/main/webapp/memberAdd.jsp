<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="css/memberAdd.css?ver=1" rel="stylesheet" type="text/css">
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
<form action="MemberAddServlet" method="get">
<div class="intro">
 
   <ul class="logo">
    <li><a href="Mainpage1.jsp">DMN COFFEE</a></li>
   </ul>
   
   <ul class="jemog">
    <li>회원 등록</li>
   </ul>
   
   <table class="table">
   
<!-- 	<tr>
		<th class="name">회원번호</th>
		<th><input type="text" class="input_text" id="memno" name="memno"></th>
	</tr> -->
	
	<tr>
		<th class="name">핸드폰번호</th>
		<th><select class="input_text" id="phone1" name="phone1">
  		 <option value="010">010</option>
  		 <option value="011">011</option>
  		 <option value="012">012</option>
  		 <option value="070">070</option>
   		 </select>&nbsp;-
   		 <input type="text" class="input_text" id="phone2" name="phone2">&nbsp;-
  		 <input type="text" class="input_text" id="phone3" name="phone3"></th>
	</tr>
	
	<tr>
		<th class="name">포인트</th>
		<th><input type="text" class="input_text" id="mempoint" name="mempoint"></th>
	</tr>

</table>
  
  
  	<div class="button">
  
   <div>
   <input class="cancell" type="reset" onclick="location.href='MemberListServlet'" value="취소">
   </div>
   
   <div>
   <input class="check" type="submit" value="회원등록">
   </div>
   
   	</div> <!-- end buttion --> 
   	
</div><!-- end intro -->

</form>

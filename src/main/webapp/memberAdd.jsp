<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="css/memberAdd.css?ver=1" rel="stylesheet" type="text/css">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

$(document).ready(function () {

})//end document
</script>
<form action="MemberAddServlet" method="get">
<div class="intro">
 
   <ul class="logo">
    <li><a href="Mainpage1.jsp">DMN COFFEE</a></li>
   </ul>
   
   <ul class="jemog">
    <li>회원 생성</li>
   </ul>
   
   <div class="account">
   
   회원번호<input type="text" class="input_text" id="memno" name="memno">
   <span id="result"></span>
   </div>
   
   <div class="account">
   핸드폰번호
   <select class="input_text" id="memphone1" name="memphone1">
   <option value="010">010</option>
   <option value="011">011</option>
   <option value="012">012</option>
   <option value="070">070</option>
   </select>&nbsp;-
   <input type="text" class="input_text" id="memphone2" name="memphone2">&nbsp;-
   <input type="text" class="input_text" id="memphone3" name="memphone3">
   </div>
   
   <div class="account">
   포인트
   <input type="text" class="input_text" id="mempoint" name="mempoint">
   </div>
   
  
  <div class="button">
  
   <div>
   <input class="cancell" type="reset" value="취소">
   </div>
   <div>
   <input class="check" type="submit" value="회원등록">
   </div>
   </div> 
</div>

</form>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="css/OptAdd.css?ver=1.0" rel="stylesheet" type="text/css">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function () {
	//form 서브밋
	$("form").on("submit", function (event) {
		var userid = $("#pdno").val();
		var passwd = $("#pdnm").val();
		if (userid.length==0) {
			alert("pdno 필수")
			$("#pdno").focus();
			event.preventDefault();
		}else if (passwd.length==0) {
			alert("pdnm 필수")
			$("#pdnm").focus();
			event.preventDefault();
		}
	});

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
	});


})//end document

</script>
<form action="OptAddServlet" method="get">
<div class="intro">
 
   <ul class="logo">
    <li><a href="Mainpage1.jsp">DMN COFFEE</a></li>
   </ul>
   
   <ul class="jemog">
    <li>옵션 생성</li>
   </ul>
   
      <table class="table">
   
	<tr>
	<th class="name">옵션명</th>
	<th><input type="text" class="input_text" id="optnm" name="optnm"></th>
	</tr>
	
	<tr>
	<th class="name">추가금액</th>
	<th><input type="text" class="input_text" id="optprice" name="optprice"></th>
	</tr>
	
	<tr>
	<th class="name">분류번호</th>
	<th>   
	<select class="input_text" id="ctno" name="ctno">
    	<option value="01">01</option>
    	<option value="02">02</option>
    	<option value="03">02</option>
    	<option value="04">04</option>
    	<option value="04">04</option>
    	<option value="05">05</option>
    	<option value="06">06</option>
    </select></th>
	</tr>

	</table>
   
  <div class="button">
  
   <div>
   <input class="cancell" type="button" onclick="location.href='OptListServlet'" value="취소">
   </div>
   
   <div>
   <input class="check" type="submit" value="옵션생성" id="upload"> 
   </div>
   
   </div> 
   
</div><!-- end intro -->

</form>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="css/ProductAdd.css?ver=1.0" rel="stylesheet" type="text/css">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

$(document).ready(function () {
	//form 서브밋
/* 	$("form").on("submit", function (event) {
		var userid = $("#pdno").val();
		var passwd = $("#passwd").val();
		if (userid.length==0) {
			alert("pdno 필수")
			$("#pdno").focus();
			event.preventDefault();
		}else if (passwd.length==0) {
			alert("pdnm 필수")
			$("#pdnm").focus();
			event.preventDefault();
		}
	}); */

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

})//end document
</script>
<form action="ProductAddServlet" method="get">
<div class="intro">
 
   <ul class="logo">
    <li><a href="Mainpage1.jsp">DMN COFFEE</a></li>
   </ul>
   
   <ul class="jemog">
    <li>품목 생성</li>
   </ul>
   
   <div class="account">
   
   상품번호<input type="text" class="input_text" id="pdno" name="pdno">
   <span id="result"></span>
   </div>
   <div class="account">
   상품명<input type="text" class="input_text" id="pdnm" name="pdnm">
   </div>
   <div class="account">
   상품가격<input type="text" class="input_text" id="pdprice" name="pdprice">
   </div>
   
    <div class="account">
   상품넘버
   <select class="input_text" id="ctno" name="ctno">
   <option value="CT01">CT01</option>
   <option value="CT02">CT02</option>
   <option value="CT03">CT02</option>
   <option value="CT04">CT04</option>
   <option value="CT04">CT04</option>
   <option value="CT05">CT05</option>
   <option value="CT06">CT06</option>
   </select>&nbsp;-
   </div>
   
   <div class="account">
   상품파일
<input type="text" class="input_text" id="pdfile" name="pdfile">
  </div>
  
  <div class="button">
  
   <div>
   <input class="cancell" type="reset" value="취소">
   </div>
   <div>
   <input class="check" type="submit" value="상품생성">
   </div>
   </div> 
</div>

</form>

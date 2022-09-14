<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="css/ProductAdd.css?ver=1.1" rel="stylesheet" type="text/css">
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
<form action="ProductUploadServlet" method="post" id="uploadfile" enctype="multipart/form-data">
<div class="intro">
 
   <ul class="logo">
    <li><a href="Mainpage1.jsp">DMN COFFEE</a></li>
   </ul>
   
   <ul class="jemog">
   
    <li>상품 생성</li>
   </ul>
   <table class="table">
<tr>
<th class="name">상품번호</th>
	<th><div><input type="text" class="input_text" id="pdno" name="pdno"></div>
	<span id="result"></span></th>
</tr>

<tr>
<th class="name">상품명</th>
<th><input type="text" class="input_text" id="pdnm" name="pdnm"></th>
</tr>

<tr>
<th class="name">상품금액</th>
<th><input type="text" class="input_text" id="pdprice" name="pdprice"></th>
</tr>

<tr>
<th class="name">분류번호</th>
   <th><select class="input_text" id="ctno" name="ctno">
   <option value="01">01</option>
   <option value="02">02</option>
   <option value="03">02</option>
   <option value="04">04</option>
   <option value="04">04</option>
   <option value="05">05</option>
   <option value="06">06</option>
   </select>&nbsp;</th>
</tr>

<tr>
<th class="name">상품 이미지</th>
<th><input class="file" type="file" name="theFile"></th>
</tr>

</table>

  <div class="button">
  
   <div>
   <input class="cancell" type="button" onclick="location.href='ProductListServlet'" value="취소">
   </div>
   
   <div>
   <input class="check" type="submit" value="상품생성" id="upload"> 
   </div>
   
   </div> 
   
</div>

</form>

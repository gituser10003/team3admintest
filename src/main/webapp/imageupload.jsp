<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
/* $(function() {
	$("#fileupload").on("click",function(event){	
		 $.ajax({
				type : "POST",
				enctype="multipart/form-data",
				url : "ProductUploadServlet",
				dataType : "data",//응답 데이터 타입
			processData: false,
				contentType: false,
				cache: false,
				timeout: 600000,
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
}) */
</script>
<title>상품 파일 전송</title>
</head>
<body>
<!-- <form action="ProductUploadServlet" method="post" enctype="multipart/form-data">
	                    <table border="1">
	                           <tr>
	                              <th>제목</th>
	                              <td colspan="3"><input type="text" name="theText"></td>
	                           </tr>
	                           <tr>
	                              <th>첨부파일</th>
	                              <td colspan="3">
	                              <input type="file" name="theFile">
	                              </td>
	                           </tr>
	                        </table>
		                  <div>
		                  		
		                     <button>저장</button>
		                     <a href="ProductAdd.jsp">취소</a>
		                  </div>
                  	</form> -->
                  	
<form method="POST" enctype="multipart/form-data" 
action="ProductUploadServlet"><!-- post방식 multipart/form-data 주의  -->
  File to upload: <input type="file" name="theFile"><br/> <!-- 파일 주의  -->
  Notes about the file: <input type="text" name="theText"><br/>
  <br/>
  <input type="submit" value="Press"> to upload the file!
</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function () {

})
function uploadfile(e) {
	  e.preventDefault();

	  var frm = document.getElementById('upload');
	  frm.method = 'POST';
	  frm.enctype = 'multipart/form-data';
	  var fileData = new FormData(frm)

	  jQuery.ajax({
	    type: "POST",
	    enctype: 'multipart/form-data',
	    cache: false,
	    url: 'ProductUploadServlet',
	    data: fileData,
	    async: false,
	    contentType : false,
	    processData : false, 
	    dataType: 'jsp',
	    success: function(msg) {
	      jQuery('#upload')[0].reset(); //폼내용 삭제
	    },
	    fail: function() {
	    	; 
	    }
	  });

	}
</script>
<title>상품 파일 전송</title>
</head>
<body>
<div>
<form id="upload" method="POST" enctype="multipart/form-data"> <!-- action="ProductUploadServlet" --><!-- post방식 multipart/form-data 주의  -->
  File to upload: <input type="file" name="theFile"><br/> <!-- 파일 주의  -->
  Notes about the file: <input type="text" name="theText"><br/>
  <br/>
</form>
<div>
<input type="file" name="theFile"><br/>
<button onClick="uploadfile(event)" >생성</button>
</div>
<div>
 <input class="check" type="submit" value="상품생성">
</div>
</div>
</body>
</html>
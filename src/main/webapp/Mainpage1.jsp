<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="css/Mainpage1.css?ver=1" rel="stylesheet" type="text/css">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function () {
	
	 $("form").on("submit",function(event){		
		 var userid = $("#userid").val();
		 var passwd = $("#passwd").val();
	    		if(userid.length==0){
	    			alert("userid 필수")
	    			$("#userid").focus();
	    			event.preventDefault();
	    		}else if(passwd.length==0){
	    			alert("passwd 필수")
	    			$("#passwd").focus();
	    			event.preventDefault();
	    		}
	    	});
	
	
})//end document

</script>


<div class="intro">
<div class="back-img"></div>
 
   <ul class="logo">
    <li><a href="Mainpage1.jsp">DMN COFFEE</a></li>
   </ul>
   
   <ul class="jemog">
    <li>관리자 로그인</li>
   </ul>
   <form action="LoginServlet" method="post">
   <div class="id">
   &nbsp;&nbsp;&nbsp;아이디<br><br>
   <input type="text" class="input_text" name="userid" id="userid">
   </div>
   <div class="id">
   &nbsp;&nbsp;&nbsp;비밀번호<br><br>
   <input type="password" class="input_text" name="passwd" id="passwd">
   </div>
   <div>
   <a href="LoginUIServlet"><input class="login" type="submit" value="관리자 로그인"></a>
   </div>
   </form>
   
   <a href="Page3.jsp" class="signup">회원가입</a>
</div>
</body>

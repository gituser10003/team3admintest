<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link href="css/Page3.css?ver=1.1" rel="stylesheet" type="text/css">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

$(document).ready(function () {
	//form 서브밋
	$("form").on("submit", function (event) {
		var userid = $("#userid").val();
		var passwd = $("#passwd").val();
		if (userid.length==0) {
			alert("userid 필수")
			$("#userid").focus();
			event.preventDefault();
		}else if (passwd.length==0) {
			alert("passwd 필수")
			$("#passwd").focus();
			event.preventDefault();
		}
	});

//비번확인
$("#passwd2").on("keyup",function(){
	var passwd = $("#passwd").val();
	var mesg = "비번 불일치";
	if(passwd == $(this).val()){
		mesg = "비번 일치";
	}
	$("#result2").text(mesg);
});
//이메일 선택
$("#selectemail").on("change", function() {
	var email = $(this).val();
	$("#email2").val(email);
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
<form action="SawonAddServlet" method="get">
<div class="intro">
 
   <ul class="logo">
    <li><a href="Mainpage1.jsp">DMN COFFEE</a></li>
   </ul>
   
   <ul class="jemog">
    <li>관리자 회원가입</li>
   </ul>
	<table class="table">
	
		<tr>
			<th class="name">아이디</th>
			<th><div><input type="text" class="input_text" id="userid" name="userid"></div><span id="result"></span></th>
	    </tr>
	    
	    <tr>
			<th class="name">비밀번호</th>
			<th><input type="password" class="input_text" id="passwd" name="passwd"></th>
	    </tr>
	    
	    <tr>
			<th class="name">비밀번호 재확인</th>
			<th><div><input type="password" class="input_text" id="passwd2" name="passwd2"></div><span id="result2"></span></th>
	    </tr>
	    
	    <tr>
			<th class="name">이름</th>
			<th><input type="text" class="input_text" id="username" name="username"></th>
	    </tr>
	    
	    <tr>
			<th class="name">전화번호</th>
			<th>   <select class="input_text" id="phonenumber1" name="phonenumber1">
   			<option value="010">010</option>
   			<option value="011">011</option>
   			<option value="012">012</option>
   			<option value="070">070</option>
   			</select>&nbsp;-
   			<input type="text" class="input_text" id="phonenumber2" name="phonenumber2">&nbsp;-
   			<input type="text" class="input_text" id="phonenumber3" name="phonenumber3"></th>
	    </tr>
	    <tr>
			<th class="name">생년월일</th>
			<th><select class="input_text" id="birthday1" name="birthday1">
<option value="1900">1900</option>
<option value="1901">1901</option>
<option value="1902">1902</option>
<option value="1903">1903</option>
<option value="1904">1904</option>
<option value="1905">1905</option>
<option value="1906">1906</option>
<option value="1907">1907</option>
<option value="1908">1908</option>
<option value="1909">1909</option>
<option value="1910">1910</option>
<option value="1911">1911</option>
<option value="1912">1912</option>
<option value="1913">1913</option>
<option value="1914">1914</option>
<option value="1915">1915</option>
<option value="1916">1916</option>
<option value="1917">1917</option>
<option value="1918">1918</option>
<option value="1919">1919</option>
<option value="1920">1920</option>
<option value="1921">1921</option>
<option value="1922">1922</option>
<option value="1923">1923</option>
<option value="1924">1924</option>
<option value="1925">1925</option>
<option value="1926">1926</option>
<option value="1927">1927</option>
<option value="1928">1928</option>
<option value="1929">1929</option>
<option value="1930">1930</option>
<option value="1931">1931</option>
<option value="1932">1932</option>
<option value="1933">1933</option>
<option value="1934">1934</option>
<option value="1935">1935</option>
<option value="1936">1936</option>
<option value="1937">1937</option>
<option value="1938">1938</option>
<option value="1939">1939</option>
<option value="1940">1940</option>
<option value="1941">1941</option>
<option value="1942">1942</option>
<option value="1943">1943</option>
<option value="1944">1944</option>
<option value="1945">1945</option>
<option value="1946">1946</option>
<option value="1947">1947</option>
<option value="1948">1948</option>
<option value="1949">1949</option>
<option value="1950">1950</option>
<option value="1951">1951</option>
<option value="1952">1952</option>
<option value="1953">1953</option>
<option value="1954">1954</option>
<option value="1955">1955</option>
<option value="1956">1956</option>
<option value="1957">1957</option>
<option value="1958">1958</option>
<option value="1959">1959</option>
<option value="1960">1960</option>
<option value="1961">1961</option>
<option value="1962">1962</option>
<option value="1963">1963</option>
<option value="1964">1964</option>
<option value="1965">1965</option>
<option value="1966">1966</option>
<option value="1967">1967</option>
<option value="1968">1968</option>
<option value="1969">1969</option>
<option value="1970">1970</option>
<option value="1971">1971</option>
<option value="1972">1972</option>
<option value="1973">1973</option>
<option value="1974">1974</option>
<option value="1975">1975</option>
<option value="1976">1976</option>
<option value="1977">1977</option>
<option value="1978">1978</option>
<option value="1979">1979</option>
<option value="1980">1980</option>
<option value="1981">1981</option>
<option value="1982">1982</option>
<option value="1983">1983</option>
<option value="1984">1984</option>
<option value="1985">1985</option>
<option value="1986">1986</option>
<option value="1987">1987</option>
<option value="1988">1988</option>
<option value="1989">1989</option>
<option value="1990">1990</option>
<option value="1991">1991</option>
<option value="1992">1992</option>
<option value="1993">1993</option>
<option value="1994">1994</option>
<option value="1995">1995</option>
<option value="1996">1996</option>
<option value="1997">1997</option>
<option value="1998">1998</option>
<option value="1999">1999</option>
<option value="2000">2000</option>
<option value="2001">2001</option>
<option value="2002">2002</option>
<option value="2003">2003</option>
<option value="2004">2004</option>
<option value="2005">2005</option>
<option value="2006">2006</option>
<option value="2007">2007</option>
<option value="2008">2008</option>
<option value="2009">2009</option>
<option value="2010">2010</option>
<option value="2011">2011</option>
<option value="2012">2012</option>
<option value="2013">2013</option>
<option value="2014">2014</option>
<option value="2015">2015</option>
<option value="2016">2016</option>
<option value="2017">2017</option>
<option value="2018">2018</option>
<option value="2019">2019</option>
<option value="2020">2020</option>
<option value="2021">2021</option>
<option value="2022">2022</option>
   </select>&nbsp;년
   
   <select class="input_text" id="birthday2" name="birthday2">
<option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
<option value="4">4</option>
<option value="5">5</option>
<option value="6">6</option>
<option value="7">7</option>
<option value="8">8</option>
<option value="9">9</option>
<option value="10">10</option>
<option value="11">11</option>
<option value="12">12</option>
   </select>&nbsp;월
   
   <select class="input_text" id="birthday3" name="birthday3">
   <option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
<option value="4">4</option>
<option value="5">5</option>
<option value="6">6</option>
<option value="7">7</option>
<option value="8">8</option>
<option value="9">9</option>
<option value="10">10</option>
<option value="11">11</option>
<option value="12">12</option>
<option value="13">13</option>
<option value="14">14</option>
<option value="15">15</option>
<option value="16">16</option>
<option value="17">17</option>
<option value="18">18</option>
<option value="19">19</option>
<option value="20">20</option>
<option value="21">21</option>
<option value="22">22</option>
<option value="23">23</option>
<option value="24">24</option>
<option value="25">25</option>
<option value="26">26</option>
<option value="27">27</option>
<option value="28">28</option>
<option value="29">29</option>
<option value="30">30</option>
<option value="31">31</option>
   </select>&nbsp;일</th>
	    </tr>
	    
	      <tr>
			<th class="name">이메일</th>
			<th><input type="text" class="input_text" id="email1" name="email1">@
   			<input type="text" class="input_text" id="email2" name="email2" placeholder="직접입력">
   			<select id="selectemail">
  			<option value="naver.com">naver.com</option>
   			<option value="daum.net">daum.net</option>
   			<option value="gmail.com">gmail.com</option>
   			</select></th>
	    </tr>
	    
	      <tr>
			<th class="name">직위</th>
			<th>  <select class="input_text" name="sawongrade" id="sawongrade">
  			<option value="Worker">Worker</option>
 			</select></th>
	    </tr>
	    
</table>
  
    <div class="button">
  
   <div>
   <input class="cancell" onclick="location.href='main.jsp'" value="취소">
   </div>
   
   <div>
   <input class="check" type="submit" value="회원가입">
   </div>
   
   </div> 
   
</div><!-- end intro -->

</form>

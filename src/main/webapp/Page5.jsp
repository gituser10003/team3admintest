<%@page import="com.dto.SawonDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link href="css/Page5.css?ver=1.1" rel="stylesheet" type="text/css">
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
	
	//등급 선택
	$("#selectgrade").on("change", function() {
		var grade = $(this).val();
		$("#sawongrade").val(grade);
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

//삭제버튼
$(".del").on("click",function(){
	var userid= $(this).attr("data-id");
	location.href="SawonDelServlet?userid="+userid;
});

})//end document
</script>
<%
SawonDTO dto = (SawonDTO)request.getAttribute("dto");
String userid = dto.getUserid();
String passwd = dto.getPasswd();
String username = dto.getUsername();
String phonenumber1 = dto.getPhonenumber1();
String phonenumber2 = dto.getPhonenumber2();
String phonenumber3 = dto.getPhonenumber3();
String birthday1 = dto.getBirthday1();
String birthday2 = dto.getBirthday2();
String birthday3 = dto.getBirthday3();
String email1 = dto.getEmail1();
String email2 = dto.getEmail2();
String sawongrade = dto.getSawongrade();
%>

<div class="intro">
 <form action="SawonUpdateServlet" method="get">
   <ul class="logo">
    <li><a href="Mainpage1.jsp">DMN COFFEE</a></li>
   </ul>
   
   <ul class="jemog">
    <li>사원 수정 페이지</li>
   </ul>
   
   <div class="account">
   
   아이디<input type="text" class="input_text" id="userid" name="userid" value="<%=userid%>">
   <span id="result"></span>
   </div>
   <div class="account">
   비밀번호<input type="password" class="input_text" id="passwd" name="passwd" value="<%=passwd%>">
   </div>
    <div class="account">
   비밀번호 재확인<input type="password" class="input_text" id="passwd2" name="passwd2">
   <span id="result2"></span>
   </div>
   <div class="account">
   이름<input type="text" class="input_text" id="username" name="username" value="<%=username%>">
   </div>
   
    <div class="account">
   전화번호
   <select class="input_text" id="phonenumber1" name="phonenumber1">
   <option value="010" <% if("010".equals(phonenumber1)){ %> selected<%} %>>010</option>
   <option value="011" <% if("011".equals(phonenumber1)){ %> selected<%} %>>011</option>
   <option value="012" <% if("012".equals(phonenumber1)){ %> selected<%} %>>012</option>
   <option value="070" <% if("070".equals(phonenumber1)){ %> selected<%} %>>070</option>
   </select>&nbsp;-
   <input type="text" class="input_text" id="phonenumber2" name="phonenumber2" value="<%=phonenumber2%>">&nbsp;-
   <input type="text" class="input_text" id="phonenumber3" name="phonenumber3" value="<%=phonenumber3%>">
   </div>
   
   <div class="account">
   생년월일
   <select class="input_text" id="birthday1" name="birthday1">
<option value="1900" <% if("1900".equals(birthday1)){ %> selected<%} %>>1900</option>
<option value="1901" <% if("1901".equals(birthday1)){ %> selected<%} %>>1901</option>
<option value="1902" <% if("1902".equals(birthday1)){ %> selected<%} %>>1902</option>
<option value="1903" <% if("1903".equals(birthday1)){ %> selected<%} %>>1903</option>
<option value="1904" <% if("1904".equals(birthday1)){ %> selected<%} %>>1904</option>
<option value="1905" <% if("1905".equals(birthday1)){ %> selected<%} %>>1905</option>
<option value="1906" <% if("1906".equals(birthday1)){ %> selected<%} %>>1906</option>
<option value="1907" <% if("1907".equals(birthday1)){ %> selected<%} %>>1907</option>
<option value="1908" <% if("1908".equals(birthday1)){ %> selected<%} %>>1908</option>
<option value="1909" <% if("1909".equals(birthday1)){ %> selected<%} %>>1909</option>
<option value="1910" <% if("1910".equals(birthday1)){ %> selected<%} %>>1910</option>
<option value="1911" <% if("1911".equals(birthday1)){ %> selected<%} %>>1911</option>
<option value="1912" <% if("1912".equals(birthday1)){ %> selected<%} %>>1912</option>
<option value="1913" <% if("1913".equals(birthday1)){ %> selected<%} %>>1913</option>
<option value="1914" <% if("1914".equals(birthday1)){ %> selected<%} %>>1914</option>
<option value="1915" <% if("1915".equals(birthday1)){ %> selected<%} %>>1915</option>
<option value="1916" <% if("1916".equals(birthday1)){ %> selected<%} %>>1916</option>
<option value="1917" <% if("1917".equals(birthday1)){ %> selected<%} %>>1917</option>
<option value="1918" <% if("1918".equals(birthday1)){ %> selected<%} %>>1918</option>
<option value="1919" <% if("1919".equals(birthday1)){ %> selected<%} %>>1919</option>
<option value="1920" <% if("1920".equals(birthday1)){ %> selected<%} %>>1920</option>
<option value="1921" <% if("1921".equals(birthday1)){ %> selected<%} %>>1921</option>
<option value="1922" <% if("1922".equals(birthday1)){ %> selected<%} %>>1922</option>
<option value="1923" <% if("1923".equals(birthday1)){ %> selected<%} %>>1923</option>
<option value="1924" <% if("1924".equals(birthday1)){ %> selected<%} %>>1924</option>
<option value="1925" <% if("1925".equals(birthday1)){ %> selected<%} %>>1925</option>
<option value="1926" <% if("1926".equals(birthday1)){ %> selected<%} %>>1926</option>
<option value="1927" <% if("1927".equals(birthday1)){ %> selected<%} %>>1927</option>
<option value="1928" <% if("1928".equals(birthday1)){ %> selected<%} %>>1928</option>
<option value="1929" <% if("1929".equals(birthday1)){ %> selected<%} %>>1929</option>
<option value="1930" <% if("1930".equals(birthday1)){ %> selected<%} %>>1930</option>
<option value="1931" <% if("1931".equals(birthday1)){ %> selected<%} %>>1931</option>
<option value="1932" <% if("1932".equals(birthday1)){ %> selected<%} %>>1932</option>
<option value="1933" <% if("1933".equals(birthday1)){ %> selected<%} %>>1933</option>
<option value="1934" <% if("1934".equals(birthday1)){ %> selected<%} %>>1934</option>
<option value="1935" <% if("1935".equals(birthday1)){ %> selected<%} %>>1935</option>
<option value="1936" <% if("1936".equals(birthday1)){ %> selected<%} %>>1936</option>
<option value="1937" <% if("1937".equals(birthday1)){ %> selected<%} %>>1937</option>
<option value="1938" <% if("1938".equals(birthday1)){ %> selected<%} %>>1938</option>
<option value="1939" <% if("1939".equals(birthday1)){ %> selected<%} %>>1939</option>
<option value="1940" <% if("1940".equals(birthday1)){ %> selected<%} %>>1940</option>
<option value="1941" <% if("1941".equals(birthday1)){ %> selected<%} %>>1941</option>
<option value="1942" <% if("1942".equals(birthday1)){ %> selected<%} %>>1942</option>
<option value="1943" <% if("1943".equals(birthday1)){ %> selected<%} %>>1943</option>
<option value="1944" <% if("1944".equals(birthday1)){ %> selected<%} %>>1944</option>
<option value="1945" <% if("1945".equals(birthday1)){ %> selected<%} %>>1945</option>
<option value="1946" <% if("1946".equals(birthday1)){ %> selected<%} %>>1946</option>
<option value="1947" <% if("1947".equals(birthday1)){ %> selected<%} %>>1947</option>
<option value="1948" <% if("1948".equals(birthday1)){ %> selected<%} %>>1948</option>
<option value="1949" <% if("1949".equals(birthday1)){ %> selected<%} %>>1949</option>
<option value="1950" <% if("1950".equals(birthday1)){ %> selected<%} %>>1950</option>
<option value="1951" <% if("1951".equals(birthday1)){ %> selected<%} %>>1951</option>
<option value="1952" <% if("1952".equals(birthday1)){ %> selected<%} %>>1952</option>
<option value="1953" <% if("1953".equals(birthday1)){ %> selected<%} %>>1953</option>
<option value="1954" <% if("1954".equals(birthday1)){ %> selected<%} %>>1954</option>
<option value="1955" <% if("1955".equals(birthday1)){ %> selected<%} %>>1955</option>
<option value="1956" <% if("1956".equals(birthday1)){ %> selected<%} %>>1956</option>
<option value="1957" <% if("1957".equals(birthday1)){ %> selected<%} %>>1957</option>
<option value="1958" <% if("1958".equals(birthday1)){ %> selected<%} %>>1958</option>
<option value="1959" <% if("1959".equals(birthday1)){ %> selected<%} %>>1959</option>
<option value="1960" <% if("1960".equals(birthday1)){ %> selected<%} %>>1960</option>
<option value="1961" <% if("1961".equals(birthday1)){ %> selected<%} %>>1961</option>
<option value="1962" <% if("1962".equals(birthday1)){ %> selected<%} %>>1962</option>
<option value="1963" <% if("1963".equals(birthday1)){ %> selected<%} %>>1963</option>
<option value="1964" <% if("1964".equals(birthday1)){ %> selected<%} %>>1964</option>
<option value="1965" <% if("1965".equals(birthday1)){ %> selected<%} %>>1965</option>
<option value="1966" <% if("1966".equals(birthday1)){ %> selected<%} %>>1966</option>
<option value="1967" <% if("1967".equals(birthday1)){ %> selected<%} %>>1967</option>
<option value="1968" <% if("1968".equals(birthday1)){ %> selected<%} %>>1968</option>
<option value="1969" <% if("1969".equals(birthday1)){ %> selected<%} %>>1969</option>
<option value="1970" <% if("1970".equals(birthday1)){ %> selected<%} %>>1970</option>
<option value="1971" <% if("1971".equals(birthday1)){ %> selected<%} %>>1971</option>
<option value="1972" <% if("1972".equals(birthday1)){ %> selected<%} %>>1972</option>
<option value="1973" <% if("1973".equals(birthday1)){ %> selected<%} %>>1973</option>
<option value="1974" <% if("1974".equals(birthday1)){ %> selected<%} %>>1974</option>
<option value="1975" <% if("1975".equals(birthday1)){ %> selected<%} %>>1975</option>
<option value="1976" <% if("1976".equals(birthday1)){ %> selected<%} %>>1976</option>
<option value="1977" <% if("1977".equals(birthday1)){ %> selected<%} %>>1977</option>
<option value="1978" <% if("1978".equals(birthday1)){ %> selected<%} %>>1978</option>
<option value="1979" <% if("1979".equals(birthday1)){ %> selected<%} %>>1979</option>
<option value="1980" <% if("1980".equals(birthday1)){ %> selected<%} %>>1980</option>
<option value="1981" <% if("1981".equals(birthday1)){ %> selected<%} %>>1981</option>
<option value="1982" <% if("1982".equals(birthday1)){ %> selected<%} %>>1982</option>
<option value="1983" <% if("1982".equals(birthday1)){ %> selected<%} %>>1983</option>
<option value="1984" <% if("1984".equals(birthday1)){ %> selected<%} %>>1984</option>
<option value="1985" <% if("1985".equals(birthday1)){ %> selected<%} %>>1985</option>
<option value="1986" <% if("1986".equals(birthday1)){ %> selected<%} %>>1986</option>
<option value="1987" <% if("1987".equals(birthday1)){ %> selected<%} %>>1987</option>
<option value="1988" <% if("1988".equals(birthday1)){ %> selected<%} %>>1988</option>
<option value="1989" <% if("1989".equals(birthday1)){ %> selected<%} %>>1989</option>
<option value="1990" <% if("1990".equals(birthday1)){ %> selected<%} %>>1990</option>
<option value="1991" <% if("1991".equals(birthday1)){ %> selected<%} %>>1991</option>
<option value="1992" <% if("1992".equals(birthday1)){ %> selected<%} %>>1992</option>
<option value="1993" <% if("1993".equals(birthday1)){ %> selected<%} %>>1993</option>
<option value="1994" <% if("1994".equals(birthday1)){ %> selected<%} %>>1994</option>
<option value="1995" <% if("1995".equals(birthday1)){ %> selected<%} %>>1995</option>
<option value="1996" <% if("1996".equals(birthday1)){ %> selected<%} %>>1996</option>
<option value="1997" <% if("1997".equals(birthday1)){ %> selected<%} %>>1997</option>
<option value="1998" <% if("1998".equals(birthday1)){ %> selected<%} %>>1998</option>
<option value="1999" <% if("1999".equals(birthday1)){ %> selected<%} %>>1999</option>
<option value="2000" <% if("2000".equals(birthday1)){ %> selected<%} %>>1999</option>
<option value="2001" <% if("2001".equals(birthday1)){ %> selected<%} %>>2001</option>
<option value="2002" <% if("2002".equals(birthday1)){ %> selected<%} %>>2002</option>
<option value="2003" <% if("2003".equals(birthday1)){ %> selected<%} %>>2003</option>
<option value="2004" <% if("2004".equals(birthday1)){ %> selected<%} %>>2004</option>
<option value="2005" <% if("2005".equals(birthday1)){ %> selected<%} %>>2005</option>
<option value="2006" <% if("2006".equals(birthday1)){ %> selected<%} %>>2006</option>
<option value="2007" <% if("2007".equals(birthday1)){ %> selected<%} %>>2007</option>
<option value="2008" <% if("2008".equals(birthday1)){ %> selected<%} %>>2008</option>
<option value="2009" <% if("2009".equals(birthday1)){ %> selected<%} %>>2009</option>
<option value="2010" <% if("2010".equals(birthday1)){ %> selected<%} %>>2010</option>
<option value="2011" <% if("2011".equals(birthday1)){ %> selected<%} %>>2011</option>
<option value="2012" <% if("2012".equals(birthday1)){ %> selected<%} %>>2012</option>
<option value="2013" <% if("2013".equals(birthday1)){ %> selected<%} %>>2013</option>
<option value="2014" <% if("2014".equals(birthday1)){ %> selected<%} %>>2014</option>
<option value="2015" <% if("2015".equals(birthday1)){ %> selected<%} %>>2015</option>
<option value="2016" <% if("2016".equals(birthday1)){ %> selected<%} %>>2016</option>
<option value="2017" <% if("2017".equals(birthday1)){ %> selected<%} %>>2017</option>
<option value="2018" <% if("2018".equals(birthday1)){ %> selected<%} %>>2018</option>
<option value="2019" <% if("2019".equals(birthday1)){ %> selected<%} %>>2019</option>
<option value="2020" <% if("2020".equals(birthday1)){ %> selected<%} %>>2020</option>
<option value="2021" <% if("2021".equals(birthday1)){ %> selected<%} %>>2021</option>
<option value="2022" <% if("2022".equals(birthday1)){ %> selected<%} %>>2022</option>
   </select>년
   
   <select class="input_text" id="birthday2" name="birthday2">
<option value="1" <% if("1".equals(birthday2)){ %> selected<%} %>>1</option>
<option value="2" <% if("2".equals(birthday2)){ %> selected<%} %>>2</option>
<option value="3" <% if("3".equals(birthday2)){ %> selected<%} %>>3</option>
<option value="4" <% if("4".equals(birthday2)){ %> selected<%} %>>4</option>
<option value="5" <% if("5".equals(birthday2)){ %> selected<%} %>>5</option>
<option value="6" <% if("6".equals(birthday2)){ %> selected<%} %>>6</option>
<option value="7" <% if("7".equals(birthday2)){ %> selected<%} %>>7</option>
<option value="8" <% if("8".equals(birthday2)){ %> selected<%} %>>8</option>
<option value="9" <% if("9".equals(birthday2)){ %> selected<%} %>>9</option>
<option value="10" <% if("10".equals(birthday2)){ %> selected<%} %>>10</option>
<option value="11" <% if("11".equals(birthday2)){ %> selected<%} %>>11</option>
<option value="12" <% if("12".equals(birthday2)){ %> selected<%} %>>12</option>
   </select>월
   
   <select class="input_text" id="birthday3" name="birthday3">
   <option value="1" <% if("1".equals(birthday3)){ %> selected<%} %>>1</option>
<option value="2" <% if("2".equals(birthday3)){ %> selected<%} %>>2</option>
<option value="3" <% if("3".equals(birthday3)){ %> selected<%} %>>3</option>
<option value="4" <% if("4".equals(birthday3)){ %> selected<%} %>>4</option>
<option value="5" <% if("5".equals(birthday3)){ %> selected<%} %>>5</option>
<option value="6" <% if("6".equals(birthday3)){ %> selected<%} %>>6</option>
<option value="7" <% if("7".equals(birthday3)){ %> selected<%} %>>7</option>
<option value="8" <% if("8".equals(birthday3)){ %> selected<%} %>>8</option>
<option value="9" <% if("9".equals(birthday3)){ %> selected<%} %>>9</option>
<option value="10" <% if("10".equals(birthday3)){ %> selected<%} %>>10</option>
<option value="11" <% if("11".equals(birthday3)){ %> selected<%} %>>11</option>
<option value="12" <% if("12".equals(birthday3)){ %> selected<%} %>>12</option>
<option value="13" <% if("13".equals(birthday3)){ %> selected<%} %>>13</option>
<option value="14" <% if("14".equals(birthday3)){ %> selected<%} %>>14</option>
<option value="15" <% if("15".equals(birthday3)){ %> selected<%} %>>15</option>
<option value="16" <% if("16".equals(birthday3)){ %> selected<%} %>>16</option>
<option value="17" <% if("17".equals(birthday3)){ %> selected<%} %>>17</option>
<option value="18" <% if("18".equals(birthday3)){ %> selected<%} %>>18</option>
<option value="19" <% if("19".equals(birthday3)){ %> selected<%} %>>19</option>
<option value="20" <% if("20".equals(birthday3)){ %> selected<%} %>>20</option>
<option value="21" <% if("21".equals(birthday3)){ %> selected<%} %>>21</option>
<option value="22" <% if("22".equals(birthday3)){ %> selected<%} %>>22</option>
<option value="23" <% if("23".equals(birthday3)){ %> selected<%} %>>23</option>
<option value="24" <% if("24".equals(birthday3)){ %> selected<%} %>>24</option>
<option value="25" <% if("25".equals(birthday3)){ %> selected<%} %>>25</option>
<option value="26" <% if("26".equals(birthday3)){ %> selected<%} %>>26</option>
<option value="27" <% if("27".equals(birthday3)){ %> selected<%} %>>27</option>
<option value="28" <% if("28".equals(birthday3)){ %> selected<%} %>>28</option>
<option value="29" <% if("29".equals(birthday3)){ %> selected<%} %>>29</option>
<option value="30" <% if("30".equals(birthday3)){ %> selected<%} %>>30</option>
<option value="31" <% if("31".equals(birthday3)){ %> selected<%} %>>31</option>
   </select>일

  </div>
  
  <div class="account">
   이메일<input type="text" class="input_text" id="email1" name="email1" value="<%=email1%>">@
   <input type="text" class="input_text" id="email2" name="email2" placeholder="직접입력" value="<%=email2%>">
   <select id="selectemail">
   <option value="naver.com" <% if("naver.com".equals(email2)){ %> selected<%} %>>naver.com</option>
   <option value="daum.net" <% if("daum.net".equals(email2)){ %> selected<%} %>>daum.net</option>
   <option value="gmail.com" <% if("gmail.com".equals(email2)){ %> selected<%} %>>gmail.com</option>
   </select>
   </div>
  
  <div class="account">
  직위
  <select class="input_text" name="sawongrade" id="sawongrade">
  <option value="Manager" <% if("Manager".equals(sawongrade)){ %> selected<%} %>>Manager</option>
  <option value="Worker" <% if("Worker".equals(sawongrade)){ %> selected<%} %>>Worker</option>
  </select>
  
  </div>
  
  <div class="button">
  
   <div>
   <input class="cancell" type="reset" value="취소">
   </div>
   <div>
   <input onclick="return confirm('정말로 수정하시겠습니까?')" class="check" type="submit" value="확인">
   </div>
   </div>
   </form>
     <div>
     <input onclick="return confirm('정말로 삭제하시겠습니까?')" type="button" class="del"  value="삭제" id="xx<%=userid %>" data-id="<%=userid%>" />
     </div> 


</div>



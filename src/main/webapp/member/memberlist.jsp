<%@page import="com.dto.MemberPageDTO"%>
<%@page import="com.dto.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

</script>
<link href="css/memberlist.css?ver=1.1" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="intro">
		<div class="header">

			<div class="main1">
			   <div class="toptop">
				<ul>
					<li><a href="main.jsp"><img src="images/menu_home.png"
							style="width: 50px; height: auto"></a></li>
				</ul>
				<ul class="logo">
					<li><a href="main.jsp">DMN COFFEE</a></li>
				</ul>
               </div>
				<div class="modify_title">
				 회원 리스트
					<div class="title_menus">

					</div>
				</div>
<%
MemberPageDTO mDTO = (MemberPageDTO) request.getAttribute("mDTO");
List<MemberDTO> list = mDTO.getList();
String order = (String)request.getAttribute("order");
String searchName = (String)request.getAttribute("searchName");
String searchValue = (String)request.getAttribute("searchValue");
	%>
<table class="admin_board_wrap">
					<tbody class="admin_boardList">
						<!-- <th class="admin_board_head" >아이디</th> -->
						<!-- <th class="admin_board_head">비밀번호</th> -->
						<th class="admin_board_head" >회원번호</th>
						<th class="admin_board_head" >핸드폰번호</th>
						<th class="admin_board_head" >포인트</th>
					</tbody>
					<tbody>
		<%
			for (int i = 0; i < list.size(); i++) {
				MemberDTO dto = list.get(i);
				int memno = dto.getMemno();
				String phone1 = dto.getPhone1();
				String phone2 = dto.getPhone2();
				String phone3 = dto.getPhone3();
				int mempoint = dto.getMempoint();
		%>
	
		<tr class="admin_board_user_vowel" >
			
			<td class="admin_board_user" id="memno" name="memno"><a href="MemberRetrieveServlet?memno=<%=memno%>"><%=memno%></a></td>
			<td class="admin_board_user" id="phone1" name="phone1"><%=phone1+"-"+phone2+"-"+phone3%></td>
			<td class="admin_board_user" id="mempoint" name="mempoint"><%=mempoint%></td>
		</tr>
					<%
			}
		%>
			</tbody>
			<tr>
			<td colspan="5">
				<form action="MemberListServlet">
					<select name="searchName">
						<option value="memno">회원번호</option>
						<option value="memphone3">번호</option>
					</select> <input type="text" name="searchValue"> <input
						type="submit" value="검색">
				</form>
			</td>
		</tr>
				</table>
		
				<s_paging> 
            <div id="paging" class="paging">
              <br>
              <%
                int curPage = mDTO.getCurPage();
		        int perPage = mDTO.getPerPage();
				int totalCount = mDTO.getTotalCount();
				int totalPage = totalCount/perPage;
				if(totalCount%perPage!=0) totalPage++;
		        for(int i=1; i<= totalPage; i++){
		          	if(i== curPage){
		          		out.print(i+"&nbsp;");
		          	}else{
		          		out.print("<a href='MemberListServlet?curPage="+i+"&searchName="+searchName+"&searchValue="+searchValue+"'>"+i+"</a>&nbsp;");
		          	}
		        }//end for
              %>
 <!--                <a href="#" class="prev" title="이전페이지">◀ PREV </a>
                <s_paging_rep><a href="#" class="num">1</a></s_paging_rep>
                <s_paging_rep><a href="#" class="num">2</a></s_paging_rep>
                <s_paging_rep><a href="#" class="num">3</a></s_paging_rep>
                <a href="#" class="prev" title="다음페이지">NEXT ▶</a> -->
              <br/>&nbsp;
            </div>
        </s_paging>
			</div><!-- end main1 -->
		</div><!-- end header -->
		<a href="memberAdd.jsp" class="signup">회원등록</a>
	</div><!-- end intro -->
	
</body>
</html>
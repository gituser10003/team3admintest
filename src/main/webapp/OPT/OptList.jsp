<%@page import="com.dto.OptPageDTO"%>
<%@page import="com.dto.OptDTO"%>
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
<link href="css/OptList.css?ver=1.2" rel="stylesheet" type="text/css">

</head>
<body>
	<%
	OptPageDTO oDTO = (OptPageDTO) request.getAttribute("oDTO");
	List<OptDTO> list = oDTO.getList();
	String order = (String)request.getAttribute("order");
	String searchName = (String)request.getAttribute("searchName");
	String searchValue = (String)request.getAttribute("searchValue");
	%>
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
				<div class="ttp">
				
					<div class="modify_title">
					<a>옵션 리스트</a>
			    </div>
			    
			    <div class="detail">
					<div><a href="ProductListServlet?" class="category">상품</a>&nbsp;</div>
					<div><a href="CategoryListServlet?" class="option">카테고리</a>&nbsp;</div>
					<div><a href="OptListServlet?" class="opt">옵션</a></div>
				</div>
			    
				</div>

<table class="admin_board_wrap">
					<tbody class="admin_boardList">
						<th class="admin_board_head" >옵션번호</th>
						<th class="admin_board_head" >옵션명</th>
						<th class="admin_board_head" >추가금액</th>
						<th class="admin_board_head" >분류번호</th>
					</tbody>
					<tbody>
		<%
			for (int i = 0; i < list.size(); i++) {
				OptDTO dto = list.get(i);
				int optno=dto.getOptno();
				String optnm=dto.getOptnm();
				int optprice=dto.getOptprice();
				int ctno=dto.getCtno();
			
		%>
	
		<tr class="admin_board_user_vowel" >
			
			<td class="admin_board_user" id="optno" name="optno"><a href="OptRetrieveServlet?optno=<%=optno%>"><%=optno%></a></td>
			<td class="admin_board_user" id="optnm" name="optnm"><%=optnm%></td>
			<td class="admin_board_user" id="optprice" name="optprice"><%=optprice%></td>
			<td class="admin_board_user" id="ctno" name="ctno"><%=ctno%></td>
		</tr>
					<%
			}
		%>
			</tbody>
			
			<tr>
			<td colspan="5">
				<form action="OptListServlet">
					<select name="searchName">
						<option value="pdnm">옵션명</option>
						<option value="ctno">상품분류</option>
					</select> <input type="text" name="searchValue"> <input
						type="submit" value="검색">
				</form>
			</td>
		</tr>
				</table>
		<div class="pagesign">
				
            <div id="paging" class="paging">
              <br>
                <%
		        int curPage = oDTO.getCurPage();
		        int perPage = oDTO.getPerPage();
				int totalCount = oDTO.getTotalCount();
				int totalPage = totalCount/perPage;
				if(totalCount%perPage!=0) totalPage++;
		        for(int i=1; i<= totalPage; i++){
		          	if(i== curPage){
		          		out.print(i+"&nbsp;");
		          	}else{
		          		out.print("<a href='OptListServlet?curPage="+i+"&searchName="+searchName+"&searchValue="+searchValue+"'>"+i+"</a>&nbsp;");
		          	}
		        }//end for
		   %>
              <br/>&nbsp;
            </div><!-- end paging -->
            
            <div class="ssign">
				<a href="OptAdd.jsp" class="signup">옵션생성</a>
			</div>
            
        </div><!-- end pagesign -->
			</div><!-- end main1 -->
		</div><!-- end header -->
		
		
		
		<div class="back">
		<ul>
		<li><a href="Page2.jsp"><img class="backimage" src="images/back.png"></a></li>
		</ul>
		</div>
	</div><!-- end intro -->
	 
</body>
</html>
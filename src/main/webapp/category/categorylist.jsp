<%@page import="com.dto.CategoryPageDTO"%>
<%@page import="com.dto.CategoryDTO"%>
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

   $(document).ready(function() {
       
   	   $("#all").on("click", function() {
   		     var result = this.checked;
   		     $(".chk").each(function(idx,data){
   		    	// this.checked = result;
   		    	 data.checked=result;
   		    	 console.log(idx,"\t", data);
   		     });
   	   });
   	   
   	});
</script>
<link href="css/categorylist.css?ver=1.1" rel="stylesheet" type="text/css">
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
				<div class="ttp">
				
				<div class="modify_title">
					<a>카테고리 리스트</a>
			    </div>
			    
					   	<div class="detail">
					<div><a href="ProductListServlet?" class="category">상품</a>&nbsp;</div>
					<div><a href="CategoryListServlet?" class="option">카테고리</a>&nbsp;</div>
					<div><a href="OptListServlet?" class="opt">옵션</a></div>
				</div>
			    
				</div>
				
<%
CategoryPageDTO cDTO = (CategoryPageDTO)request.getAttribute("cDTO");
List<CategoryDTO> list = cDTO.getList();
String order = (String)request.getAttribute("order");
String searchName = (String)request.getAttribute("searchName");
String searchValue = (String)request.getAttribute("searchValue");
	%>
<table class="admin_board_wrap">
					<tbody class="admin_boardList">
						<th class="admin_board_head" >카테고리 번호</th>
						<th class="admin_board_head" >카테고리 이름</th>
					</tbody>
					<tbody>
		<%
		for (int i = 0; i < list.size(); i++) {
			CategoryDTO dto = list.get(i);
			int ctno = dto.getCtno();
			String ctnm = dto.getCtnm();
		%>
	
		<tr class="admin_board_user_vowel" >
			<td class="admin_board_user" id="ctno" name="ctno"><a href="CatrgoryRetrieveServlet?ctno=<%=ctno%>"><%=ctno%></a></td>
			<td class="admin_board_user" id="ctnm" name="ctnm"><%=ctnm%></td>
			</tr>
					<%
			}
		%>
			</tbody>
			<tr>
			<td colspan="5">
				<form action="CategoryListServlet">
					<select name="searchName">
						<option value="ctno">카테고리번호</option>
						<option value="ctnm">카테고리이름</option>
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
                int curPage = cDTO.getCurPage();
		        int perPage = cDTO.getPerPage();
				int totalCount = cDTO.getTotalCount();
				int totalPage = totalCount/perPage;
				if(totalCount%perPage!=0) totalPage++;
		        for(int i=1; i<= totalPage; i++){
		          	if(i== curPage){
		          		out.print(i+"&nbsp;");
		          	}else{
		          		out.print("<a href='CategoryListServlet?curPage="+i+"&searchName="+searchName+"&searchValue="+searchValue+"'>"+i+"</a>&nbsp;");
		          	}
		        }//end for
              %>
              
              <br/>&nbsp;
            </div><!-- end paging -->
            
            <div class="ssign">
				<a href="categoryAdd.jsp" class="signup">카테고리등록</a>
			</div>
		</div><!-- end pagesign -->
			</div><!-- end main1 -->
		</div><!-- end header -->
		
		
		
		<div class="back">
		<ul>
		<li><a href="ProductListServlet"><img class="backimage" src="images/back.png"></a></li>
		</ul>
	</div><!-- end intro -->
	</div>
</body>
</html>
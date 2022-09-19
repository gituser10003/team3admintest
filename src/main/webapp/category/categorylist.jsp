<%@page import="com.dto.CategoryPageDTO"%>
<%@page import="com.dto.CategoryDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <!-- Required meta tags -->
<!--     <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" 
    rel="stylesheet" 
    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" 
    crossorigin="anonymous">  -->
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
<link href="css/ProductList.css?ver=1.1" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="intro">
		<div class="header">

			<div class="main1">
				<ul>
					<li><a href="main.jsp"><img src="images/menu_home.png"
							style="width: 50px; height: auto"></a></li>
				</ul>
				<ul class="logo">
					<li><a href="main.jsp">DMN COFFEE</a></li>
				</ul>

				<div class="ttp">
				
				<ul class="modify_title">
					<li>카테고리 리스트</li>
			    </ul>
			    
					   	<ul class="detail">
					<li><a href="ProductListServlet?" class="category">상품</a>&nbsp;</li>
					<li><a href="CategoryListServlet?" class="option">카테고리</a></li>
					<li><a href="OptListServlet?" class="opt">옵션</a></li>
				</ul>
			    
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
		
				<s_paging> 
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
              
             <!--    <a href="#" class="prev" title="이전페이지">◀ PREV </a>
                <s_paging_rep><a href="#" class="num">1</a></s_paging_rep>
                <s_paging_rep><a href="#" class="num">2</a></s_paging_rep>
                <s_paging_rep><a href="#" class="num">3</a></s_paging_rep>
                <a href="#" class="prev" title="다음페이지">NEXT ▶</a> -->
              <br/>&nbsp;
            </div>
        </s_paging>
			</div><!-- end main1 -->
		</div><!-- end header -->
		<a href="categoryAdd.jsp" class="signup">카테고리등록</a>
		
		
		<div class="back">
		<ul>
		<li><a href="ProductListServlet"><img class="backimage" src="images/back.png"></a></li>
		</ul>
	</div><!-- end intro -->
	</div>
</body>
</html>
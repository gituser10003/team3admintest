<%@page import="com.dto.ProductPageDTO"%>
<%@page import="com.dto.ProductDTO"%>
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
<link href="css/ProductList.css?ver=1.1" rel="stylesheet" type="text/css">

</head>
<body>
	<%
	ProductPageDTO pDTO = (ProductPageDTO) request.getAttribute("pDTO");
	List<ProductDTO> list = pDTO.getList();
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
				
				<ul class="modify_title">
					<li>상품 관리 리스트v1</li>
			    </ul>
			    
			    <ul class="detail">
			    <li><a href="CategoryListServlet" class="category">카테고리</a>&nbsp;</li>
			    <li><a class="option">옵션</a></li>
			    </ul>
			    
				</div>

<table class="admin_board_wrap">
					<tbody class="admin_boardList">
						<!-- <th class="admin_board_head" >아이디</th> -->
						<!-- <th class="admin_board_head">비밀번호</th> -->
						<th class="admin_board_head" >상품번호</th>
						<th class="admin_board_head" >상품명</th>
						<th class="admin_board_head" >가격</th>
						<th class="admin_board_head" >물품분류</th>
					</tbody>
					<tbody>
		<%
			for (int i = 0; i < list.size(); i++) {
				ProductDTO dto = list.get(i);
				int pdno=dto.getPdno();
				String pdnm=dto.getPdnm();
				int pdprice=dto.getPdprice();
				int ctno=dto.getCtno();
			
		%>
	
		<tr class="admin_board_user_vowel" >
			
			<td class="admin_board_user" id="pdno" name="pdno"><a href="ProductRetrieveServlet?pdno=<%=pdno%>"><%=pdno%></a></td>
			<td class="admin_board_user" id="pdnm" name="pdnm"><%=pdnm%></td>
			<td class="admin_board_user" id="pdprice" name="pdprice"><%=pdprice%></td>
			<td class="admin_board_user" id="ctno" name="ctno"><%=ctno%></td>
		</tr>
					<%
			}
		%>
			</tbody>
			
			<tr>
			<td colspan="5">
				<form action="ProductList">
					<select name="searchName">
						<option value="pdnm">상품명</option>
						<option value="ctno">상품분류</option>
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
		        int curPage = pDTO.getCurPage();
		        int perPage = pDTO.getPerPage();
				int totalCount = pDTO.getTotalCount();
				int totalPage = totalCount/perPage;
				if(totalCount%perPage!=0) totalPage++;
		        for(int i=1; i<= totalPage; i++){
		          	if(i== curPage){
		          		out.print(i+"&nbsp;");
		          	}else{
		          		out.print("<a href='ProductListServlet?curPage="+i+"&searchName="+searchName+"&searchValue="+searchValue+"'>"+i+"</a>&nbsp;");
		          	}
		        }//end for
		   %>
              <br/>&nbsp;
            </div>
        </s_paging>
			</div><!-- end main1 -->
		</div><!-- end header -->
		<a href="ProductAdd.jsp" class="signup">상품생성</a>
		
		<div class="back">
		<ul>
		<li><a href="Page2.jsp"><img class="backimage" src="images/back.png"></a></li>
		</ul>
		</div>
	</div><!-- end intro -->
	 
</body>
</html>
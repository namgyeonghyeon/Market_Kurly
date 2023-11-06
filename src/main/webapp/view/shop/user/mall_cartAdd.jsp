<%@page import="shop.ProductBean"%>
<%@page import="shop.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- mall_prodView.jsp(장담,상번,주수) => mall_cartAdd.jsp 
10번,3개
7번, 4개
12번, 5개
-->
<jsp:useBean id="mallCart" class="shop.CartBean" scope="session"/>

<%
int pnum = (int)session.getAttribute("pnum");
	int ovalue = Integer.parseInt(request.getParameter("ovalue"));
	
	ProductDao pdao = ProductDao.getInstance();
	ProductBean pb = pdao.selectProdpNum(pnum);
	if(pb.getCount() < ovalue){
%>
		<script type="text/javascript">
			alert('주문 수량 초과');
			location.href="mall.jsp";
		</script>	
<%		
		return; 
	}
	 
	mallCart.addProduct(pnum,ovalue); 
	// 10,3
	// 9,4
	// 5,2
	response.sendRedirect("mall_cartlist.jsp");
%>









<%@page import="shop.ProductBean"%>
<%@page import="shop.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="mallCart" class="shop.CartBean" scope="session"/>
<%
	String pnum = request.getParameter("pnum");
	String count = request.getParameter("count2");
	
	ProductDao pdao = ProductDao.getInstance();
	ProductBean pb = pdao.selectProdpNum(Integer.parseInt(pnum));
	System.out.print("pnum:" + pnum);
	System.out.print("count:" + count);
	
	if(pb.getCount() < Integer.parseInt(count)){
%>
		<script type="text/javascript">
			alert('주문 수량 초과');
			location.href="mall.jsp";
			history.back();
		</script>	
<%		
		return;
	}
	
	mallCart.setUpdate(pnum,count);  
%>
	<script type="text/javascript">
		alert('주문 수량 수정되었습니다');
		location.href="mall.jsp";
	</script>	
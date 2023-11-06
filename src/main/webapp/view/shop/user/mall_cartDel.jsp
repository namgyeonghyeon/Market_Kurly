<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="mallCart" class="shop.CartBean" scope="session"/>
<% 
	int pnum = Integer.parseInt(request.getParameter("pnum"));
	
	mallCart.deleteProduct(pnum); 
	  
%> 
<script type="text/javascript">
		alert('상품이 삭제되었습니다.');
		location.href="mall_cartlist.jsp";
</script> 
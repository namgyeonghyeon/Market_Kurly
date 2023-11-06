<%@page import="shop.ProductBean"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="mallCart" class="shop.CartBean" scope="session"/>
<jsp:useBean id="odao" class="shop.OrderDao" scope="session"/>
<%
	Vector<ProductBean> cv = mallCart.getAllProducts();
	int memno = (Integer)session.getAttribute("memno");
	String msg;
	int cnt = odao.insertOrder(memno,cv);
	if(cnt != 0){
		msg = "주문 완료했습니다";
		mallCart.removeAllProducts();
%>
	<script type="text/javascript">
		alert("<%=msg%>");
		var resp = confirm("계속하시겠습니까?");
		if(resp){
			location.href = "<%=request.getContextPath()%>/view/shop/user/mall.jsp"
		}else{
			location.href = "<%=request.getContextPath()%>/view/member/login/login_Form.jsp"
		}
	</script>
<%
	}else{
		msg = "주문 실패했습니다";
%>
		<script type="text/javascript">
			alert("<%=msg%>");
			location.href = "<%=request.getContextPath()%>/view/member/login/login_Form.jsp"
		</script>
<%
	}
%>
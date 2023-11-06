<%@page import="shop.OrderBean"%>
<%@page import="java.util.Vector"%>
<%@page import="shop.OrderDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="shop.ProductBean"%>
<%@page import="shop.ProductDao"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<style>
@import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@700&family=Poppins:wght@500&display=swap');
	
.img_size {
	width: 100px;
	height:150px;
}
.content{
	width: 70%;
	font-family: 'IBM Plex Sans KR', sans-serif;
	font-family: 'Poppins', sans-serif;
}
.inner{
  border-collapse : collapse;
  width: 150px;
  margin-top: 10px;
  margin-bottom: 10px;
  margin-left: 50px;
};
.cartin{
	width: 150px;
	background: white;
}
.toptext{
	text-align: center;
	font-size: 25px;
	font-family: 'IBM Plex Sans KR', sans-serif;
	font-family: 'Poppins', sans-serif cursive;
}
.pricetable {
		font-weight: bold;
		height: 70px;
		width: 200px;
		margin-top: 30px;
		font-size: 13px;
		border: 1px solid #999; 
}
</style>
<%
	String id2 = (String)session.getAttribute("id");
	int pnum = (int)session.getAttribute("pnum");
	OrderDao odao = OrderDao.getInstance();
	Vector<OrderBean> lists = odao.getOrderList(id2); 
	int totalprice = 0;
%>

<%@ include file="main_mall_top.jsp"%> 
<p class="toptext">구매상품</p>
<hr style="width: 610px; margin-left: 540px;">
	<div class="content">
	<div class="region">
	<table style="width: 600; height: 300; margin-left: 530px; text-align:center;">
	<%
            if(lists.size() == 0){
        %>
            <tr>
                <td colspan=6 align=center>
                    선택한 상품이 없습니다.
                </td>
            </tr>
    <%          
        }else{
			for(int i = 0; i < lists.size(); i++){
				OrderBean pb = lists.get(i);
				String pimage = pb.getProimg();
				String imgPath = request.getContextPath()+"/view/images/";
				String salePrice = String.format("%.0f", (pb.getPrice()*pb.getQty()) - (pb.getPrice() * 0.22));
		%>
		<tr>
            <td style="margin-left: 300px;">
            	<img src = "<%=imgPath + pb.getProimg()%>" width="100" height="100">
            </td>
            <td width="100px;" style=" margin-top: 50px;">
                <%=pb.getPtitle() %><br>
            </td>
            <td width="100px;" style="margin-top: 50px;">
                <%=pb.getQty() %>개
            </td>
            <td style="margin-right: 50px; width: 100px;">
                ₩<%=salePrice%>원
                <%
                    totalprice += Integer.parseInt(salePrice); 
                %>
            </td>
            <td width="100px;" style="margin-top: 30px;">
                <%=pb.getBuy_date()%><br>
            </td>
        <%
            } // for 루프 끝
        } // else 끝
        %>
		</table>
        <table style="width: 600; height: 100; margin-left: 750px;">
        	<tr>
	        	<td>
	        		<div class="pricetable">
	        			<p style="margin-top: 26px; margin-left: 50px;">총액: ₩<%=totalprice %>원</p>
	        		</div>
	        	</td>
       	 	</tr>
        </table>
	</div>
</div>
<%@ include file="../../../mall_bottom.jsp"%>

<%@page import="java.util.ArrayList"%>
<%@page import="shop.ProductBean"%>
<%@page import="shop.ProductDao"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<style>
@import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@700&family=Poppins:wght@500&display=swap');
	
.img_size {
	width: 250px;
	height: 300px;
}
.content{
	width: 70%;
	margin-left: 350px;
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
	margin-left: 825px; 
	font-size: 25px;
	font-family: 'IBM Plex Sans KR', sans-serif;
	font-family: 'Poppins', sans-serif cursive;
}
</style>
<%
	ProductDao pdao = ProductDao.getInstance();
	ArrayList<ProductBean> lists = pdao.getViewerProduct(); 
%>

<%@ include file="main_mall_top.jsp"%>
<p class="toptext">BEST</p>
	<div class="content">
	<div class="region">
	<table>
	<%for(int i = 0; i < lists.size(); i++){
		ProductBean pb = lists.get(i);
		String pimage = pb.getProimg();
		String imgPath = request.getContextPath()+"/view/images/"+pimage;
		if(i % 4 == 0){%>
		<tr>
		<%	
			}
		%>	
			<td height="350px;" valign="top">
				<a href = "buy_mall.jsp?pnum=<%=pb.getPnum()%>" style="text-decoration-line: none; color: inherit;">
					<img class="img_size" src="<%=imgPath %>" id="firstImage"><br>
				</a>
				<table class="inner">
					<tr>
						<td style="text-align: center;">
							<a href = "buy_mall.jsp?pnum=<%=pb.getPnum()%>" style="text-decoration-line: none; color: inherit;">
								<%=i+1 %>위
							</a>
						</td>
					</tr>
					<tr>
						<td style="text-align: center;">
							<a href = "buy_mall.jsp?pnum=<%=pb.getPnum()%>" style="text-decoration-line: none; color: inherit;">
								<%=pb.getPtitle() %>
							</a>
						</td>
					</tr>
					<tr>
						<td style="text-align: center;">
							<a href = "buy_mall.jsp?pnum=<%=pb.getPnum()%>" style="text-decoration-line: none; color: inherit;">
								<%=pb.getPrice()%>원
							</a>
						</td>
					</tr>
				</table>
			</td>
		<%
			} 
		%>
		</table>
	</div>
</div>
<%@ include file="../../../mall_bottom.jsp"%>

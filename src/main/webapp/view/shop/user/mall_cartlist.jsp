<%@page import="java.util.Vector"%>
<%@page import="java.text.ParseException"%>
<%@page import="shop.ProductBean"%>
<%@page import="shop.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
  @import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@700&family=Poppins:wght@500&display=swap');
	.photo{
		margin-left: 300px;
		margin-right: 30px;
	}
	table{
		margin-top: 30px;
		font-family: 'IBM Plex Sans KR', sans-serif;
		font-family: 'Poppins', sans-serif;
	}
	.top_font{
		font-size: 30px;
		margin-bottom: 10px;
	}
	.price_font{
		font-size: 25px;
		margin-bottom: 10px;
	}
	.line{
		border-bottom: 1px solid #F4F4F4;
		font-size: 13px;
		color: gray;
	}
	.sub_btn, .add_btn{
		background: white;
		width: 50px;
		height: 30px;
		border: 1px solid black;
		cursor: pointer;
	}
	.font-sty{
		font-size: 15px;
		margin-top: 30px;
		
	}
	.pay_btn {
		color: white;
		font-weight: bold;
		height: 70px;
		width: 300px;
		margin-top: 30px;
		cursor: pointer;
		font-size: 13px;
	}
</style>

<%
    int pnum = (int)session.getAttribute("pnum");
    ProductDao pdao = ProductDao.getInstance(); 
    String imgPath = request.getContextPath()+"/view/images/";
%>

<script type="text/javascript" src="../../../js/jquery.js"></script> 
<script type="text/javascript">
$(document).ready(function(){
    $('.pay_btn').click(function(pnum){
        alert("결제성공");
        location.href = 'mall_calculate.jsp';
    });

    // 페이지 로드시 초기 계산
    updatePriceAndDiscount();
});

function updatePriceAndDiscount() {
    var totalDiscount = 0;
    var total = 0;

    $('.price').each(function(index) {
        var count = parseInt($(this).closest('tr').find('.count').val());
        var originalPrice = parseInt($(this).attr('data-original-price'));
        var newPrice = Math.round((originalPrice * 0.22) * count);
        var newPrice2 = Math.round((originalPrice * 0.78) * count); 
        total += ((originalPrice*count) - newPrice);

        $(this).text('₩' + numberWithCommas(newPrice2)); 

        totalDiscount += newPrice;
    });

    var move = 3000;
    var payAmount = total + move;
    $('.discount').text('₩' + numberWithCommas(totalDiscount));
    $('.totalprice').text('₩' + numberWithCommas(total + totalDiscount)); 
    $('.payAmount').text('₩' + numberWithCommas(payAmount)); 
}

function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

</script>

<jsp:useBean id="mallCart" class="shop.CartBean" scope="session"/>
<%
    Vector<ProductBean> clist = mallCart.getAllProducts();
    int totalprice = 0;
    int discount = 0;
    int move = 3000;
    int totalDiscountBefore = 0;
    int totalBefore = 0;
%>

<%@ include file="main_mall_top.jsp"%>  
    <div>
        <h2 style="text-align: center; margin-top: 40px; margin-bottom: 80px;">장바구니</h2>
    </div>
    <hr style="width: 550px; margin-left: 450px;">
    <div style="display: flex;">
    <form name="f" method="post">
        <table style="width: 600; height: 100; margin-left: 450px;">
        <%
            if(clist.size() == 0){
        %>
            <tr>
                <td colspan=6 align=center>
                    <p>선택한 상품이 없습니다.</p>
                </td>
            </tr>
    <%          
        }else{
            for(int i = 0 ; i<clist.size();i++){
            	ProductBean pb = clist.get(i);
                int salePriceBefore = (int) ((pb.getPrice()  - (pb.getPrice() * 0.22)) * pb.getCount());
                totalBefore += salePriceBefore;
                totalDiscountBefore += (pb.getPrice() - (pb.getPrice() * 0.22)) * pb.getCount();
    %>              
        <tr>
            <td style="margin-left: 300px;"><img src = "<%=imgPath + pb.getProimg()%>" width="100" height="100"></td>
            <td class="font-sty"width="100px;" style="margin-top: 30px;">
                <%=pb.getPname() %><br>
            </td>
            <td>
			    <input type="text" name="count" class="count" value="<%=pb.getCount() %>" size="1" style="height: 30px; text-align: center;">
			개</td>
            <td class="price" data-original-price="<%=pb.getPrice()%>">
                ₩<%=salePriceBefore%>
                <%
                    totalprice += pb.getPrice(); 
                    discount += (pb.getPrice() - (pb.getPrice()*0.22));
                %>
            </td>
            <td>
                <a style="color: gray; text-decoration: none; margin-top: 40px; margin-left: 20px; margin-right: 50px;" href = "mall_cartDel.jsp?pnum=<%=pb.getPnum()%>">X</a>
            </td>
        <%
            } // for 루프 끝
        } // else 끝
        %>
    </table>
    </form>
        <table style="width: 200px; height: 300px; background: #FAFAFA; border: #F2F2F2;">
            <tr>
                 <td>상품금액</td>
                <td class="totalprice" style="text-align: right;">₩<%=totalDiscountBefore%></td>
            </tr>
            <tr>
                <td>상품할인금액</td>
                <td class="discount" style="text-align: right;">₩<%=totalBefore-totalDiscountBefore%></td>
            </tr>

            <tr>
                <td>배송비</td>
                <td class="move" style="text-align: right;">₩<%=move%></td>
            </tr>
            <tr>
                <td>결제예정금액</td>
                <td class="payAmount" style="text-align: right;">₩<%=discount+move%></td>
            </tr>
            <tr>
                <td align="center" colspan="2">
                    <button class="pay_btn" style="background: #5F0080; width: 250px;">결제하기</button>
                </td>
        </table>
</div>
<%@ include file="../../../mall_bottom.jsp"%>

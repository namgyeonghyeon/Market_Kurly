<%@page import="java.text.ParseException"%>
<%@page import="shop.ProductBean"%>
<%@page import="shop.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
  @import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@700&family=Poppins:wght@500&display=swap');
	.photo{
		width: 420; 
		height: 520;
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
	.gocart{
		color: white;
		font-weight: bold;
		height: 60px;
		width: 390px;
		background-color: #5F0080;
		margin-top: 30px;
		margin-right: 250px;
	}
	.pad{
		margin-top: 10px;
	}
</style>
<%
	int pnum = Integer.parseInt(request.getParameter("pnum"));
	session.setAttribute("pnum", pnum);
	ProductDao pdao = ProductDao.getInstance(); 
	ProductBean pb = pdao.selectProdpNum(pnum);
	String imgPath = request.getContextPath()+"/view/images/";
	String salePrice = String.format("%.0f", pb.getPrice() - (pb.getPrice() * 0.22));
%>
<script type="text/javascript" src="../../../js/jquery.js"></script> 
<script type="text/javascript">
    function numberWithCommas(x) {
        return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }

    function updatePriceAndDiscount() {
        var totalDiscount = 0;
        var total = 0;

        $('.price').each(function(index) {
            var count = parseInt($(this).closest('tr').find('.count').val());
            var originalPrice = parseInt($(this).attr('data-original-price'));
            var newPrice = Math.round((originalPrice * 0.22) * count); // 소수점 방지
            var newPrice2 = Math.round((originalPrice * 0.78) * count); // 소수점 방지
            total += ((originalPrice*count) - newPrice);

            $(this).text('₩' + numberWithCommas(newPrice2)); // 함수 호출로 수정

            totalDiscount += newPrice;
        });

        var move = 3000;
        var payAmount = total + move;
        $('.discount').text('₩' + numberWithCommas(totalDiscount)); // 함수 호출로 수정
        $('.totalprice').text('₩' + numberWithCommas(total)); // 함수 호출로 수정
        $('.payAmount').text('₩' + numberWithCommas(payAmount)); // 함수 호출로 수정
    }

$(document).ready(function(){
    updatePriceAndDiscount();

	$('.add_btn').click(function(e){
	    e.preventDefault(); 
	    var countField = $(this).siblings('.count');
	    var count = parseInt(countField.val());
	    count++;
	    countField.val(count);

	    updatePriceAndDiscount();

	});

    $('.sub_btn').click(function(e){
        e.preventDefault(); 
        var countField = $(this).siblings('.count');
        var count = parseInt(countField.val());
        if(count > 1) {
            count--;
            countField.val(count);

            updatePriceAndDiscount();
        }
    });
	$('.gocart').click(function(pnum){
		
		ovalue = document.f.count.value;
		if(ovalue < 1 || ovalue == ""){
			alert("주문수량 누락 또는 1 이상 입력하세요");
			return;
		}
		location.href = "mall_cartAdd.jsp?pnum="+<%=pnum%>+"&ovalue="+ovalue;
		alert("장바구니에 담았습니다");
	})
});
</script>


<%@ include file="main_mall_top.jsp"%>  
	<table style="width: 100%; height: 500;">
		<tr>
			<td valign="top">
				<img class="photo" src = "<%=imgPath + pb.getProimg()%>"></td>
			<td valign="top" style=" width: 900px">
				<form name = "f" method="post">
				<a class = "top_font">[<%=pb.getPname()%>]</a><br><br>
					<%=pb.getPname() %><br>
					<a class = price_font><font color="red">22%&nbsp;</font><%=salePrice%></a>원<br>
					<a style="text-decoration:line-through; color: gray;"><%=pb.getPrice()%>원</a><br><br>
				<table style="height: 500;">
					<tr>
						<td width="120px; height= 400;" class="line">배송</td>
						<td class="line">
							<b>샛별배송</b>
							<p class="">
								23시 전 주문 시 내일 아침 7시 전 도착
								(대구·부산·울산 샛별배송 운영시간 별도 확인)
							</p>
						</td>
					</tr>
					<tr>
						<td class="line">판매자</td>
						<td class="line"><b>컬리</b></td>
					</tr>
					<tr>
						<td class="line"><p class="">냉장 (종이포장)</p></td>
						<td class="line">
							<p class=""><b>택배배송은 에코 포장이 스티로폼으로 대체됩니다.</b></p>
						</td>
					</tr>
					<tr class = "pad">
						<td class="line">판매단위</td>
						<td class="line"><b>1봉</b></td>
					</tr>
					<tr>
						<td class="line">유통기한</td>
						<td class="line"><b>신선식품으로 별도의 유통기한은 없으나 최대한 빠른 섭취 부탁드립니다</b></td>
					</tr>
					<tr class="line">
						<td>상품선택</td>
						<td>
							<table style="width: 450px; border : 1px solid #E2E2E2;">
								<tr>
									<td>
										<b><%=pb.getPname() %></b><br>
										<div style="margin-top: 50px; display: flex;">
											<button class="sub_btn">-</button>
							                <input type="text" name="count" class="count" value="1" size="1" style="height: 30px; text-align: center;">
							                <button class="add_btn">+</button>
											<a class="price" style="margin-left: 210px;" data-original-price="<%=pb.getPrice()%>"></a><br><br>
										</div>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<p style="margin-left: 410px;">총 상품금액: 
							<a class="totalprice"></a></p> 
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<button class="gocart" style="cursor: pointer;"
								onclick="gocart('<%=pb.getPnum()%>')">장바구니 담기</button>
						</td>
					</tr>
				</table>
				</form>
			<tr>
		</tr>
	</table>
<%@ include file="../../../mall_bottom.jsp"%>
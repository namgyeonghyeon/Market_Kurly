<%@page import="java.util.ArrayList"%>
<%@page import="shop.ProductBean"%>
<%@page import="shop.ProductDao"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<style>
.top_banner {
	font-size: 25px;
	display: flex;
	margin-top: 100px;
	margin-left: 700px;
	font-weight: bold;
}

.sale_text {
	font-size: 15px;
	color: gray;
	text-align: center;
	font-family: 'Sans-serif', 'gothic';
	margin-bottom: 30px;
}

.img_size {
	width: 220px;
	height: 300px;
}

li {
	list-style-type: none;
}

.slides {
	position: absolute;
	margin-top: 350px;
	left: 0;
	top: 0;
	width: 2500px;
	transition: left 0.5s ease-out;
	left: 0;
}

.slides li:first-child {
	margin-left: 200px;
}

.slides li:not(:last-child) {
	float: left;
	margin-right: 50px;
}

.slides li {
	float: left;
}

.region {
	width: 700px;
	height: 300px;
	margin: auto;
	overflow: hidden;
}
.region2 {
	width: 1000px;
	height: 300px;
	margin: auto;
	margin-left: 400px;
	overflow: hidden;
}


.leftbtn, .rightbtn {
	border: none;
	background: white;
	width: 50px;
	height: 50px;
	margin-top: 130px;
	position: absolute;
	border-radius: 50%;
	cursor: pointer;
	margin-right: 250px;
	border-color: #E2E2E2;
	border-style: solid;
}

.leftbtn {
	margin-left: 465px;
}

.rightbtn {
	margin-left: 1135px;
	margin-top: 130px;
}

.top_slide {
	width: 100%;
	height: 400;
}

.top_slide ul {
	width: 100%;
	height: 400;
	position: relative;
	margin:0; 
	padding:0;
}

.top_slide ul li {
	width: 100%;
	height: 400;
	position: absolute;
	top: 0;
}

.top_slide ul li.active {
	z-index: 1;
}
.bottom_img_size{
	width: 65%;
	height: 130px;
	margin-top: 100px;
	margin-left: 320px;
	margin-bottom: 50px;
}
.allbtn{
	width: 70px;
	height: 70px;
	background: white;
	cursor: pointer;
	margin-left: 100px;
	border-radius: 50%;
	border-color: #E2E2E2;
	border-style: solid;
}
</style>
<script type="text/javascript" src="../../../js/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		var i = -1;
		var now, next;

		setInterval(function() {
			now = $('.top_slide ul li').eq(0);
			next = $('.top_slide ul li').eq(1);
			next.addClass('active').css('opacity', 0).animate({
				'opacity' : 1
			}, 1000, function() {
				$('.top_slide ul').append(now);
				now.removeClass('active');
			})
		}, 5000);
		
		$('.rightbtn').click(function() {
			if (i == 1) {
				return;
			}
			$('#firstImage').animate({
				marginLeft : '-=675px'
			}, 1000); //애니메이션기능
			i++;
		});
		$('.leftbtn').click(function() {
			if (i == -1) {
				return;
			}
			$('#firstImage').animate({
				marginLeft : '+=675px'
			}, 1000);
			i--;
		});
	});
</script>
<%@ include file="main_mall_top.jsp"%>

<%
	ProductDao pdao = ProductDao.getInstance();
	ArrayList<ProductBean> lists = pdao.getAllProduct();   
%>

<div class="top_slide">
	<ul>
		<li class="active">
		<a href="#">
		<span style="box-sizing: border-box; display: block; overflow: hidden; width: initial; height: initial; background: none; opacity: 1; border: 0px; margin: 0px; padding: 0px; position: absolute; inset: 0px;"><img alt="메인배너" src="https://product-image.kurly.com/banner/main/pc/img/bd3cad8d-d386-4108-ba23-67061126b264.jpg" decoding="async" data-nimg="fill" class="css-0" style="position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: none; margin: auto; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%; object-fit: cover;" sizes="100vw" srcset="https://product-image.kurly.com/banner/main/pc/img/bd3cad8d-d386-4108-ba23-67061126b264.jpg 640w, https://product-image.kurly.com/banner/main/pc/img/bd3cad8d-d386-4108-ba23-67061126b264.jpg 750w, https://product-image.kurly.com/banner/main/pc/img/bd3cad8d-d386-4108-ba23-67061126b264.jpg 828w, https://product-image.kurly.com/banner/main/pc/img/bd3cad8d-d386-4108-ba23-67061126b264.jpg 1080w, https://product-image.kurly.com/banner/main/pc/img/bd3cad8d-d386-4108-ba23-67061126b264.jpg 1200w, https://product-image.kurly.com/banner/main/pc/img/bd3cad8d-d386-4108-ba23-67061126b264.jpg 1920w, https://product-image.kurly.com/banner/main/pc/img/bd3cad8d-d386-4108-ba23-67061126b264.jpg 2048w, https://product-image.kurly.com/banner/main/pc/img/bd3cad8d-d386-4108-ba23-67061126b264.jpg 3840w"></span>
		<img alt="메인배너" src="https://product-image.kurly.com/banner/main/pc/img/bd3cad8d-d386-4108-ba23-67061126b264.jpg" decoding="async" data-nimg="fill" style="position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: none; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%; object-fit: cover;" sizes="100vw" srcset="https://product-image.kurly.com/banner/main/pc/img/bd3cad8d-d386-4108-ba23-67061126b264.jpg 640w, https://product-image.kurly.com/banner/main/pc/img/bd3cad8d-d386-4108-ba23-67061126b264.jpg 750w, https://product-image.kurly.com/banner/main/pc/img/bd3cad8d-d386-4108-ba23-67061126b264.jpg 828w, https://product-image.kurly.com/banner/main/pc/img/bd3cad8d-d386-4108-ba23-67061126b264.jpg 1080w, https://product-image.kurly.com/banner/main/pc/img/bd3cad8d-d386-4108-ba23-67061126b264.jpg 1200w, https://product-image.kurly.com/banner/main/pc/img/bd3cad8d-d386-4108-ba23-67061126b264.jpg 1920w, https://product-image.kurly.com/banner/main/pc/img/bd3cad8d-d386-4108-ba23-67061126b264.jpg 2048w, https://product-image.kurly.com/banner/main/pc/img/bd3cad8d-d386-4108-ba23-67061126b264.jpg 3840w">
		</a>
		</li>
		<li>
		<a href="#">
		<span style="box-sizing: border-box; display: block; overflow: hidden; width: initial; height: initial; background: none; opacity: 1; border: 0px; margin: 0px; padding: 0px; position: absolute; inset: 0px;"><img alt="메인배너" src="https://product-image.kurly.com/banner/main/pc/img/2ce4837a-0434-4990-be06-841ce96f5c28.jpg" decoding="async" data-nimg="fill" class="css-0" style="position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: none; margin: auto; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%; object-fit: cover;" sizes="100vw" srcset="https://product-image.kurly.com/banner/main/pc/img/2ce4837a-0434-4990-be06-841ce96f5c28.jpg 640w, https://product-image.kurly.com/banner/main/pc/img/2ce4837a-0434-4990-be06-841ce96f5c28.jpg 750w, https://product-image.kurly.com/banner/main/pc/img/2ce4837a-0434-4990-be06-841ce96f5c28.jpg 828w, https://product-image.kurly.com/banner/main/pc/img/2ce4837a-0434-4990-be06-841ce96f5c28.jpg 1080w, https://product-image.kurly.com/banner/main/pc/img/2ce4837a-0434-4990-be06-841ce96f5c28.jpg 1200w, https://product-image.kurly.com/banner/main/pc/img/2ce4837a-0434-4990-be06-841ce96f5c28.jpg 1920w, https://product-image.kurly.com/banner/main/pc/img/2ce4837a-0434-4990-be06-841ce96f5c28.jpg 2048w, https://product-image.kurly.com/banner/main/pc/img/2ce4837a-0434-4990-be06-841ce96f5c28.jpg 3840w"></span>
		<img alt="메인배너" src="https://product-image.kurly.com/banner/main/pc/img/2ce4837a-0434-4990-be06-841ce96f5c28.jpg" decoding="async" data-nimg="fill" class="css-0" style="position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: none; margin: auto; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%; object-fit: cover;" sizes="100vw" srcset="https://product-image.kurly.com/banner/main/pc/img/2ce4837a-0434-4990-be06-841ce96f5c28.jpg 640w, https://product-image.kurly.com/banner/main/pc/img/2ce4837a-0434-4990-be06-841ce96f5c28.jpg 750w, https://product-image.kurly.com/banner/main/pc/img/2ce4837a-0434-4990-be06-841ce96f5c28.jpg 828w, https://product-image.kurly.com/banner/main/pc/img/2ce4837a-0434-4990-be06-841ce96f5c28.jpg 1080w, https://product-image.kurly.com/banner/main/pc/img/2ce4837a-0434-4990-be06-841ce96f5c28.jpg 1200w, https://product-image.kurly.com/banner/main/pc/img/2ce4837a-0434-4990-be06-841ce96f5c28.jpg 1920w, https://product-image.kurly.com/banner/main/pc/img/2ce4837a-0434-4990-be06-841ce96f5c28.jpg 2048w, https://product-image.kurly.com/banner/main/pc/img/2ce4837a-0434-4990-be06-841ce96f5c28.jpg 3840w">
		</a></li>
		<li><a href="#">
		<span style="box-sizing: border-box; display: block; overflow: hidden; width: initial; height: initial; background: none; opacity: 1; border: 0px; margin: 0px; padding: 0px; position: absolute; inset: 0px;"><img alt="메인배너" src="https://product-image.kurly.com/banner/main/pc/img/f8e78109-ebe9-4d2e-a1ac-af695d8490a8.png" decoding="async" data-nimg="fill" class="css-0" style="position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: none; margin: auto; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%; object-fit: cover;" sizes="100vw" srcset="https://product-image.kurly.com/banner/main/pc/img/f8e78109-ebe9-4d2e-a1ac-af695d8490a8.png 640w, https://product-image.kurly.com/banner/main/pc/img/f8e78109-ebe9-4d2e-a1ac-af695d8490a8.png 750w, https://product-image.kurly.com/banner/main/pc/img/f8e78109-ebe9-4d2e-a1ac-af695d8490a8.png 828w, https://product-image.kurly.com/banner/main/pc/img/f8e78109-ebe9-4d2e-a1ac-af695d8490a8.png 1080w, https://product-image.kurly.com/banner/main/pc/img/f8e78109-ebe9-4d2e-a1ac-af695d8490a8.png 1200w, https://product-image.kurly.com/banner/main/pc/img/f8e78109-ebe9-4d2e-a1ac-af695d8490a8.png 1920w, https://product-image.kurly.com/banner/main/pc/img/f8e78109-ebe9-4d2e-a1ac-af695d8490a8.png 2048w, https://product-image.kurly.com/banner/main/pc/img/f8e78109-ebe9-4d2e-a1ac-af695d8490a8.png 3840w"></span>
		<img alt="메인배너" src="https://product-image.kurly.com/banner/main/pc/img/f8e78109-ebe9-4d2e-a1ac-af695d8490a8.png" decoding="async" data-nimg="fill" class="css-0" style="position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: none; margin: auto; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%; object-fit: cover;" sizes="100vw" srcset="https://product-image.kurly.com/banner/main/pc/img/f8e78109-ebe9-4d2e-a1ac-af695d8490a8.png 640w, https://product-image.kurly.com/banner/main/pc/img/f8e78109-ebe9-4d2e-a1ac-af695d8490a8.png 750w, https://product-image.kurly.com/banner/main/pc/img/f8e78109-ebe9-4d2e-a1ac-af695d8490a8.png 828w, https://product-image.kurly.com/banner/main/pc/img/f8e78109-ebe9-4d2e-a1ac-af695d8490a8.png 1080w, https://product-image.kurly.com/banner/main/pc/img/f8e78109-ebe9-4d2e-a1ac-af695d8490a8.png 1200w, https://product-image.kurly.com/banner/main/pc/img/f8e78109-ebe9-4d2e-a1ac-af695d8490a8.png 1920w, https://product-image.kurly.com/banner/main/pc/img/f8e78109-ebe9-4d2e-a1ac-af695d8490a8.png 2048w, https://product-image.kurly.com/banner/main/pc/img/f8e78109-ebe9-4d2e-a1ac-af695d8490a8.png 3840w">
		</a></li>
		<li><a>
		<span style="box-sizing: border-box; display: block; overflow: hidden; width: initial; height: initial; background: none; opacity: 1; border: 0px; margin: 0px; padding: 0px; position: absolute; inset: 0px;"><img alt="메인배너" src="https://product-image.kurly.com/banner/main/pc/img/7faae919-ba1f-4063-88c6-40f44d61ce27.jpg" decoding="async" data-nimg="fill" class="css-0" style="position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: none; margin: auto; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%; object-fit: cover;" sizes="100vw" srcset="https://product-image.kurly.com/banner/main/pc/img/7faae919-ba1f-4063-88c6-40f44d61ce27.jpg 640w, https://product-image.kurly.com/banner/main/pc/img/7faae919-ba1f-4063-88c6-40f44d61ce27.jpg 750w, https://product-image.kurly.com/banner/main/pc/img/7faae919-ba1f-4063-88c6-40f44d61ce27.jpg 828w, https://product-image.kurly.com/banner/main/pc/img/7faae919-ba1f-4063-88c6-40f44d61ce27.jpg 1080w, https://product-image.kurly.com/banner/main/pc/img/7faae919-ba1f-4063-88c6-40f44d61ce27.jpg 1200w, https://product-image.kurly.com/banner/main/pc/img/7faae919-ba1f-4063-88c6-40f44d61ce27.jpg 1920w, https://product-image.kurly.com/banner/main/pc/img/7faae919-ba1f-4063-88c6-40f44d61ce27.jpg 2048w, https://product-image.kurly.com/banner/main/pc/img/7faae919-ba1f-4063-88c6-40f44d61ce27.jpg 3840w"></span>
		<img alt="메인배너" src="https://product-image.kurly.com/banner/main/pc/img/7faae919-ba1f-4063-88c6-40f44d61ce27.jpg" decoding="async" data-nimg="fill" class="css-0" style="position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: none; margin: auto; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%; object-fit: cover;" sizes="100vw" srcset="https://product-image.kurly.com/banner/main/pc/img/7faae919-ba1f-4063-88c6-40f44d61ce27.jpg 640w, https://product-image.kurly.com/banner/main/pc/img/7faae919-ba1f-4063-88c6-40f44d61ce27.jpg 750w, https://product-image.kurly.com/banner/main/pc/img/7faae919-ba1f-4063-88c6-40f44d61ce27.jpg 828w, https://product-image.kurly.com/banner/main/pc/img/7faae919-ba1f-4063-88c6-40f44d61ce27.jpg 1080w, https://product-image.kurly.com/banner/main/pc/img/7faae919-ba1f-4063-88c6-40f44d61ce27.jpg 1200w, https://product-image.kurly.com/banner/main/pc/img/7faae919-ba1f-4063-88c6-40f44d61ce27.jpg 1920w, https://product-image.kurly.com/banner/main/pc/img/7faae919-ba1f-4063-88c6-40f44d61ce27.jpg 2048w, https://product-image.kurly.com/banner/main/pc/img/7faae919-ba1f-4063-88c6-40f44d61ce27.jpg 3840w">
		</a></li>
		<li><a>
		<span style="box-sizing: border-box; display: block; overflow: hidden; width: initial; height: initial; background: none; opacity: 1; border: 0px; margin: 0px; padding: 0px; position: absolute; inset: 0px;"><img alt="메인배너" src="https://product-image.kurly.com/banner/main/pc/img/f2851cf5-5aaf-4942-9c2e-01be8f5d848f.jpg" decoding="async" data-nimg="fill" class="css-0" style="position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: none; margin: auto; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%; object-fit: cover;" sizes="100vw" srcset="https://product-image.kurly.com/banner/main/pc/img/f2851cf5-5aaf-4942-9c2e-01be8f5d848f.jpg 640w, https://product-image.kurly.com/banner/main/pc/img/f2851cf5-5aaf-4942-9c2e-01be8f5d848f.jpg 750w, https://product-image.kurly.com/banner/main/pc/img/f2851cf5-5aaf-4942-9c2e-01be8f5d848f.jpg 828w, https://product-image.kurly.com/banner/main/pc/img/f2851cf5-5aaf-4942-9c2e-01be8f5d848f.jpg 1080w, https://product-image.kurly.com/banner/main/pc/img/f2851cf5-5aaf-4942-9c2e-01be8f5d848f.jpg 1200w, https://product-image.kurly.com/banner/main/pc/img/f2851cf5-5aaf-4942-9c2e-01be8f5d848f.jpg 1920w, https://product-image.kurly.com/banner/main/pc/img/f2851cf5-5aaf-4942-9c2e-01be8f5d848f.jpg 2048w, https://product-image.kurly.com/banner/main/pc/img/f2851cf5-5aaf-4942-9c2e-01be8f5d848f.jpg 3840w"></span>
		<img alt="메인배너" src="https://product-image.kurly.com/banner/main/pc/img/f2851cf5-5aaf-4942-9c2e-01be8f5d848f.jpg" decoding="async" data-nimg="fill" class="css-0" style="position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: none; margin: auto; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%; object-fit: cover;" sizes="100vw" srcset="https://product-image.kurly.com/banner/main/pc/img/f2851cf5-5aaf-4942-9c2e-01be8f5d848f.jpg 640w, https://product-image.kurly.com/banner/main/pc/img/f2851cf5-5aaf-4942-9c2e-01be8f5d848f.jpg 750w, https://product-image.kurly.com/banner/main/pc/img/f2851cf5-5aaf-4942-9c2e-01be8f5d848f.jpg 828w, https://product-image.kurly.com/banner/main/pc/img/f2851cf5-5aaf-4942-9c2e-01be8f5d848f.jpg 1080w, https://product-image.kurly.com/banner/main/pc/img/f2851cf5-5aaf-4942-9c2e-01be8f5d848f.jpg 1200w, https://product-image.kurly.com/banner/main/pc/img/f2851cf5-5aaf-4942-9c2e-01be8f5d848f.jpg 1920w, https://product-image.kurly.com/banner/main/pc/img/f2851cf5-5aaf-4942-9c2e-01be8f5d848f.jpg 2048w, https://product-image.kurly.com/banner/main/pc/img/f2851cf5-5aaf-4942-9c2e-01be8f5d848f.jpg 3840w">
		</a></li>
		<li><a>
		<span style="box-sizing: border-box; display: block; overflow: hidden; width: initial; height: initial; background: none; opacity: 1; border: 0px; margin: 0px; padding: 0px; position: absolute; inset: 0px;"><img alt="메인배너" src="https://product-image.kurly.com/banner/main/pc/img/4c0d07a9-b730-4c95-bd87-80c7271ae942.jpg" decoding="async" data-nimg="fill" class="css-0" style="position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: none; margin: auto; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%; object-fit: cover;" sizes="100vw" srcset="https://product-image.kurly.com/banner/main/pc/img/4c0d07a9-b730-4c95-bd87-80c7271ae942.jpg 640w, https://product-image.kurly.com/banner/main/pc/img/4c0d07a9-b730-4c95-bd87-80c7271ae942.jpg 750w, https://product-image.kurly.com/banner/main/pc/img/4c0d07a9-b730-4c95-bd87-80c7271ae942.jpg 828w, https://product-image.kurly.com/banner/main/pc/img/4c0d07a9-b730-4c95-bd87-80c7271ae942.jpg 1080w, https://product-image.kurly.com/banner/main/pc/img/4c0d07a9-b730-4c95-bd87-80c7271ae942.jpg 1200w, https://product-image.kurly.com/banner/main/pc/img/4c0d07a9-b730-4c95-bd87-80c7271ae942.jpg 1920w, https://product-image.kurly.com/banner/main/pc/img/4c0d07a9-b730-4c95-bd87-80c7271ae942.jpg 2048w, https://product-image.kurly.com/banner/main/pc/img/4c0d07a9-b730-4c95-bd87-80c7271ae942.jpg 3840w"></span>
		<img alt="메인배너" src="https://product-image.kurly.com/banner/main/pc/img/4c0d07a9-b730-4c95-bd87-80c7271ae942.jpg" decoding="async" data-nimg="fill" class="css-0" style="position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: none; margin: auto; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%; object-fit: cover;" sizes="100vw" srcset="https://product-image.kurly.com/banner/main/pc/img/4c0d07a9-b730-4c95-bd87-80c7271ae942.jpg 640w, https://product-image.kurly.com/banner/main/pc/img/4c0d07a9-b730-4c95-bd87-80c7271ae942.jpg 750w, https://product-image.kurly.com/banner/main/pc/img/4c0d07a9-b730-4c95-bd87-80c7271ae942.jpg 828w, https://product-image.kurly.com/banner/main/pc/img/4c0d07a9-b730-4c95-bd87-80c7271ae942.jpg 1080w, https://product-image.kurly.com/banner/main/pc/img/4c0d07a9-b730-4c95-bd87-80c7271ae942.jpg 1200w, https://product-image.kurly.com/banner/main/pc/img/4c0d07a9-b730-4c95-bd87-80c7271ae942.jpg 1920w, https://product-image.kurly.com/banner/main/pc/img/4c0d07a9-b730-4c95-bd87-80c7271ae942.jpg 2048w, https://product-image.kurly.com/banner/main/pc/img/4c0d07a9-b730-4c95-bd87-80c7271ae942.jpg 3840w">
		</a></li>
		<li><a>
		<span style="box-sizing: border-box; display: block; overflow: hidden; width: initial; height: initial; background: none; opacity: 1; border: 0px; margin: 0px; padding: 0px; position: absolute; inset: 0px;"><img alt="메인배너" src="https://product-image.kurly.com/banner/main/pc/img/7286572d-6a7e-456e-86e2-e1badc34768a.png" decoding="async" data-nimg="fill" class="css-0" style="position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: none; margin: auto; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%; object-fit: cover;" sizes="100vw" srcset="https://product-image.kurly.com/banner/main/pc/img/7286572d-6a7e-456e-86e2-e1badc34768a.png 640w, https://product-image.kurly.com/banner/main/pc/img/7286572d-6a7e-456e-86e2-e1badc34768a.png 750w, https://product-image.kurly.com/banner/main/pc/img/7286572d-6a7e-456e-86e2-e1badc34768a.png 828w, https://product-image.kurly.com/banner/main/pc/img/7286572d-6a7e-456e-86e2-e1badc34768a.png 1080w, https://product-image.kurly.com/banner/main/pc/img/7286572d-6a7e-456e-86e2-e1badc34768a.png 1200w, https://product-image.kurly.com/banner/main/pc/img/7286572d-6a7e-456e-86e2-e1badc34768a.png 1920w, https://product-image.kurly.com/banner/main/pc/img/7286572d-6a7e-456e-86e2-e1badc34768a.png 2048w, https://product-image.kurly.com/banner/main/pc/img/7286572d-6a7e-456e-86e2-e1badc34768a.png 3840w"></span>
		<img alt="메인배너" src="https://product-image.kurly.com/banner/main/pc/img/7286572d-6a7e-456e-86e2-e1badc34768a.png" decoding="async" data-nimg="fill" class="css-0" style="position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: none; margin: auto; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%; object-fit: cover;" sizes="100vw" srcset="https://product-image.kurly.com/banner/main/pc/img/7286572d-6a7e-456e-86e2-e1badc34768a.png 640w, https://product-image.kurly.com/banner/main/pc/img/7286572d-6a7e-456e-86e2-e1badc34768a.png 750w, https://product-image.kurly.com/banner/main/pc/img/7286572d-6a7e-456e-86e2-e1badc34768a.png 828w, https://product-image.kurly.com/banner/main/pc/img/7286572d-6a7e-456e-86e2-e1badc34768a.png 1080w, https://product-image.kurly.com/banner/main/pc/img/7286572d-6a7e-456e-86e2-e1badc34768a.png 1200w, https://product-image.kurly.com/banner/main/pc/img/7286572d-6a7e-456e-86e2-e1badc34768a.png 1920w, https://product-image.kurly.com/banner/main/pc/img/7286572d-6a7e-456e-86e2-e1badc34768a.png 2048w, https://product-image.kurly.com/banner/main/pc/img/7286572d-6a7e-456e-86e2-e1badc34768a.png 3840w">
		</a></li>
		
	</ul>
</div>
<div>
	<div>
		<span class="top_banner">💜슈퍼빅세일 기획특가💜<a href="market-sales.jsp"><img
			src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMzIiIGhlaWdodD0iMzIiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CiAgICA8ZyBmaWxsPSJub25lIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiPgogICAgICAgIDxwYXRoIGQ9Ik0wIDBoMzJ2MzJIMHoiLz4KICAgICAgICA8cGF0aCBkPSJtMTAuOTUyIDIzLjM4NCAyLjA5NiAyLjE0NiAxMC4wNTUtOS44MjUtOS43MDEtMTAuMjc4LTIuMTgyIDIuMDYgNy42NzcgOC4xMzN6IiBmaWxsPSIjMzMzIiBmaWxsLXJ1bGU9Im5vbnplcm8iLz4KICAgIDwvZz4KPC9zdmc+Cg=="
			alt="더보기 아이콘"></a></span>
		<p class="sale_text">올 가을 찾아온 최대 혜택</p>
	</div>
</div>
<div>
	<button class="leftbtn">&laquo;</button>
	<button class="rightbtn">&raquo;</button>
	<div class="region">
	
	<%if(lists.size() == 0){%>
		
	<%}else{
			for(int i = 0; i < lists.size(); i++){
		ProductBean pb = lists.get(i);
		String pimage = pb.getProimg();
		String imgPath = request.getContextPath()+"/view/images/"+pimage;
	%>	
		<a href = "buy_mall.jsp?pnum=<%=pb.getPnum()%>">
			<img class="img_size" src="<%=imgPath %>" id="firstImage"> 
		</a>
	<%
		} 
	%>
		<a href = "mall_alllist.jsp">
			<img width="100px;" height="70px;" style="margin-bottom: 110px;" src="../../../img/prev.png"> 
		</a>
	<%
		} 
	%>
	</div>
<img class="bottom_img_size" src="../../../img/bottom_sale.png">
</div>
<div class ="region2">
<%if(lists.size() == 0){%>
		
	<%}else{
			for(int i = 4; i < lists.size(); i++){
		ProductBean pb = lists.get(i);
		String pimage = pb.getProimg();
		String imgPath = request.getContextPath()+"/view/images/"+pimage;
	%>	
		<a href = "buy_mall.jsp?pnum=<%=pb.getPnum()%>">
			<img class="img_size" src="<%=imgPath %>" id="firstImage"> 
		</a>
	<%
		} 
	%>
		<a href = "mall_alllist.jsp">
			<img width="100px;" height="70px;" style="margin-bottom: 110px;" src="../../../img/prev.png"> 
		</a>
	<%
		} 
	%>
</div>
<%@ include file="../../../mall_bottom.jsp"%>

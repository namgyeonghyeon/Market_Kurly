<%@page import="java.util.ArrayList"%>
<%@page import="shop.ProductBean"%>
<%@page import="shop.ProductDao"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<%@ include file="main_mall_top.jsp"%>
	<div>
		<ul style="margin-left: 260px;">
			<li style="opacity: 1; margin-top: 10px;">
				<a href="https://www.kurly.com/collections/marketsalesoct"><img src="https://product-image.kurly.com/cdn-cgi/image/quality=85,width=1050/banner/event/cb1cb6d3-e794-4aae-84c8-8bef28c42d26.jpg" alt="231026 [마켓][특가전] 할인할 때 챙기는 마트 식품전 [검색] 컵라면, 케찹, 하인즈, 마요네즈, 라면, 컵라면, 신라면, 카레, 커리, 즉석밥, 스프, 오뚜기밥, 오짬, 오징어짬뽕, 오뚜기, 농심, 짜파게티" class="css-ikn7c e188wjoh0"></a>
			</li>
			<li style="opacity: 1; margin-top: 10px;">
				<a href="https://www.kurly.com/categories/211?category=211"><img src="https://product-image.kurly.com/cdn-cgi/image/quality=85,width=1050/banner/event/3f73aae2-2c2a-41b2-a29c-c8c7ce36982e.jpg" alt="무궁무진한 페어링의 세계 전통주 &amp; 샤퀴테리 최대 10%" class="css-ikn7c e188wjoh0"></a>
			</li>
			<li style="opacity: 1; margin-top: 10px;">
				<a href="https://www.kurly.com/collections/weekly-cutlet"><img src="https://product-image.kurly.com/cdn-cgi/image/quality=85,width=1050/banner/event/a4440d9d-bd56-4d95-bc27-d1cd654494c0.jpg" alt="[돈가스&amp;햄 모음전] [검색]돈까스,돈카츠,돈가스,소시지,햄,슬라이스햄,프랑크,베이컨,바베큐,비엔나,킬바사,페퍼로니,부어스트,스팸" class="css-ikn7c e188wjoh0"></a>
			</li>
			<li style="opacity: 1; margin-top: 10px;">
				<a href="https://www.kurly.com/categories/865"><img src="https://product-image.kurly.com/cdn-cgi/image/quality=85,width=1050/banner/event/4d5c0a04-7e4d-4a18-a96a-23be3dc5f752.jpg" alt="231023 [마켓][기획전][시즌] 김장 얼리버드 [검색] 김장, 김치, 절임배추, 김장양념, 김치예약, 파김치, 배추김치, 열무김치,  배추, 수육" class="css-ikn7c e188wjoh0"></a>
			</li>
			<li style="opacity: 1; margin-top: 10px;">
				<a href="https://www.kurly.com/shop/event/kurlyEvent.php?htmid=event/2021/0903/fresh"><img src="https://product-image.kurly.com/cdn-cgi/image/quality=85,width=1050/banner/event/80b00ad6-ac3a-4005-b023-645fca0620ec.jpg" alt="210521 KF365 [검색]kf365" class="css-ikn7c e188wjoh0"></a>
			</li>
			<li style="opacity: 1; margin-top: 10px;">
				<a href="https://www.kurly.com/categories/380"><img src="https://product-image.kurly.com/cdn-cgi/image/quality=85,width=1050/banner/event/dcc44071-1ca7-4215-abbd-aca6aafdb5a3.jpg" alt="231023 [마켓][기획전] 오리온 브랜드관 [검색]오리온, 초코파이, 닥터유, 마켓오, 다이제 " class="css-ikn7c e188wjoh0"></a>
			</li>
			<li style="opacity: 1; margin-top: 10px;">
				<a href="https://www.kurly.com/categories/410?category=410"><img src="https://product-image.kurly.com/cdn-cgi/image/quality=85,width=1050/banner/event/fcd92456-1b9b-44a6-b75e-446ff4cf8617.jpg" alt="231026 [마켓][특가전] 매일유업 특가전 [검색]매일,매일유업,아기치즈" class="css-ikn7c e188wjoh0"></a>
			</li>
			<li style="opacity: 1; margin-top: 10px;">
				<a href="https://www.kurly.com/shop/event/kurlyEvent.php?htmid=event/2023/1023/daldaguri"><img src="https://product-image.kurly.com/cdn-cgi/image/quality=85,width=1050/banner/event/ddc66c32-40cd-49e5-bab5-55f5c8d6ac0f.png" alt="231023 [마켓][기획전][시즌] 달다구리 대전 [검색] 과자, 할로윈, 초콜릿, 사탕, 초코바, 버터바, 카라멜, 젤리, 파티팩" class="css-ikn7c e188wjoh0"></a>
			</li>
			<li style="opacity: 1;">
				<a href="https://www.kurly.com/shop/event/kurlyEvent.php?htmid=event/2023/1023/daldaguri"><img src="https://product-image.kurly.com/cdn-cgi/image/quality=85,width=1050/banner/event/861f5a5e-8df5-4541-82df-67f5a6a78016.jpg" alt="231023 [마켓][기획전] 달다구리 대전 " class="css-ikn7c e188wjoh0"></a>
			</li>
			<li style="opacity: 1; margin-top: 10px;">
				<a href="https://www.kurly.com/collections/sempiosale"><img src="https://product-image.kurly.com/cdn-cgi/image/quality=85,width=1050/banner/event/671ff3d0-6aeb-43b6-9039-f2ffef92ae2f.jpg" alt="231026 [마켓][특가전] 샘표 [검색] 발사믹, 연두, 조미료, 다시다, 스파게티면, 파스타면, 통조림, 간장, 양조간장, 소스, 월남쌈, 파스타소스, 파스타 소스, 커리, 카레, 스프, 수프, 라이스페이퍼, 육수, 계란간장, 토장, 드레싱, 난, 비빔장, 백년동안, 흑초" class="css-ikn7c e188wjoh0"></a>
			</li>
			<li style="opacity: 1; margin-top: 10px;">
				<a href="https://www.kurly.com/categories/609?category=609"><img src="https://product-image.kurly.com/cdn-cgi/image/quality=85,width=1050/banner/event/d024881d-4f36-419c-857c-8c53fc3242df.jpg" alt="231026 [마켓][특가전] 남양유업 특가전" class="css-ikn7c e188wjoh0"></a>
			</li>
			<li style="opacity: 1; margin-top: 10px;">
				<a href="https://www.kurly.com/collections/aaaaa1005"><img src="https://product-image.kurly.com/cdn-cgi/image/quality=85,width=1050/banner/event/a293d7e7-40f4-44ce-a78f-797585b716e5.jpg" alt="인기 밀키트 모음전, [검색]메인요리, 찌개, 한상, 낙곱새, 샤브샤브, 탕, 밀킷, 부대찌개, 식사, 한끼" class="css-ikn7c e188wjoh0"></a>
			</li>
			<li style="opacity: 1; margin-top: 10px;">
				<a href="https://www.kurly.com/categories/644?category=644"><img src="https://product-image.kurly.com/cdn-cgi/image/quality=85,width=1050/banner/event/4ca6f544-0800-4408-a36a-b65f3bfdb492.jpg" alt="231026 [마켓][특가전] 아이스크림 특가전" class="css-ikn7c e188wjoh0"></a>
			</li>
			<li style="opacity: 1; margin-top: 10px;">
				<a href="https://www.kurly.com/collections/fresh-food"><img src="https://product-image.kurly.com/cdn-cgi/image/quality=85,width=1050/banner/event/e5c52e12-86e9-415a-86a3-c74f37cc2089.jpg" alt="231026 [마켓][특가전] 브런치 데이 [검색] 브런치, 파스타, 샐러드, 샌드위치, 오프라인 맛집, 양식, 파티, 리틀넥, 팩피, 최현석, 쵸이닷, 방배동, 이누식당, 성수동, 스테이크 , 연말, 면요리, 면류, 콜린스, 다이닝" class="css-ikn7c e188wjoh0"></a>
			</li>
			<li style="opacity: 1; margin-top: 10px;">
				<a href="https://www.kurly.com/collections/zeroowzl"><img src="https://product-image.kurly.com/cdn-cgi/image/quality=85,width=1050/banner/event/6fa72f53-3828-4d28-92ee-fbecaf7d6a5f.jpg" alt="231020[마켓][기획전] 추운 겨울 방한용품 대비전 [검색]가습기,가열식가습기,미니가습기,대용량가습기,복합식가습기,전기장판카본매트,탄소매트,전기매트,온열매트,온수매트,카페트매트" class="css-ikn7c e188wjoh0"></a>
			</li>
			<li style="opacity: 1; margin-top: 10px;">
				<a href="https://www.kurly.com/categories/195"><img src="https://product-image.kurly.com/cdn-cgi/image/quality=85,width=1050/banner/event/6b1c89fe-a496-423a-b906-cd9782de51b6.jpg" alt="떡국떡 모음전 [검색]떡국떡,조랭이떡,가래떡" class="css-ikn7c e188wjoh0"></a>
			</li>
			<li style="opacity: 1; margin-top: 10px;">
				<a href="https://www.kurly.com/collections/is4dawwj"><img src="https://product-image.kurly.com/cdn-cgi/image/quality=85,width=1050/banner/event/189164f0-8af1-4e4b-9a76-39d631f23525.jpg" alt="[특가전] 프리미엄 생수 모음전 [검색]생수,탄산수,프리미엄생수,프리미엄,물,워터,수입생수,수입물,프리미엄물" class="css-ikn7c e188wjoh0"></a>
			</li>
			<li style="opacity: 1; margin-top: 10px;">
				<a href="https://www.kurly.com/collections/qdsa6wcg"><img src="https://product-image.kurly.com/cdn-cgi/image/quality=85,width=1050/banner/event/ae518950-0489-43fe-b6fe-1afc19603cc4.jpg" alt="231012 [마켓] 물가관리 신선식품 [검색]바나나,귤,배,토마토,메론,포도,아보카도,반시,홍시,블루베리,채소, 고추, 가지, 호박, 오이, 마늘, 무, 상추, 감자, 양파, 버섯, 브로콜리, 파, 파프리카, 콩나물, 상추, 당근,물가안정,물가관리,물가,과일,채소,신선,최저가,최저가도전" class="css-ikn7c e188wjoh0"></a>
			</li>
			<li style="opacity: 1; margin-top: 10px;">
				<a href="https://www.kurly.com/categories/588"><img src="https://product-image.kurly.com/cdn-cgi/image/quality=85,width=1050/banner/event/b63a0324-ff49-4c5f-9fdc-dfef5c02ba62.jpg" alt="231023 [마켓][기획전][혜택] 10월 빅프로모션 - 한우데이 [검색]한우,소고기,스테이크,일상미소,등심,차돌박이,양지,국거리,불고기용,다짐육,채끝,안심,샤브샤브용,사태,이목,녹색한우,남도우애,태우,태우한우,횡성,경주천년,경주,경주한우,횡성한우,횡성축협," class="css-ikn7c e188wjoh0"></a>
			</li>
			<li style="opacity: 1; margin-top: 10px;">
				<a href="https://www.kurly.com/categories/244"><img src="https://product-image.kurly.com/cdn-cgi/image/quality=85,width=1050/banner/event/03357814-13b0-4cfa-bec6-d60ce4054727.jpg" alt="231019 [마켓][기획전][테마] 신상맛집" class="css-ikn7c e188wjoh0"></a>
			</li>
			<li style="opacity: 1; margin-top: 10px;">
				<a href="https://www.kurly.com/collections/daesangsale"><img src="https://product-image.kurly.com/cdn-cgi/image/quality=85,width=1050/banner/event/e9c78ef7-3faa-4c36-ad15-ca36e51324d3.jpg" alt="231026 [마켓][특가전] 대상 [검색] 파스타소스, 소스, 양념, 조미료, 간장, 양념, 국간장, 조림간장, 진간장, 순창, 고추장, 드레싱, 머스타드, 카레, 곤약밥, 곤약, 맛술, 미림, 쌀엿, 조청, 까나리, 액젓, 홍초, 당면, 컵라면, 마요네즈, 케찹, 소금, 후추" class="css-ikn7c e188wjoh0"></a>
			</li>
			<li style="opacity: 1; margin-top: 10px;">
				<a href="https://www.kurly.com/categories/201"><img src="https://product-image.kurly.com/cdn-cgi/image/quality=85,width=1050/banner/event/b384477e-2637-43ae-b3b1-1629d250c183.jpg" alt="인기만점 떡 간식 모음전 [검색]떡,간식,로뎀푸드,창억,논지기,키친고메,시루조아,미자언니네,떡,인절미,콩떡,시루떡,팥떡,송편,꿀떡,찰떡,쑥떡,설기,약식" class="css-ikn7c e188wjoh0"></a>
			</li>
			<li style="opacity: 1; margin-top: 10px;">
				<a href="https://www.kurly.com/categories/760"><img src="https://product-image.kurly.com/cdn-cgi/image/quality=85,width=1050/banner/event/76d1f08d-4565-4211-ac16-e3a661cbbc81.png" alt="231023 [마켓][기획전][시즌] 달다구리 대전 [검색] 붕어빵, 간식,  약과, 스낵, 아이스크림" class="css-ikn7c e188wjoh0"></a>
			</li>
			<li style="opacity: 1; margin-top: 10px;">
				<a href="https://www.kurly.com/categories/680"><img src="https://product-image.kurly.com/cdn-cgi/image/quality=85,width=1050/banner/event/eb61a210-54fd-48a8-860f-47d8cdf3a717.jpg" alt="231019 [마켓][특가전] 넥스트키친 특가전 [검색] 베테랑, 영화루, 방방곡곡, 마마리, 리틀넥, 사리원, 아우프글렛, 다운타우너, 콜린스, 클랩피자, 샘킴, 치즈룸, 콜린스다이닝, 팩피, 성수동, 정호영, 카덴, 웍셔너리, 또보겠지, 미로식당, 금미옥, 전주, 삼진어묵, 미미옥, 친정갈비, 온하루, 홍선장, 가온, 한식, 맛집, 오프라인, 면류, 국수, 우동, 넥스트키친" class="css-ikn7c e188wjoh0"></a>
			</li>
			<li style="opacity: 1; margin-top: 10px;">
				<a href="https://www.kurly.com/collections/kimchi-all"><img src="https://product-image.kurly.com/cdn-cgi/image/quality=85,width=1050/banner/event/db03358a-4c35-4715-9569-6e9b8c8cb5d2.jpg" alt="231005 [마켓][특가전] 김치 [검색] 김치, 김장, 김장김치, 파김치, 묵은지, 열무김치, 깍두기, 석박지, 겉절이, 맛김치, 배추김치, 알타리김치, 시원한김치, CJ, 피코크, 비비고, 풀무원" class="css-ikn7c e188wjoh0"></a>
			</li>
			<li style="opacity: 1; margin-top: 10px;">
				<a href="https://www.kurly.com/categories/437?category=437"><img src="https://product-image.kurly.com/cdn-cgi/image/quality=85,width=1050/banner/event/c2f103d9-8e51-41eb-b062-e5c9a7857ee8.jpg" alt="[마켓] 모닝롤 보러가기 [검색]모닝빵,모닝롤,버터롤,샌드위치빵,버거번,모닝번,번" class="css-ikn7c e188wjoh0"></a>
			</li>
			<li style="opacity: 1; margin-top: 10px;">
				<a href="https://www.kurly.com/categories/601?category=601"><img src="https://product-image.kurly.com/cdn-cgi/image/quality=85,width=1050/banner/event/a36113c4-88d0-44f9-88fc-f7d2cc554904.jpg" alt="231005 [특가전] 요거트 [검색]요거트,요구르트,그릭,그릭요거트" class="css-ikn7c e188wjoh0"></a>
			</li>
			<li style="opacity: 1; margin-top: 10px;">
				<a href="https://www.kurly.com/categories/775?category=775"><img src="https://product-image.kurly.com/cdn-cgi/image/quality=85,width=1050/banner/event/b26e8770-231d-4d8b-8041-75737a408073.jpg" alt="231020 [마켓][특가전] 폴바셋X커피빈X아티제 연합특가전 [검색]폴바셋,커피빈,아티제,카페,크림빵,타르트,돌체라떼,콜드브루,아메리카노" class="css-ikn7c e188wjoh0"></a>
			</li>
			<li style="opacity: 1; margin-top: 10px;">
				<a href="https://www.kurly.com/collections/mandootravel1"><img src="https://product-image.kurly.com/cdn-cgi/image/quality=85,width=1050/banner/event/4196b2c3-4a65-4627-9bb1-08432dcc2c23.jpg" alt="231019[마켓][특가전]컬리 만두 순례길 [검색] 만두, 왕만두, 손만두, 교자,  찐만두, 서울만두, 명인만두, 보영만두, 창화당" class="css-ikn7c e188wjoh0"></a>
			</li>
			<li style="opacity: 1; margin-top: 10px;">
				<a href="https://www.kurly.com/categories/157"><img src="https://product-image.kurly.com/cdn-cgi/image/quality=85,width=1050/banner/event/2fa1cb43-1138-473d-b1a0-014b91d4ad8e.jpg" alt="231023 [마켓][특가전]노아베이커리" class="css-ikn7c e188wjoh0"></a>
			</li>
			<li style="opacity: 1; margin-top: 10px;">
				<a href="https://www.kurly.com/categories/383"><img src="https://product-image.kurly.com/cdn-cgi/image/quality=85,width=1050/banner/event/786dddf6-5cce-4df4-8977-fdcdcff42162.jpg" alt="231023 [마켓][기획전] 해태 브랜드관 [검색]해태, 해태제과, 오예스, 버터링, 에이스, 포키" class="css-ikn7c e188wjoh0"></a>
			</li>
		</ul>
	</div>
<%@ include file="../../../mall_bottom.jsp"%>

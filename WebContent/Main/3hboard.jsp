<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="format-detection" content="telephone=no" />
<meta name="viewport"
	content="width=device-width, user-scalable=yes, target-densitydpi=device-dpi">
<title>3H Board</title>


<!-- 아래는 서울시따릉이 로그인화면을 위해 가져온 css,js -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/login_css/style_kr_v2.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/login_css/common.css"
	type="text/css">
<link href="${pageContext.request.contextPath}/login_css/jquery-ui.css"
	rel="stylesheet" type="text/css" />

<script type="text/javascript"
	src="${pageContext.request.contextPath}/login_js/jquery-ui.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/login_js/easing/jquery.easing.1.3.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/login_js/gibberish-aes.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/login_js/jquery.simpler-sidebar.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/login_js/comm.js"></script>
<script
	src="${pageContext.request.contextPath}/login_js/jquery-1.12.4.js"></script>
<script
	src="${pageContext.request.contextPath}/login_js/jquery.responsiveTabs.js"
	type="text/javascript"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/login_js/gallery/jquery-supergallery-plugin2.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/login_js/gallery/gallery.js"></script>

<!-- 아래는 이지스퍼블리싱에서 가져온 css,js -->
<link rel="canonical" href="http://www.easyspub.co.kr/Main" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/layout_common.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/layout_main.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/jquery-ui-1.11.2.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/layout_sub.css" />

<!-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.2.min.js"></script> -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/easy_js/jquery-ui-1.11.2.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/easy_js/jquery.cookie-1.4.1.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/easy_js/common_func.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/easy_js/jquery.navgoco-0.2.1.js"></script>
<!--[if lt IE 9]>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/ie8.css" />
    <script src="${pageContext.request.contextPath}/js/html5.js"></script>
    <script src="${pageContext.request.contextPath}/js/respond.min.js"></script>
<![endif]-->

<!-- 모바일 : 메인 페이지 슬라이드 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.swiper-2.1.min.js"></script>
<style>
<
style>input[type="password"] {
	height: 24px;
	line-height: 24px;
	padding: 0 10px
}

input[type="checkbox"] {
	vertical-align: middle
}

textarea {
	border: 1px #dfdfdf solid;
}

/*라디오버튼, 체크박스 공통*/
input[type="checkbox"] {
	display: none;
}

input[type="checkbox"]+label span {
	display: inline-block;
	width: 14px;
	height: 14px;
	margin: -2px 5px 0 0;
	vertical-align: middle;
	background:
		url(${pageContext.request.contextPath}/images/check_check_sheet.png)
		left top no-repeat;
	cursor: pointer;
}

input[type="checkbox"]:checked+label span {
	background:
		url(${pageContext.request.contextPath}/images/check_check_sheet.png)
		-14px top no-repeat;
}

input[type="checkbox"]::checked+label span {
	background:
		url(${pageContext.request.contextPath}/images/check_check_sheet.png)
		-14px top no-repeat;
}

input[type="radio"] {
	display: none;
}

input[type="radio"]+label>span {
	display: inline-block;
	width: 14px;
	height: 14px;
	margin: -2px 5px 0 0;
	vertical-align: middle;
	background:
		url(${pageContext.request.contextPath}/images/check_radio_sheet.png)
		left top no-repeat;
	cursor: pointer;
	padding: 0;
}

a {
	text-decoration: none;
	cursor: pointer;
	font-weight: bold;
	color: #222;
}

input[type="radio"]:checked+label span {
	background:
		url(${pageContext.request.contextPath}/images/check_radio_sheet.png)
		-14px top no-repeat;
}

input[type="radio"]::checked+label span {
	background:
		url(${pageContext.request.contextPath}/images/check_radio_sheet.png)
		-14px top no-repeat;
}

.login_box {
	border: 1px solid #72ebc8;
	width: 230px;
	height: 230px;
	background-color: #fff;
	position: absolute;
	top: 200px;
	left: 30px;
	padding: 20px;
	box-sizing: content-box;
	float: left;
	padding: 20px;
}

.login_box .inputlogin {
	width: 100%;
	height: 45px;
	line-height: 45px;
	border-bottom: solid 1px #ccc;
	background: #fff;
	font-size: 14px;
	color: #ccc;
	text-indent: 10px;
}

.login_box input[type="password"] {
	padding: 0
}

.login_box .autologin {
	font-size: 12px;
	color: #222;
	display: inline-block;
	margin-top: 10px;
	margin-right: 5px;
	letter-spacing: -1px
}

.login_box .idpw_srch {
	font-size: 12px;
	color: #222;
	padding-left: 5px;
	margin-top: 10px;
	font-weight: normal;
	letter-spacing: -1px
}

.login_box .btn_login {
	width: 100%;
	background-color: #72ebc8;
	height: 40px;
	color: #222;
	font-size: 13px;
	font-weight: bold;
	margin: 10px 0
}

.login_box .btn_login:after {
	display: block;
	content: '';
	clear: both;
}

.login_box .nonmember {
	font-size: 12px;
	color: #222;
	font-weight: bold;
	background:
		url(${pageContext.request.contextPath}/images/ic_nomember.jpg) left
		center no-repeat;
	display: inline-block;
	line-height: 23px;
	padding: 0 10px 0 25px;
	margin-right: 8px;
	border-right: #dfdfdf 1px solid;
	letter-spacing: -0.02em
}

.login_box .foreigner {
	font-size: 12px;
	color: #222;
	font-weight: bold;
	background:
		url(${pageContext.request.contextPath}/images/ic_foreigner.jpg) left
		center no-repeat;
	line-height: 23px;
	padding-left: 25px;
	letter-spacing: -0.02em
}

.login_box .btn_join {
	display: none
}

.address {
	margin-top: 50px;
}

.tab-content {
	margin: 0 auto;
}

.login_box p {
	display: none
}

.login_box .close {
	display: none
}

.footer {
	left: 100px
}

strong, dl, dt, dd, ol, ul, li, fieldset {
	margin: 0;
	padding: 0;
	font-size: 100%;
}

fieldset {
	border: none
}

.gallery {
	width: 950px;
	position: relative;
	height: auto;
	margin: 30px auto 0 auto
}

.gallery .main {
	width: 950px;
	height: 470px;
	margin: 0 auto !important;
	display: block;
	padding-top: 0
}

.gallery .main li {
	width: 100%;
	height: 100%;
	display: none;
	background-color: #fff;
}

.gallery .main li h1 {
	font-size: 15px;
	color: #222;
	text-align: center;
	line-height: 24px;
	margin: 0 0 10px 0;
	border-top: none;
	height: auto;
}

.gallery .main li h1 p {
	font-size: 14px;
	color: #8a8a8a;
	font-weight: normal;
	padding: 0px;
	background: none;
	letter-spacing: normal
}

.gallery  .main li img {
	right: 10px;
	width: 100%;
	height: 100%;
	border: 1px solid #efefef;
}

.gallery .main li:first-child {
	display: block;
}

.gallery .main li.selected {
	z-index: 111
}

.gallery .nav {
	width: 100%;
	height: 30px;
	z-index: 1200;
	position: absolute;
	top: 50%
}

.gallery .nav div {
	width: 16px;
	height: 25px;
	text-align: center;
	cursor: pointer;
}

.gallery .nav div.nextBtn {
	float: right;
	padding-right: 10px
}

.gallery .nav div.prevBtn {
	float: left;
	padding-left: 10px
}

.gallery .thumb {
	width: 330px;
	height: 25px;
	margin: 20px auto 10px auto;
	text-align: center
}

.gallery .thumb li {
	width: 18px;
	height: 18px;
	display: inline-block;
	cursor: pointer;
	color: #fff;
	background-color: #efefef;
	border-radius: 50px;
	line-height: 18px;
	text-align: center;
	margin: 0 6px
}

.gallery .thumb li.selected {
	color: #fff;
	background-color: #ffc423;
}

.gallery .thumb li.selected:hover {
	color: #fff;
	background-color: #ffc423;
}

#gallery2 .thumbPages {
	width: 960px;
	height: 100px;
}

#gallery2 .thumbPages>li {
	width: 330px;
	height: 25px;
	display: none;
}

#gallery2 .thumbPages>li:first-child {
	display: block;
}
</style>

</style>
</head>

<body>
	<div class="wrap" id="pub">
		<!-- Gnb 영역 : s -->
		<div class="gnb_wrap">
			<div id="gnb">
				<div class="container">
					<h1>
						<a href="${pageContext.request.contextPath}/Main/main.jsp"><img
							src="${pageContext.request.contextPath}/images/logo_pub.png"
							alt="이지스퍼블리싱"></a>
					</h1>
					<!-- web 화면에서 menu :s -->
					<div class="menu_area">
						<a href="#" class="btn_close_menu ver_mobile"><img
							src="${pageContext.request.contextPath}/images/btn_close_gnb.png"
							alt="메뉴 닫기" style="width: 30px;"></a>
						<ul class="depth01">
							<li class="current"><a
								href="${pageContext.request.contextPath}/Main/main.jsp"
								id="pub001A02이지스퍼블리싱" class="btnMainLink"><img
									src="${pageContext.request.contextPath}/images/logo_pub.png"
									alt="이지스 퍼블리싱"></a>
								<div class="depth02_area">
									<ul class="depth02">
										<li><a
											href="${pageContext.request.contextPath}/Main/3hboard.jsp">사업
												소개</a></li>

										<li><a
											href="${pageContext.request.contextPath}/Main/index4.jsp">대여소
												현황</a></li>
										<li><a
											href="${pageContext.request.contextPath}/Main/notice.jsp">공지사항</a></li>
										<li><a
											href="${pageContext.request.contextPath}/cont?command=community">커뮤니티</a></li>
										<li><a
											href="${pageContext.request.contextPath}/cont?command=citizen">불편해요</a></li>

										<!-- <li><a href="${pageContext.request.contextPath}/BoardList/Citizen.jsp">불편해요</a></li>
										 -->
										<li><a
											href="${pageContext.request.contextPath}/Main/safeRule.jsp">안전수칙</a></li>


									</ul>
								</div></li>
							<li><a
								href="${pageContext.request.contextPath}/Main/main.jsp"
								id="edu002A03이지스에듀" class="btnMainLink"><img
									src="${pageContext.request.contextPath}/images/logo_pub.png"
									alt="이지스 에듀"></a>
								<div class="depth02_area none">
									<ul class="depth02">
										<li><a href="#">회사소개</a>
											<div>
												<ul class="depth03">
													<li><a href="/11_Menu/CompanyInfo/PUB">이지스퍼블리싱(주)
															소개</a></li>
													<li><a href="/11_Menu/EngCompanyInfo/PUB">About
															EasysPublishing</a></li>
													<li><a href="/11_Menu/BrandInfo2/PUB">이지스에듀 소개</a></li>
													<li><a href="/11_Menu/BookDown/PUB">도서 목록 다운로드</a></li>
													<li><a href="/12_Menu/BoardList/C100/PUB">뉴스와 홍보
															자료</a></li>
													<li><a href="/12_Menu/BoardList/C200/PUB">공지사항/이벤트</a></li>
													<li><a href="/11_Menu/Location/PUB">찾아오시는 길</a></li>
												</ul>
											</div></li>
										<li><a href="#">도서</a>
											<div>
												<ul class="depth03">
													<li><a href="/20_Menu/BookList/PUB">전체 보기</a></li>
													<li><a href="#">분야별 보기</a>
														<ul class="depth04">
															<li><a href="/20_Menu/BookList/A001/PUB">초등 수학</a></li>
															<li><a href="/20_Menu/BookList/A002/PUB">초등 영어</a></li>
															<li><a href="/20_Menu/BookList/A007/PUB">초등 한자</a></li>
															<li><a href="/20_Menu/BookList/A003/PUB">중등 수학</a></li>
															<li><a href="/20_Menu/BookList/A008/PUB">중등 영어</a></li>
															<li><a href="/20_Menu/BookList/A004/PUB">자녀교육,
																	기타</a></li>
														</ul></li>
													<li><a href="#">시리즈 보기</a>
														<ul class="depth04">
															<li><a href="/20_Menu/BookList/B003/PUB">바빠 연산법</a></li>
															<li><a href="/20_Menu/BookList/B011/PUB">바빠 중학
																	수학</a></li>
															<li><a href="/20_Menu/BookList/B004/PUB">바빠 영어</a></li>
															<li><a href="/20_Menu/BookList/B012/PUB">바빠 급수
																	한자</a></li>
															<li><a href="/20_Menu/BookList/B005/PUB">우리집은
																	놀이터</a></li>
															<li><a href="/20_Menu/BookList/B009/PUB">에듀_기타</a></li>
															<li><a href="/20_Menu/BookList/B013/PUB">나 혼자
																	푼다!</a></li>
														</ul></li>
													<li><a href="/20_Menu/BookList/C000/PUB">전자책 보기</a></li>
													<li><a href="#" id="pub001A02이지스퍼블리싱"
														class="btBookLink">이지스퍼블리싱 도서 보기</a></li>
												</ul>
											</div></li>
										<li><a href="/30_Menu/DataList/PUB">자료실</a></li>


										<li class="last"><a
											href="${pageContext.request.contextPath}/BoardList/citizenOpinionList.jsp">불편해요</a></li>


										<li class="last short_cut_cafe"><a
											href="http://blog.naver.com/easyspub" target="_blank">바빠
												아지트</a></li>
										<li class="last short_cut_cafe"><a
											href="http://cafe.naver.com/easyispub" target="_blank">네이버
												카페</a></li>
									</ul>
								</div></li>
						</ul>
					</div>
					<!-- web 화면에서 menu : e -->

					<!-- web 화면에서 로그인 : s -->
					<div class="form_area">
						<p class="ver_web">
							<c:if test="${empty sessionScope.sid}">
								<input type="button" name="WebLogin" value="로그인" title="로그인"
									class="btnTopLogin" />
							</c:if>
							<c:if test="${not empty sessionScope.sid}">
								<span
									style="line-height: 1em; margin: 0 8px; color: #cdcdcd; background-color: transparent; font-weight: 500;">${sid}님
									환영합니다.</span>
								<a href="${pageContext.request.contextPath}/cont?command=logout">
									<span
									style="line-height: 1em; margin: 0 8px; color: #cdcdcd; background-color: transparent; font-weight: 500;">로그아웃</span>
								</a>
							</c:if>
							| <input type="button" name="WebJoin" value="회원가입" title="회원가입"
								class="btnTopJoin" />
						</p>
						<p class="search_area ver_web">
							<input type="text" id="TotalKeyword1" name="TotalKeyword1"
								class="inputbox_none btnTotalKeyword" value="킥보드, 지역 등 검색"
								onfocus="this.value='';"
								onblur="if(this.value=='') this.value='킥보드, 지역 등 검색';" /> <a
								href="#TOTALSEARCH" class="btnTotalSearch1">도서검색</a>
						</p>
					</div>

					<p class="gnb_menu ver_mobile">
						<a href="#Menu" class="btn_open_menu"><img
							src="${pageContext.request.contextPath}/images/mobile/ico_menu.png"
							alt="메뉴열기"></a> <a href="#Search" class="btn_search"><img
							src="${pageContext.request.contextPath}/images/mobile/ico_search.png"
							alt="도서검색"></a>
					</p>
					<!-- web 화면에서 로그인 : e -->
				</div>
			</div>
		</div>
		<!-- gnb 영역 : e -->

		<!-- 컨텐츠 영역 : s -->
		<div class="gnb_wrap_search none">
			<div class="search_area ver_mobile">
				<div>
					<input type="text" id="TotalKeyword2" name="TotalKeyword2"
						class="inputbox_none btnTotalKeyword"
						title="제조사 &quot; 3H Board &quot;의 킥보드만 검색이 가능합니다."
						value="킥보드, 지역 등 검색" onfocus="this.value='';"
						onblur="if(this.value=='') this.value='킥보드, 지역 등 검색';" />
				</div>
				<a href="#TOTALSEARCH" class="btnTotalSearch2 btn btnBlack btnS">검색</a>
			</div>
		</div>
		<!-- 컨텐츠 영역 : e -->

		<form method="post" id="frmTotalSearch" name="frmTotalSearch"
			action="/71_Menu/SearchList/PUB" onsubmit="return true;">
			<input type="hidden" id="TotalPage" name="TotalPage" value="1" /> <input
				type="hidden" id="TotalPageType" name="TotalPageType" value="" /> <input
				type="hidden" id="TotalKeyword" name="TotalKeyword" value="" />
		</form>

		<script type="text/javascript">
			$(document)
					.ready(
							function() {
								$(".depth02_area>ul").navgoco({
									accordion : true
								});

								$('.btnTopLogin')
										.click(
												function(e) {
													window.location = "${pageContext.request.contextPath}/RegisterStep/loginForm.jsp";
												});
								$('.btnTopJoin')
										.click(
												function(e) {
													window.location = "${pageContext.request.contextPath}/RegisterStep/MemberRegister01.jsp";
												});

								$('.btn_search').click(function(e) {
									$('.gnb_wrap_search').toggle();
									$('.gnb_wrap_search').removeClass('none');
								});

								$('.btnTotalSearch1')
										.click(
												function(e) {
													if ($('#TotalKeyword1')
															.val() == ""
															|| $(
																	'#TotalKeyword1')
																	.val() == "도서명, 저자 등 검색") {
														alert("검색어를 입력하세요.");
														$('#TotalKeyword1')
																.focus();
														return;
													} else {
														if ($('#TotalKeyword1')
																.val() == "도서명, 저자 등 검색")
															$('#TotalKeyword1')
																	.val("");

														$('#TotalPage').val(1);
														$('#TotalPageType')
																.val("");
														$('#TotalKeyword')
																.val(
																		$(
																				'#TotalKeyword1')
																				.val());

														var keyWord = document
																.getElementById('TotalKeyword1').value;

														var url = '${pageContext.request.contextPath}/cont?command=search&keyWord='
																+ encodeURIComponent(keyWord);

														$('#frmTotalSearch')
																.attr('action',
																		url)
																.submit();
													}
												});
								$('.btnTotalSearch2')
										.click(
												function(e) {
													if ($('#TotalKeyword2')
															.val() == ""
															|| $(
																	'#TotalKeyword2')
																	.val() == "도서명, 저자 등 검색") {
														alert("검색어를 입력하세요.");
														$('#TotalKeyword2')
																.focus();
														return;
													} else {
														if ($('#TotalKeyword2')
																.val() == "도서명, 저자 등 검색")
															$('#TotalKeyword2')
																	.val("");

														$('#TotalPage').val(1);
														$('#TotalPageType')
																.val("");
														$('#TotalKeyword')
																.val(
																		$(
																				'#TotalKeyword2')
																				.val());
														$('#frmTotalSearch')
																.attr('action',
																		'/71_Menu/SearchList/PUB')
																.submit();
													}
												});
								$('.btnTotalKeyword')
										.keyup(
												function(e) {
													if (e.keyCode == 13) {
														if ($(this).val() == "") {
															alert("검색어를 입력하세요.");
															$(this).focus();
															return false;
														} else {
															if ($(this).val() == "도서명, 저자 등 검색")
																$(this).val("");

															$('#TotalPage')
																	.val(1);
															$('#TotalPageType')
																	.val("");
															$('#TotalKeyword')
																	.val(
																			$(
																					this)
																					.val());
															var keyWord = document
																	.getElementById('TotalKeyword1').value;

															var url = '${pageContext.request.contextPath}/cont?command=search&keyWord='
																	+ encodeURIComponent(keyWord);

															$('#frmTotalSearch')
																	.attr(
																			'action',
																			url)
																	.submit();
														}
													}
												});

								$('.btnMainLink').click(function(e) {
									var sBrandCode = $(this).attr('id');
									var sBrandUrl = sBrandCode.substring(0, 3);
									$.cookie('BrandCode', sBrandCode, {
										expires : 365,
										path : '/'
									});

									window.location = "/Main/" + sBrandUrl;
								});
								$('.btBookLink')
										.click(
												function(e) {
													var sBrandCode = $(this)
															.attr('id');
													var sBrandUrl = sBrandCode
															.substring(0, 3);
													$.cookie('BrandCode',
															sBrandCode, {
																expires : 365,
																path : '/'
															});

													window.location = "/20_Menu/BookList/"
															+ sBrandUrl;
												});
							});
		</script>
		<!-- Gnb 영역 : e -->

		<!-- 컨텐츠 영역 : s -->

		<div class="contents_wrap" id="main_wrap">
			<div class="menu_loacation">
				<div class="container">
					<a href="${pageContext.request.contextPath}/Main/main.jsp" class="home" title="메인페이지로 이동"></a> 
					<span class="depth pointer" onclick="#';">사업소개</span>
				</div>
			</div>
			<!--  <div class="login_box">
				<form name="loginForm" action="/j_spring_security_check"
					method="POST">
					<fieldset>
						<legend>로그인</legend>
						<a href="" class="close"></a>
						<p>로그인 후 자전거 대여하실 수 있습니다.</p>
						<div>
							<input class="inputlogin" onkeypress="" name="j_username"
								id="j_username" value="" size="18" maxlength="" tabindex=""
								placeholder="아이디">
						</div>
						<div>
							<input class="inputlogin" onkeypress="" name="j_password"
								id="j_password" value="" type="password" size="" maxlength=""
								tabindex="" placeholder="비밀번호">
						</div>
						<div class="autologin">
							<input type="checkbox" name="loginchk" id="logchk" title="자동로그인"
								value="true"><label for="logchk"><span></span>자동로그인</label>
						</div>
						<a href="/memberIdFind.do" class="idpw_srch">아이디</a>/<a
							href="memberPwFind.do" class="idpw_srch">비밀번호찾기</a>
						<div class="loginbtn">
							<input class="btn_login" type="submit" title="로그인" alt="로그인"
								tabindex="" value="로그인" id="loginBtn"> <input
								class="btn_join" type="submit" title="회원가입" alt="회원가입"
								tabindex="" value="회원가입" id="joinBtn">
						</div>
						<a href="https://www.bikeseoul.com:447/main.do?lang=ko"
							class="nonmember">비회원<img src="images/arrow_login.jpg" alt=""></a>
						<a href="https://www.bikeseoul.com:447/main.do?lang=en"
							class="foreigner">foreigner<img src="images/arrow_login.jpg"
							alt=""></a> <input type="hidden" id="ostype" name="appOsType"
							value="web"> <input type="hidden" id="usrDeviceId"
							name="usrDeviceId">
					</fieldset>
				</form>
			</div>-->

			<!-- 3hboard : s -->
			<div id="book_list_area">
				<div id="tab-1" class="tab-content current">
					<div id="gallery" class="gallery">
						<div class="thumbHolder">
							<ul class="thumb">
								<li class="thumbBtn">1</li>
								<li class="thumbBtn">2</li>
								<li class="thumbBtn">3</li>
								<li class="thumbBtn">4</li>
						</div>

						<div class="mainHolder">
							<ul class="main">
								<li>
									<h1></h1> <img
									src="${pageContext.request.contextPath}/images/board1.png"
									alt="">
								</li>
								<li>
									<h1></h1> <img
									src="${pageContext.request.contextPath}/images/board2.png"
									alt="">
								</li>
								<li>
									<h1></h1> <img
									src="${pageContext.request.contextPath}/images/board3.png"
									alt="">
								</li>
								<li>
									<h1></h1> <img
									src="${pageContext.request.contextPath}/images/board4.png"
									alt="">
								</li>

							</ul>

							<div class="nav">
								<div class="prevBtn">
									<img src="../images/prevBtn.jpg" alt="">
								</div>
								<div class="nextBtn">
									<img src="../images/nextBtn.jpg" alt="">
								</div>
							</div>
						</div>
					</div>
				</div>

				<ul class="slider_paging">
					<!--
				<li class="current"></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				-->
				</ul>
			</div>
			<!-- slider book list : e -->

			<!-- 바로가기 메뉴 : s -->
			<div id="short_cut_cnt">
				<div class="container">
					<ul>
						<li><a href="/72_Menu/BoardWrite/PUB"><img
								src="${pageContext.request.contextPath}/images/ico_sample.png"
								alt=""><span><em>안전 유의 사항</em> <b> 안전모 / 보호구 대여
								</b></span></a></li>
						<li><a href="http://cafe.naver.com/doitstudyroom"
							target="_blank"><img
								src="${pageContext.request.contextPath}/images/ico_cafe.png"
								alt=""><span><em>킥보드 카페</em> <b>DO IT!
										Kickboard</b></span></a></li>
					</ul>
				</div>
			</div>
			<!-- 바로가기 메뉴 : e -->

			<!-- SNS & borad : s -->
			<div id="bottom_content" class="container">

				<!-- board Area : s -->
				<div class="board_area">
					<h2>공지사항/이벤트</h2>
					<ul>
						<li><a href="#view" class="btnBoardView" seq="531"> <em
								class="badge badgeS badge_203">마감</em> [체험단 모집] 사오미 킥보드 체험단
						</a> <span class="date">2018.07.23</span></li>
						<li><a href="#view" class="btnBoardView" seq="528"> <em
								class="badge badgeS badge_201">공지</em> 킥보드 유저를 찾습니다.
						</a> <span class="date">2018.07.16</span></li>
						<li><a href="#view" class="btnBoardView" seq="527"> <em
								class="badge badgeS badge_202">이벤트</em> [무료 킥보드] 킥보드 나눔해요!
						</a> <span class="date">2018.07.05</span></li>

					</ul>
					<a href="/12_Menu/BoardList/C200/PUB" class="btn_more"><img
						src="${pageContext.request.contextPath}/images/btn_more.png"
						alt="공지사항 및 이벤트 더보기"></a>
				</div>
				<!-- board Area : e -->

				<!-- SNS Area : s -->
				<div class="sns_area">
					<ul>
						<li class="face"><a href="https://www.facebook.com/easyspub"
							title="페이스북" target="_blank"></a></li>
						<li class="twitter"><a href="https://twitter.com/easyspub"
							title="트위터" target="_blank"></a></li>
						<li class="cafe"><a
							href="http://cafe.naver.com/doitstudyroom" title="Do it! 스터디룸 카페"
							target="_blank"></a></li>
					</ul>

					<div class="textwidget">
						<iframe src="${pageContext.request.contextPath}/images/shin.jpg"
							scrolling="no" frameborder="0"
							style="border: none; overflow: hidden; width: 100%; height: 230px;"
							allowtransparency="true"></iframe>
					</div>
				</div>
				<!-- SNS Area : e -->
			</div>
			<!-- SNS & borad : e -->

		</div>
		<!-- 컨텐츠 영역 : e -->

		<!-- footer : s -->
		<div id="footer">
			<div class="footer_menu">
				<div class="container">
					<ul>
						<li><a href="/11_Menu/Location/PUB">찾아오시는 길</a></li>
						<li><a href="/73_Menu/Privacy/PUB">개인정보취급방침</a></li>
						<li><a href="/73_Menu/Agreement/PUB">이용약관</a></li>
					</ul>
					<div class="short_cut_ftr">
						<a href="/73_Menu/WriterApply/PUB">가맹점 신청</a>
						</li> <a
							href="https://docs.google.com/forms/d/e/1FAIpQLSc5ybZjSZqnV4ioXjSaIwKLjByN5mS01qByW33J3gtYdI3avA/viewform">수리문의</a>
						<a href="/72_Menu/BoardWrite/PUB">킥보드샘플 요청</a>
						</li>
					</div>
				</div>
			</div>

			<div class="copyrights_area">
				<div class="container" style="display: inline;">

					<div class="address"
						style="display: inline-block; margin-top: 20px; margin-left: 350px">
						<span>서울특별시 강남구 언주로 508 10~17층(역삼동, 서울상록빌딩)</span> <br
							class="none_br"> <span>TEL (02)325-1722</span> <span>FAX
							(02)326-1723</span><br> <span>사업자등록번호 105-87-44487</span> <span>대표자
							: 신혜영 / <br class="none_br">Email : <a
							href="mailto:easy@easyspub.co.kr">easy@3hboard.co.kr</a>
						</span><br> <span>Copyright(c)2018 3H보드㈜ 3H Board Co., Ltd.
							All Rights Reserved</span>
					</div>
					<img src="/WebProject/images/logo_footer.png" alt="logo">
				</div>
			</div>
		</div>
		<a class = "btnGoTop" title="goTop" style="display:block;">
			<img src="${pageContext.request.contextPath}/images/btn_top.png">
		</a>
		<!-- mobile 화면에서 로그인 -->
		<p class="btm_btn_area ver_mobile">
			<input type="button" name="MobileLogin" value="로그인" title="로그인"
				class="btn btnTopLogin" /> | <input type="button" name="MobileJoin"
				value="회원가입" title="회원가입" class="btn btnTopJoin" /> <input
				type="button" name="" id="edu002A03이지스에듀" value="이지스에듀"
				title="이지스에듀" class="btn btn_short_cut btnMainLink" />
		</p>
		<!-- mobile 화면에서 로그인// -->
	</div>
	<img src="/82_Menu/MemberStatOK" alt="" width="0" height="0" />

	<!-- 이전 코드 <script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-116139153-1', 'auto');
  ga('send', 'pageview');
</script> -->

	<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async
		src="https://www.googletagmanager.com/gtag/js?id=UA-116139153-1"></script>
	<script>
		window.dataLayer = window.dataLayer || [];
		function gtag() {
			dataLayer.push(arguments);
		}
		gtag('js', new Date());

		gtag('config', 'UA-116139153-1');
	</script>
	<!-- footer : e -->
	</div>
	<form method="post" id="frmSearch" name="frmSearch"
		action="/20_Menu/BookList/PUB" onsubmit="return true;">
		<input type="hidden" id="BOOK_IDX" name="BOOK_IDX" value="" /> <input
			type="hidden" id="page" name="page" value="1" /> <input
			type="hidden" id="ShKeyfield" name="ShKeyfield" value="" /> <input
			type="hidden" id="ShKeyword" name="ShKeyword" value="" /> <input
			type="hidden" id="ShMaxpage" name="ShMaxpage" value="" /> <input
			type="hidden" id="ShOrderby" name="ShOrderby" value="" />
	</form>
	<script type="text/javascript">
		// slider book list
		$(document)
				.ready(
						function() {
							resizeContent();
							var cnt = 0;
							var loopcnt = $('.selbook').find('li').size() - 1;
							$('.arrow_left').click(
									function() {
										$('.selbook').find('li').eq(0).before(
												$('.selbook').find(
														'>li:last-child'));
									});
							$('.arrow_right').click(
									function() {
										$('.selbook').append(
												$('.selbook').find(
														'>li:first-child'));
									});
							$('.BtnPageView').click(
									function(e) {
										$('#BOOK_IDX').val(
												$(this).attr('alt').replace(
														"V", ""));
										$('#frmSearch').attr(
												'action',
												'/20_Menu/BookView/'
														+ $(this).attr('alt')
																.replace("V",
																		"")
														+ '/PUB').submit();
									});

							//lert($('.movie_area').find('iframe').length);
							var movieCnt = $('.movie_area').find('iframe').length;
							if (0 < movieCnt) {
								$('.movie_area').find('iframe').attr("width",
										"240").attr("height", "197");
							}

							$('.btnBoardView')
									.click(
											function() {
												document.location.href = '/12_Menu/BoardView/C200/'
														+ $(this).attr('seq')
														+ '/PUB';
											});
						});
		$(window).resize(function() {
			resizeContent();
		});

		function resizeContent() {
			var sliderWidth = $('.main_book_list ul').width();
			$('.main_book_list ul').css({
				'width' : (sliderWidth) + 'px'
			});
			$('.main_book_list ul').css({
				'margin-left' : -(sliderWidth / 2) + 'px'
			});
		}

		function getCookie(name) {
			var nameOfCookie = name + "=";
			var x = 0;
			while (x <= document.cookie.length) {
				var y = (x + nameOfCookie.length);
				if (document.cookie.substring(x, y) == nameOfCookie) {
					if ((endOfCookie = document.cookie.indexOf(";", y)) == -1)
						endOfCookie = document.cookie.length;
					return unescape(document.cookie.substring(y, endOfCookie));
				}
				x = document.cookie.indexOf(" ", x) + 1;
				if (x == 0)
					break;
			}
			return "";
		}
	</script>

</body>
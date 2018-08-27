<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${empty sessionScope.sid}">
	<c:set var="dog" value="noLogin" />
</c:if>
<c:if test="${not empty sessionScope.sid}">
	<c:set var="dog" value="${sid}" />
</c:if>
<%
	String sessionId = (String) pageContext.getAttribute("dog");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="format-detection" content="telephone=no" />
<meta name="viewport"
	content="width=device-width, user-scalable=yes, target-densitydpi=device-dpi">
<title>3H Board</title>
<meta property="og:title" content="사람을 구체적으로 도와주는 책, 이지스퍼블리싱(주)" />
<meta property="og:url" content="http://www.easyspub.co.kr/Main" />
<meta property="og:image"
	content="http://www.easyspub.co.kr${pageContext.request.contextPath}/images/logo_map.jpg" />
<meta property="og:description" content="사람을 구체적으로 도와주는 책, 이지스퍼블리싱(주)" />

<!-- 아래는 이지스퍼블리싱에서 가져온 css,js -->
<link rel="canonical" href="http://www.easyspub.co.kr/Main" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/layout_common.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/layout_main.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/layout_sub.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/jquery-ui-1.11.2.css" />


<script type="text/javascript"
	src="${pageContext.request.contextPath}/easy_js/jquery-1.11.2.min.js"></script>
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

										<li><a href="${pageContext.request.contextPath}/Main/index4.jsp">대여소 현황</a></li>
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
																+ encodeURIComponent(keyWord)+'&search_id=<%=sessionId%>';
														
														alert(url);
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
																+ encodeURIComponent(keyWord)+'&search_id=<%=sessionId%>';

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

		<!-- 컨텐츠 영역 : s -->
		<div id="contents_wrap">
			<div class="menu_loacation">
				<div class="container">
					<a href="${pageContext.request.contextPath}/Main/main.jsp" class="home" title="메인페이지로 이동"></a> <span
						class="depth pointer"
						>공지사항/이벤트</span>
				
				</div>
			</div>

			<div class="contents" id="board_view_wrap">
				<div class="container">
					<h2>공지사항/이벤트</h2>

					<div class="cnt_wrap">
						<!-- view_detail : s -->
						<form method="post" id="frmView" name="frmView" action=""
							onSubmit="return true;">
							<input type="hidden" name="page" id="page" value="1" /> <input
								type="hidden" name="board_idx" id="board_idx" value="523" /> <input
								type="hidden" name="file_seq" id="file_seq" value="" /> <input
								type="hidden" name="sh_keyfield" id="sh_keyfield" value="ALL" />
							<input type="hidden" name="sh_keyword" id="sh_keyword" value="" />
							<div class="view_detail">
								<div class="title_area">
									<div class="title">
										<em class="badge badgeM badge_203">마감</em>
										<h3 id="BOARD_TITLE">[체험단 모집] 사오미 킥보드 일주일 이용 체험단 모집</h3>
										<span id="BOARD_COMMENT" class="none"> 사오미 킥보드 일주일 이용
											체험단을 모집합니다.! :)&nbsp;킥보드 자세히 보러가기&nbsp;&nbsp;● 기한 :&nbsp;7월
											4일(수) ~ 7월 10일(화)● 인원 :&nbsp;​</span> <span id="BOARD_PAGEURL"
											class="none">http://www.easyspub.co.kr/12_Menu/BoardView/C200/523/PUB</span>
										<span id="BOARD_IMGURL" class="none">/images/logo_l_pub.png</span>
										<!--
																								<span class="btn badgeS btnRed ver_web_inline">마감</span>
																								-->
									</div>

									<div class="info">

										<span class="event_period">이벤트 기간 : 2018.07.04 ~
											2018.07.10 </span> <span>등록일 : 2018.07.04</span> <span>조회수 :
											36</span>
									</div>

									<div class="sns_area">
										<ul>
											<li class="ver_mobile"><a href="#" id="KakaoTalk"
												class="BtnSNSLink"><img
													src="${pageContext.request.contextPath}/images/btn_sns_s_kakao.png"
													alt="카카오톡"></a></li>
											<li><a href="#" id="FaceBook" class="BtnSNSLink"><img
													src="${pageContext.request.contextPath}/images/btn_sns_s_face.png"
													alt="페이스북"></a></li>
											<li><a href="#" id="Twitter" class="BtnSNSLink"><img
													src="${pageContext.request.contextPath}/images/btn_sns_s_twitter.png"
													alt="트위터"></a></li>
											<!--
									<li><a href="#" id="NaverCafe"><img src="/images/btn_sns_s_cafe.png" alt="카페"></a></li>-->
										</ul>
									</div>
								</div>

								<div class="cnt_area">
									<p style="text-align: center;" align="center">
										<strong style="color: rgb(54, 54, 54); font-family:" noto=""
											sans",="" sans-serif,="" 나눔고딕,="" nanumgothic,="" dotum;=""
											font-size:="" 15px;="" letter-spacing:="" -0.05em;=""
											margin:="" 0px;="" padding:="" text-size-adjust:="" none;=""
											line-height:=""1.5;"=""><span
											style="margin: 0px; padding: 0px; text-size-adjust: none; color: rgb(0, 158, 37); font-family: 나눔고딕, NanumGothic, sans-serif; font-size: 11pt;">
												<br>
										</span></strong>
									</p>
									<p style="text-align: center;" align="center">
										<strong style="color: rgb(54, 54, 54); font-family:" noto=""
											sans",="" sans-serif,="" 나눔고딕,="" nanumgothic,="" dotum;=""
											font-size:="" 15px;="" letter-spacing:="" -0.05em;=""
											margin:="" 0px;="" padding:="" text-size-adjust:="" none;=""
											line-height:=""1.5;"=""><span
											style="margin: 0px; padding: 0px; text-size-adjust: none; color: rgb(0, 117, 200); font-family: 나눔고딕, NanumGothic, sans-serif; font-size: 14pt;">
												《사오미 킥보드! 체험단 모집》</span></strong>
									</p>
									<p style="text-align: center;" align="center">
										<strong style="color: rgb(54, 54, 54); font-family:" noto=""
											sans",="" sans-serif,="" 나눔고딕,="" nanumgothic,="" dotum;=""
											font-size:="" 15px;="" letter-spacing:="" -0.05em;=""
											margin:="" 0px;="" padding:="" text-size-adjust:="" none;=""
											line-height:=""1.5;"=""><span
											style="margin: 0px; padding: 0px; text-size-adjust: none; color: rgb(0, 117, 200); font-family: 나눔고딕, NanumGothic, sans-serif; font-size: 14pt;">
												체험단을 모집합니다! :)</span></strong>
									</p>
									<p>&nbsp;</p>
									<div style="text-align: center;" align="center">
										<strong style="color: rgb(54, 54, 54); font-family:" noto=""
											sans",="" sans-serif,="" 나눔고딕,="" nanumgothic,="" dotum;=""
											font-size:="" 15px;="" letter-spacing:="" -0.05em;=""
											margin:="" 0px;="" padding:="" text-size-adjust:="" none;=""
											line-height:=""1.5;"=""><span
											style="margin: 0px; padding: 0px; text-size-adjust: none; color: rgb(0, 158, 37); font-family: 나눔고딕, NanumGothic, sans-serif; font-size: 11pt;">
												<img
												src="${pageContext.request.contextPath}/images/kick1.jpg"
												title="20180704120030230640.jpg">
										</span></strong>
									</div>
									<span
										style="margin: 0px; padding: 0px; text-size-adjust: none; line-height: 1.5; font-size: 14.6667px; letter-spacing: -0.75px; color: rgb(0, 117, 200);"><div
											style="text-align: center;" align="center">
											<font color="#009e25" face="나눔고딕, NanumGothic, sans-serif">
												<b><a
													href="http://easyspub.co.kr/20_Menu/BookView/A002/263/PUB"
													target="_blank">킥보드 자세히 보러가기</a></b>
											</font>
										</div></span>
									<p>&nbsp;</p>
									<p>&nbsp;</p>
									<p>
										<strong style="color: rgb(54, 54, 54); font-family:" noto=""
											sans",="" sans-serif,="" 나눔고딕,="" nanumgothic,="" dotum;=""
											font-size:="" 15px;="" letter-spacing:="" -0.05em;=""
											margin:="" 0px;="" padding:="" text-size-adjust:="" none;=""
											line-height:=""1.5;"=""><span
											style="margin: 0px; padding: 0px; text-size-adjust: none; color: rgb(0, 158, 37); font-family: 나눔고딕, NanumGothic, sans-serif; font-size: 11pt;"><br></span></strong>
									</p>
									<p>
										<strong style="color: rgb(54, 54, 54); font-family:" noto=""
											sans",="" sans-serif,="" 나눔고딕,="" nanumgothic,="" dotum;=""
											font-size:="" 15px;="" letter-spacing:="" -0.05em;=""
											margin:="" 0px;="" padding:="" text-size-adjust:="" none;=""
											line-height:=""1.5;"=""><span
											style="margin: 0px; padding: 0px; text-size-adjust: none; color: rgb(0, 117, 200); font-family: 나눔고딕, NanumGothic, sans-serif; font-size: 11pt;">●
												기한 :</span></strong><span
											style="color: rgb(54, 54, 54); letter-spacing: -0.05em; margin: 0px; padding: 0px; text-size-adjust: none; line-height: 1.5; font-family: 나눔고딕, NanumGothic, sans-serif; font-size: 11pt;"><span
											style="margin: 0px; padding: 0px; text-size-adjust: none; color: rgb(0, 117, 200);">&nbsp;</span><b
											style="margin: 0px; padding: 0px; text-size-adjust: none;">
												7월 4일(수) ~ 7월 10일(화)</b></span>
									</p>
									<p noto="" sans",="" sans-serif,="" 나눔고딕,="" nanumgothic,=""
										dotum;="" font-size:="" 15px;="" font-style:="" normal;=""
										font-weight:="" 400;="" word-spacing:="" 0px;=""
										white-space:="" orphans:="" 2;="" widows:=""
										text-size-adjust:="" none;="" font-variant-ligatures:=""
										font-variant-caps:="" -webkit-text-stroke-width:=""
										text-decoration-style:="" initial;=""
										text-decoration-color:="" initial;"="" 15px;"="" -0.05em;=""
										54);="" 54,="" rgb(54,=""
										style="text-size-adjust: none; line-height: 1.7em; font-family:"
										color:="" letter-spacing:="">
										<span
											style="margin: 0px; padding: 0px; text-size-adjust: none; line-height: 1.5; font-family: 나눔고딕, NanumGothic, sans-serif; font-size: 11pt;"><b
											style="margin: 0px; padding: 0px; text-size-adjust: none;">
												<strong
												style="margin: 0px; padding: 0px; text-size-adjust: none; line-height: 1.5; font-family: 돋움, Dotum, Helvetica, sans-serif; font-size: 12px;"><span
													style="margin: 0px; padding: 0px; text-size-adjust: none; color: rgb(0, 117, 200); font-family: 나눔고딕, NanumGothic, sans-serif; font-size: 11pt;">●
														발표 :</span></strong><span
												style="margin: 0px; padding: 0px; text-size-adjust: none; line-height: 1.5; font-size: 11pt; font-weight: normal;"><span
													style="margin: 0px; padding: 0px; text-size-adjust: none; color: rgb(0, 117, 200);">&nbsp;</span></span><b
												style="margin: 0px; padding: 0px; text-size-adjust: none; font-size: 14.66px;">7월
													11일(수), 페북 댓글과 홈페이지에서 발표</b><br style="text-size-adjust: none;">
										</b></span>
									</p>
									<h2 noto="" sans",="" sans-serif,="" 나눔고딕,="" nanumgothic,=""
										dotum;="" font-style:="" normal;="" word-spacing:="" 0px;=""
										white-space:="" orphans:="" 2;="" widows:=""
										text-size-adjust:="" none;="" font-variant-ligatures:=""
										font-variant-caps:="" -webkit-text-stroke-width:=""
										text-decoration-style:="" initial;=""
										text-decoration-color:="" initial;"=""
										54);="" 54,="" rgb(54,="" -0.05em;"=""
										style="margin: 0px; padding: 0px; text-size-adjust: none; line-height: 1em; font-family:"
										color:="" letter-spacing:="">
										<span
											style="margin: 0px; padding: 0px; text-size-adjust: none; line-height: 1.5; font-size: 12px;"></span><strong
											style="margin: 0px; padding: 0px; text-size-adjust: none; line-height: 1.5; font-size: 12px;"><span
											style="margin: 0px; padding: 0px; text-size-adjust: none; color: rgb(31, 189, 189); font-family: 나눔고딕, NanumGothic, sans-serif; font-size: 11pt;"></span>
										</strong><strong
											style="margin: 0px; padding: 0px; text-size-adjust: none; line-height: 1.5; font-size: 12px;"><span
											style="margin: 0px; padding: 0px; text-size-adjust: none; color: rgb(31, 189, 189); font-family: 나눔고딕, NanumGothic, sans-serif; font-size: 11pt;"></span></strong><span
											style="margin: 0px; padding: 0px; text-size-adjust: none; line-height: 1.5; font-family: 나눔고딕, NanumGothic, sans-serif; font-size: 11pt;"><b
											style="margin: 0px; padding: 0px; text-size-adjust: none; font-size: 14.66px;"><strong
												style="margin: 0px; padding: 0px; text-size-adjust: none; line-height: 1.5; font-family: 돋움, Dotum, Helvetica, sans-serif; font-size: 12px;"><span
													style="margin: 0px; padding: 0px; text-size-adjust: none; color: rgb(0, 117, 200); font-family: 나눔고딕, NanumGothic, sans-serif; font-size: 11pt;">●
														인원 :</span></strong><span
												style="margin: 0px; padding: 0px; text-size-adjust: none; line-height: 1.5; font-size: 11pt; font-weight: normal;"><span
													style="margin: 0px; padding: 0px; text-size-adjust: none; color: rgb(0, 158, 37);">&nbsp;</span></span></b><span
											style="margin: 0px; padding: 0px; text-size-adjust: none; color: rgb(31, 189, 189);"></span></span><strong
											style="margin: 0px; padding: 0px; text-size-adjust: none; line-height: 1.5; font-size: 12px;"><span
											style="margin: 0px; padding: 0px; text-size-adjust: none; color: rgb(0, 158, 37); font-family: 나눔고딕, NanumGothic, sans-serif; font-size: 11pt;">​</span></strong><span
											style="margin: 0px; padding: 0px; text-size-adjust: none; line-height: 1.5; font-family: 나눔고딕, NanumGothic, sans-serif; font-size: 11pt;"><span
											style="margin: 0px; padding: 0px; text-size-adjust: none; color: rgb(31, 189, 189);"></span>5명(좋아요
											100 달성 시 10명으로 늘어나요!)</span>
									</h2>
									<p noto="" sans",="" sans-serif,="" 나눔고딕,="" nanumgothic,=""
										dotum;="" font-size:="" 15px;="" font-style:="" normal;=""
										font-weight:="" 400;="" word-spacing:="" 0px;=""
										white-space:="" orphans:="" 2;="" widows:=""
										text-size-adjust:="" none;="" font-variant-ligatures:=""
										font-variant-caps:="" -webkit-text-stroke-width:=""
										text-decoration-style:="" initial;=""
										text-decoration-color:="" initial;"="" 15px;"="" -0.05em;=""
										54);="" 54,="" rgb(54,=""
										style="text-size-adjust: none; line-height: 1.7em; font-family:"
										color:="" letter-spacing:="">
										<strong
											style="margin: 0px; padding: 0px; text-size-adjust: none; letter-spacing: -0.05em;"><span
											style="margin: 0px; padding: 0px; text-size-adjust: none; color: rgb(0, 117, 200); font-family: 나눔고딕, NanumGothic, sans-serif; font-size: 11pt;">●
												신청 방법</span></strong>
									</p>
									<p noto="" sans",="" sans-serif,="" 나눔고딕,="" nanumgothic,=""
										dotum;="" font-size:="" 15px;="" font-style:="" normal;=""
										font-weight:="" 400;="" word-spacing:="" 0px;=""
										white-space:="" orphans:="" 2;="" widows:=""
										text-size-adjust:="" none;="" font-variant-ligatures:=""
										font-variant-caps:="" -webkit-text-stroke-width:=""
										text-decoration-style:="" initial;=""
										text-decoration-color:="" initial;"="" 15px;"="" -0.05em;=""
										54);="" 54,="" rgb(54,=""
										style="text-size-adjust: none; line-height: 1.7em; font-family:"
										color:="" letter-spacing:="">
										<span
											style="margin: 0px; padding: 0px; text-size-adjust: none; color: rgb(58, 50, 195); font-family: 나눔고딕, NanumGothic, sans-serif; font-size: 11pt;">​<span
											style="margin: 0px; padding: 0px; text-size-adjust: none; color: rgb(0, 0, 0);">﻿
												1. 3H Board 페이스북 페이지(facebook.com/3H Board) 좋아요 누르기!</span></span>
									</p>
									<p noto="" sans",="" sans-serif,="" 나눔고딕,="" nanumgothic,=""
										dotum;="" font-size:="" 15px;="" font-style:="" normal;=""
										font-weight:="" 400;="" word-spacing:="" 0px;=""
										white-space:="" orphans:="" 2;="" widows:=""
										text-size-adjust:="" none;="" font-variant-ligatures:=""
										font-variant-caps:="" -webkit-text-stroke-width:=""
										text-decoration-style:="" initial;=""
										text-decoration-color:="" initial;"="" 15px;"="" -0.05em;=""
										54);="" 54,="" rgb(54,=""
										style="text-size-adjust: none; line-height: 1.7em; font-family:"
										color:="" letter-spacing:="">
										<span
											style="margin: 0px; padding: 0px; text-size-adjust: none; font-family: 나눔고딕, NanumGothic, sans-serif; font-size: 11pt;">2.
											페이스북 체험단 모집 게시글</span><span
											style="margin: 0px; padding: 0px; text-size-adjust: none; font-family: 나눔고딕, NanumGothic, sans-serif; font-size: 11pt;">을
											'전체 공개'로 공유하기!</span>
									</p>
									<p noto="" sans",="" sans-serif,="" 나눔고딕,="" nanumgothic,=""
										dotum;="" font-size:="" 15px;="" font-style:="" normal;=""
										font-weight:="" 400;="" word-spacing:="" 0px;=""
										white-space:="" orphans:="" 2;="" widows:=""
										text-size-adjust:="" none;="" font-variant-ligatures:=""
										font-variant-caps:="" -webkit-text-stroke-width:=""
										text-decoration-style:="" initial;=""
										text-decoration-color:="" initial;"="" 15px;"="" -0.05em;=""
										54);="" 54,="" rgb(54,=""
										style="text-size-adjust: none; line-height: 1.7em; font-family:"
										color:="" letter-spacing:="">
										<span
											style="margin: 0px; padding: 0px; text-size-adjust: none; font-family: 나눔고딕, NanumGothic, sans-serif; font-size: 11pt;">3.
											페이스북 게시글에 '이 킥보드를 체험하고 싶은 이유'를 댓글</span><span
											style="margin: 0px; padding: 0px; text-size-adjust: none; letter-spacing: -0.05em; font-family: 나눔고딕, NanumGothic, sans-serif; font-size: 11pt;">로
											남기기!</span>
									</p>
									<p align="left" noto="" sans",="" sans-serif,="" 나눔고딕,=""
										nanumgothic,="" dotum;="" font-size:="" 15px;=""
										font-style:="" normal;="" font-weight:=""
										400;="" word-spacing:="" 0px;="" white-space:="" orphans:=""
										2;="" widows:="" text-size-adjust:="" none;=""
										font-variant-ligatures:="" font-variant-caps:=""
										-webkit-text-stroke-width:="" text-decoration-style:=""
										initial;="" text-decoration-color:="" initial;"=""
										style="text-size-adjust: none; line-height: 1.7em; font-family:"
										color:="" rgb(54,="" 54,="" 54);="" letter-spacing:=""
										-0.05em;="" 15px;"="">&nbsp;</p>
									<p noto="" sans",="" sans-serif,="" 나눔고딕,="" nanumgothic,=""
										dotum;="" font-size:="" 15px;="" font-style:="" normal;=""
										font-weight:="" 400;="" word-spacing:="" 0px;=""
										white-space:="" orphans:="" 2;="" widows:=""
										text-size-adjust:="" none;="" font-variant-ligatures:=""
										font-variant-caps:="" -webkit-text-stroke-width:=""
										text-decoration-style:="" initial;=""
										text-decoration-color:="" initial;"="" 15px;"="" -0.05em;=""
										54);="" 54,="" rgb(54,=""
										style="text-size-adjust: none; line-height: 1.7em; font-family:"
										color:="" letter-spacing:="">
										<span
											style="margin: 0px; padding: 0px; text-size-adjust: none; color: rgb(31, 189, 189); letter-spacing: -0.05em; font-family: 나눔고딕, NanumGothic, sans-serif; font-size: 11pt;"><b
											style="margin: 0px; padding: 0px; text-size-adjust: none; color: rgb(255, 108, 0); letter-spacing: -0.05em; font-size: 11pt;"><span
												style="margin: 0px; padding: 0px; text-size-adjust: none; color: rgb(0, 117, 200);">●&nbsp;</span></b></span><strong
											style="margin: 0px; padding: 0px; text-size-adjust: none; color: rgb(0, 0, 255); letter-spacing: -0.05em; font-family: 나눔고딕, NanumGothic, sans-serif; font-size: 11pt;"><span
											style="margin: 0px; padding: 0px; text-size-adjust: none; color: rgb(0, 117, 200);">서평단
												미션</span></strong>
									</p>
									<ol noto="" sans",="" sans-serif,="" 나눔고딕,="" nanumgothic,=""
										dotum;="" font-size:="" 15px;="" font-style:="" normal;=""
										font-weight:="" 400;="" word-spacing:="" 0px;=""
										white-space:="" orphans:="" 2;="" widows:=""
										text-size-adjust:="" none;="" font-variant-ligatures:=""
										font-variant-caps:="" -webkit-text-stroke-width:=""
										text-decoration-style:="" initial;=""
										text-decoration-color:="" initial;"="" 15px;"="" -0.05em;=""
										54);="" 54,="" rgb(54,=""
										style="margin: 0px; padding: 0px; text-size-adjust: none; line-height: 1.7em; font-family:"
										color:="" letter-spacing:="" list-style:="">
										<li
											style="margin: 0px; padding: 0px; text-size-adjust: none; line-height: 1.7em; font-family: 나눔고딕, NanumGothic, sans-serif; letter-spacing: -0.05em; list-style: none; font-size: 11pt;">체험단에
											선정되신 분들은 이름/주소/연락처를 아래 메일로 보내 주세요. (킥보드 발송은 당첨 발표일로부터 2~4일 정도
											걸립니다.) &nbsp;<span
											style="margin: 0px; padding: 0px; text-size-adjust: none; letter-spacing: -0.05em; font-size: 11pt;">체험기를
												등록하신 게시글의 URL 주소를<span
												style="margin: 0px; padding: 0px; text-size-adjust: none;">&nbsp;</span><b
												style="margin: 0px; padding: 0px; text-size-adjust: none;">leesue@3hboard.co.kr</b>로
												보내주시면 미션이 완료됩니다!&nbsp;
										</span><b
											style="margin: 0px; padding: 0px; text-size-adjust: none; letter-spacing: -0.05em; font-size: 11pt;"><span
												style="margin: 0px; padding: 0px; text-size-adjust: none; color: rgb(255, 0, 0);">
													(※열심히 체험기를 써주신&nbsp;다섯 분께는 스타벅스 아메리카노 기프티콘을 드려요!)</span></b>
										</li>
									</ol>
									<p>&nbsp;</p>
								</div>
							</div>
						</form>

						<div class="btn_area btm_area tCenter">
							<a href="${pageContext.request.contextPath}/Main/notice.jsp" class="btnList btn btnM btnBlack">목록</a>
						</div>
						<!-- view_detail : e -->

						<!-- view_prevnext : s -->
						<div class="view_prevnext">
							<ul class="prev_next">
								<li class="prev"><a href="#move" class="btnNextPrev"
									seq="527"> <span class="prev_txt">이전글</span> <em
										class="badge badgeM badge_202">이벤트</em> <span>킥보드 고수를
											찾습니다. (전동 킥보드, 세그웨이 등)</span>
								</a></li>
								<li class="next"><a href="#move" class="btnNextPrev"
									seq="522"> <span class="next_txt">다음글</span> <em
										class="badge badgeM badge_201">공지</em> <span>직원 모집 - 전동
											킥보드 사업 전반에 관심이 있는 신입직 및 경력직</span>
								</a></li>
							</ul>
						</div>
						<!-- view_prevnext : e -->

						<!-- view_replyarea : s -->
						<div class="view_replyarea">
							<h4>댓글 작성</h4>
							<div class="btn_area">
								<a href="#" class="btn btnXS btnGrayRe1 btnTopLogin">로그인</a> <a
									href="#" class="btn btnXS btnGrayRe1 btnTopJoin">회원가입</a>
							</div>
							<div class="radio_area">
								<input type="radio" name="OPEN_STATUS1" id="OPEN_STATUS11"
									value="C" checked /> <label for="OPEN_STATUS11">일반 댓글</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" name="OPEN_STATUS1" id="OPEN_STATUS12"
									value="S" /> <label for="OPEN_STATUS12">비밀 댓글</label>
							</div>
							<div class="textarea_reply">
								<div>
									<textarea id="COMMENT1" name="COMMENT" title="댓글을 작성해 주세요."
										class="btnCommentNumber style1"></textarea>
								</div>
								<a class="btnCommentWrite btn btnXS" href="#write">등록</a>
							</div>
							<p class="txt_reply">
								현재 <span id="CommentNumber" class="bold red">0</span> /200자
								&nbsp;&nbsp;&nbsp;글자수 200자까지만 작성 가능합니다.
							</p>
							<div class="reply_list">
								<ul>
								</ul>
							</div>


						</div>
						<!-- view_replyarea : e -->
					</div>
				</div>
			</div>
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
			<a class = "btnGoTop" title="goTop" style="display:block;">
			<img src="${pageContext.request.contextPath}/images/btn_top.png">
		</a>
		</div>

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
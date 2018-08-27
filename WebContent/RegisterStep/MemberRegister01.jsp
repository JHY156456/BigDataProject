<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="format-detection" content="telephone=no" />
<meta name="viewport"
	content="width=device-width, user-scalable=yes, target-densitydpi=device-dpi">

<link rel="stylesheet" type="text/css" href="../css/common.css" />
<link rel="stylesheet" type="text/css" href="../css/layout_common.css" />
<link rel="stylesheet" type="text/css" href="../css/layout_sub.css" />
<link rel="stylesheet" type="text/css" href="../css/layout_popup.css" />
<link rel="stylesheet" type="text/css"
	href="../css/jquery-ui-1.11.2.css" />

<script type="text/javascript" src="../easy_js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="../easy_js/jquery-ui-1.11.2.min.js"></script>
<script type="text/javascript" src="../easy_js/jquery.cookie-1.4.1.js"></script>
<script type="text/javascript" src="../easy_js/common_func.js"></script>
<script type="text/javascript" src="../easy_js/jquery.navgoco-0.2.1.js"></script>
<!--[if lt IE 9]>
	<link rel="stylesheet" type="text/css" href="/css/ie8.css" />
    <script src="/easy_js/html5.js"></script>
    <script src="/easy_js/respond.min.js"></script>
<![endif]-->
<title>3H Board :: 회원 기본정보 입력</title>
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
							<li class="current"><a href="${pageContext.request.contextPath}/Main/main.jsp" id="pub001A02이지스퍼블리싱"
								class="btnMainLink"><img
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
							<li><a href="${pageContext.request.contextPath}/Main/main.jsp" id="edu002A03이지스에듀" class="btnMainLink"><img
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
						title="출판사 &quot;이지스퍼블리싱&quot;의 책들만 검색이 가능합니다."
						value="도서명, 저자 등 검색" onfocus="this.value='';"
						onblur="if(this.value=='') this.value='도서명, 저자 등 검색';" />
				</div>
				<a href="#TOTALSEARCH" class="btnTotalSearch2 btn btnBlack btnS">검색</a>
			</div>
		</div>
		<!-- 컨텐츠 영역 : e -->

		<form method="post" id="frmTotalSearch" name="frmTotalSearch"
			action="${pageContext.request.contextPath}/cont">
			<input type="hidden" name="command" value="newMember"> <input
				type="hidden" id="TotalPage" name="TotalPage" value="1" /> <input
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
		<div id="contents_wrap">
			<div class="menu_loacation">
				<div class="container">
					<a href="../MAIN/main" class="home" title="메인페이지로 이동"></a> <span
						class="depth pointer"
						onClick="document.location.href='/82_Menu/JoinStep1/PUB';">회원가입</span>
					<span class="depth"><b>회원 기본정보 입력</b></span>
				</div>
			</div>

			<div class="contents">
				<div class="container">
					<h2>회원가입</h2>

					<div class="member_step">
						<!-- Web ver -->
						<span>약관 및 개인정보취급방침 동의</span> <span class="current">회원 기본정보
							입력</span> <span>가입 완료</span>
						<!-- Mobile ver -->
						<h3 class="current">회원 기본정보 입력</h3>
					</div>

					<div class="join_area">
						<div class="txt_welcome">3H Board 회원가입을 진심으로 환영합니다</div>
						<form method="post" id="frmJoin" name="frmJoin"
							action="${pageContext.request.contextPath}/cont"
							onSubmit="return true;">
							<input type="hidden" name="command" value="newMember"> <input
								type="hidden" id="agreement" name="agreement" value="Y" /> <input
								type="hidden" id="privacy" name="privacy" value="Y" />
							<table>
								<caption></caption>
								<colgroup>
									<col class="th_wdth">
									<col>
								</colgroup>
								<tr>
									<th>아이디</th>
									<td>
										<div class="input_id">
											<div>
												<input type="text" name="userID" id="useID" />
											</div>
											<a href="#"
												class="btnDPCheck1 btn btnS btnGray_brd">중복확인</a>
										</div> <span class="txt"><em class="red">4 ~ 15자리 이내</em>의
											영문과 숫자로만 입력</span>
									</td>
								</tr>
								<tr>
									<th>핸드폰</th>
									<td><div>
											<input type="text" name="hp1" id="" style="width: 95px;">-
											<input type="text" name="hp2" id="" style="width: 95px;">-
											<input type="text" name="hp3" id="" style="width: 95px;">

										</div></td>
								</tr>
								<tr>
									<th>이메일</th>
									<td>
										<div class="input_id">
											<div>
												<input type="email" name="email" id="email" />
											</div>
											<a href="#"
												class="btnDPCheck2 btn btnS btnGray_brd">중복확인</a>
										</div>
									</td>
								</tr>
								<tr>
									<th>비밀번호</th>
									<td>
										<div class="input_id">
											<input type="password" name="pwd1" id="pwd1" />
										</div> <span class="txt">8자리 이상 사용</span>
									</td>
								</tr>
								<tr>
									<th>비밀번호 확인</th>
									<td><div>
											<input type="password" name="pwd2" id="pwd2">
										</div></td>
								</tr>
								<tr>
									<th>주소</th>
									<td><div>
											<input type="text" name="address" id="pwd2"
												style="width: 302px;">
										</div></td>
								</tr>

								<tr>
									<th>3H Board <br />메일링 수신
									</th>
									<td><input type="radio" id="pub_y" name="pub" value="Y"
										checked="checked" /> <label for="pub_y">예</label> <input
										type="radio" id="pub_n" name="pub" value="N" /> <label
										for="pub_n">아니오 </label></td>
								</tr>
								<tr>
									<th>3H Board <br />SMS 수신
									</th>
									<td><input type="radio" id="edu_y" name="edu" value="Y"
										checked="checked" /> <label for="edu_y">예</label> <input
										type="radio" id="edu_n" name="edu" value="N" /> <label
										for="edu_n">아니오 </label /></td>
								</tr>
							</table>
							<div class="btn_area btm_area tCenter">
								<input type="submit" class="btnJoin btn btnL btnBlack"
									value="가입하기" id = "submitOk"> <a href="../MAIN/main.html"
									class="btn btnL btnGray">취소</a>
							</div>
						</form>
					</div>



				</div>
			</div>


			<!-- SNS & borad : s -->

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
						<a href="/73_Menu/WriterApply/PUB">저자신청</a>
						</li> <a
							href="https://docs.google.com/forms/d/e/1FAIpQLSc5ybZjSZqnV4ioXjSaIwKLjByN5mS01qByW33J3gtYdI3avA/viewform">역자신청</a>
						<a href="/72_Menu/BoardWrite/PUB">교재샘플/강의자료 요청</a>
						</li>
					</div>
				</div>
			</div>

			<div class="copyrights_area">
			<div class="container" style="display: inline;">

				<div class="address" style="display: inline-block; margin-top: 20px; margin-left: 350px">
					<span>서울특별시 강남구 언주로 508 10~17층(역삼동, 서울상록빌딩)</span> <br class="none_br"> <span>TEL (02)325-1722</span> <span>FAX
						(02)326-1723</span><br> <span>사업자등록번호 105-87-44487</span> <span>대표자
						: 신혜영 / <br class="none_br">Email : <a href="mailto:easy@easyspub.co.kr">easy@3hboard.co.kr</a>
					</span><br> <span>Copyright(c)2018 3H보드㈜ 3H Board Co., Ltd. All
						Rights Reserved</span>
				</div>
				<img src="/WebProject/images/logo_footer.png" alt="logo">
			</div>
		</div>
		<a class = "btnGoTop" title="goTop" style="display:block;">
			<img src="${pageContext.request.contextPath}/images/btn_top.png">
		</a>
			<!-- mobile 화면에서 로그인 -->
			<p class="btm_btn_area ver_mobile">
				<input type="button" name="MobileLogin" value="로그인" title="로그인"
					class="btn btnTopLogin" /> | <input type="button"
					name="MobileJoin" value="회원가입" title="회원가입" class="btn btnTopJoin" />
				<input type="button" name="" id="edu002A03이지스에듀" value="이지스에듀"
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
<script type="text/javascript">
document.getElementById('submitOk').style.cursor='pointer';


</script>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							var dpc1 = 0;
							var dpc2 = 0;
							$('.btnDPCheck1')
									.click(
											function() {
												if ($('#useID').val() == "") {
													alert("사용하실 아이디를 입력하세요.");
													$('#useID').focus();
													return false;
												} else {
													if ($('#useID').val().length < 4
															|| $('#useID')
																	.val().length > 15) {
														alert("아이디는 4~15자 이내로 입력하셔야 합니다.");
														$('#useID').focus();
														return;
													} else {
														var formData = {
															USER_ID : $(
																	'#useID')
																	.val()
														}
														$
																.ajax({
																	type : "POST",
																	url : "${pageContext.request.contextPath}/cont?command=duplicateIdCheck",
																	data : formData,
																	
																	failure : function(
																			_response) {
																		alert("error");
																		return false;
																	},
																	success : function(
																			msg) {
																		if (msg == "Y") {
																			alert("사용 가능합니다.");
																			dpc1 = 1;
																			return;
																		} else {
																			alert("이미 등록되어 있습니다.");
																			$(
																					'#useID')
																					.val(
																							'')
																					.focus();
																			dpc1 = 0;
																			return;
																		}
																	}
																});
													}
												}
											});
							$('.btnDPCheck2')
									.click(
											function() {
												if ($('#useID').val() == "") {
													alert("사용하실 아이디를 입력하세요.");
													$('#useID').focus();
													return false;
												} else {
													if ($('#email').val() == "") {
														alert("사용하실 이메일을 입력하세요.");
														$('#email').focus();
														return false;
													} else {
														var formData = {
															USER_ID : $(
																	'#useID')
																	.val(),
															USER_EMAIL : $(
																	'#email')
																	.val()
														}
														$
																.ajax({
																	type : "POST",
																	url : "${pageContext.request.contextPath}/cont?command=duplicateIdEmailCheck",
																	data : formData,
																	failure : function(
																			_response) {
																		alert("error");
																		return false;
																	},
																	success : function(
																			msg) {
																		if (msg == "Y") {
																			alert("이메일 사용 가능합니다.");
																			dpc2 = 1;
																			return;
																		} else if (msg == "X") {
																			alert("이메일 주소가 올바르지 않습니다.");
																			$(
																					'#email')
																					.val(
																							'');
																			dpc2 = 0;
																			return;
																		} else {
																			alert("이미 등록되어 있습니다.");
																			$(
																					'#email')
																					.val(
																							'')
																					.focus();
																			dpc2 = 0;
																			return;
																		}
																	}
																});
													}
												}
											});
							$('#useID').keyup(function() {
								dpc1 = 0;
							});
							$('#email').keyup(function() {
								dpc2 = 0;
							});
							$('.btnJoin')
									.click(
											function() {
												if ($('#useID').val() == "") {
													alert("아이디를 입력 해주세요.");
													$('#useID').focus();
													return false;
												}
												if (IsAlphaNumeric($('#useID')
														.val()) == false) {
													alert("아이디는 영문, 숫자만 사용하실 수 있습니다.");
													$('#useID').val('');
													$('#useID').focus();
													return false;
												}
												if ($('#useID').val().length < 4
														|| $('#useID').val().length > 15) {
													alert("아이디는 4~15자 이내로 입력하셔야 합니다.");
													$('#useID').focus();
													return false;
												}
												
												if (dpc1 < 1) {
													alert("아이디 중복 검사를 해 주세요.");
													return false;
												}
												 
												if ($('#email').val() == "") {
													alert("이메일을 입력 해주세요.");
													$('#email').focus();
													return false;
												}
												
												if (dpc2 < 1) {
													alert("이메일 중복 검사를 해 주세요.");
													return false;
												}
												if ($('#pwd1').val().length < 8) {
													alert("비밀번호는 8자 이상 입력하셔야 합니다.");
													$('#pwd1').focus();
													return false;
												}
												if ($('#pwd1').val() == "") {
													alert("비밀번호를 입력 해주세요.");
													$('#pwd1').focus();
													return false;
												}
												if ($('#pwd2').val() == "") {
													alert("비밀번호 확인을 입력 해주세요.");
													$('#pwd2').focus();
													return false;
												}
												if ($('#pwd1').val() != $(
														'#pwd2').val()) {
													alert("비밀번호가 일치하지 않습니다.");
													$('#pwd2').focus();
													return false;
												}
												$('#frmJoin').submit();
											});
						});
	</script>

</body>
</html>
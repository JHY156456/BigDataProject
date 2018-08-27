<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="model.BoardDTO"%>

<c:if test="${empty sessionScope.sid}">
	<c:set var="dog" value="noLogin" />
</c:if>
<c:if test="${not empty sessionScope.sid}">
	<c:set var="dog" value="${sid}" />
</c:if>

<%
	BoardDTO article = (BoardDTO) request.getAttribute("article");
	String nowPage = (String) request.getAttribute("page");

	String sessionId = (String) pageContext.getAttribute("dog");
	boolean isSame;
	if (sessionId.equals(article.getMember_id()))
		isSame = true;
	else
		isSame = false;
	System.out.println("isSame : " + isSame);
%>

<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="format-detection" content="telephone=no" />
<meta name="viewport"
	content="width=device-width, user-scalable=yes, target-densitydpi=device-dpi">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/layout_common.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/layout_sub.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/layout_popup.css" />
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
	<link rel="stylesheet" type="text/css" href="/css/ie8.css" />
    <script src="/easy_js/html5.js"></script>
    <script src="/easy_js/respond.min.js"></script>
<![endif]-->

<!-- 따릉이 css -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/login_css/common.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/login_css/jquery-ui.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/login_css/style_kr_v2.css" />
<!-- 따릉이 js -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/login_js/select/jquery.selectify.js"></script>
<script
	src="${pageContext.request.contextPath}/login_js/select/jquery.styled-select-box_gray.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/login_js/easing/jquery.easing.1.3.js"></script>

<title>이지스퍼블리싱 :: 불편해요</title>
<meta property="og:title"
	content="IT 도서 저자를 찾습니다. (기초 프로그래밍, 딥러닝 프로그래밍 등)" />
<meta property="og:url"
	content="http://www.easyspub.co.kr/12_Menu/BoardView/C200/528/PUB" />
<meta property="og:image"
	content="http://www.easyspub.co.kr${pageContext.request.contextPath}/images/logo_l_pub.png" />
<meta property="og:description"
	content="'구체적으로 도움이 되는 책'을 만드는 이지스퍼블리싱에서 IT 도서 저자를 찾습니다.&nbsp;모집 분야는 다음과 같습니다.&nbsp;---기초 프로그래밍(C++, C#)," />
<script type="text/javascript"
	src="/easy_js/jquery.simplemodal-1.4.4.js"></script>
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
						title="출판사 &quot;이지스퍼블리싱&quot;의 책들만 검색이 가능합니다."
						value="도서명, 저자 등 검색" onfocus="this.value='';"
						onblur="if(this.value=='') this.value='도서명, 저자 등 검색';" />
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
		<div id="contents_wrap">
			<div class="menu_loacation">
				<div class="container">
					<a href="/Main/PUB" class="home" title="메인페이지로 이동"></a> <span
						class="depth pointer"
						onClick="document.location.href='/11_Menu/CompanyInfo/PUB';">회사소개</span>
					<span class="depth"><b>불편해요</b></span>
				</div>
			</div>

			<div class="contents" id="board_view_wrap">
				<div class="container">
					<h2>불편해요</h2>

					<div class="cnt_wrap">
						<!-- view_detail : s -->
						<form method="post" id="frmView" name="frmView" action=""
							onSubmit="return true;">
							<input type="hidden" name="page" id="page" value="1" /> <input
								type="hidden" name="board_idx" id="board_idx" value="528" /> <input
								type="hidden" name="file_seq" id="file_seq" value="" /> <input
								type="hidden" name="sh_keyfield" id="sh_keyfield" value="ALL" />
							<input type="hidden" name="sh_keyword" id="sh_keyword" value="" />
							<div class="view_detail">
								<div class="title_area">
									<div class="title">
										<h3 id="BOARD_TITLE">
											<%=article.getTitle()%>
										</h3>

										<span id="BOARD_PAGEURL" class="none">
											http://www.easyspub.co.kr/12_Menu/BoardView/C200/528/PUB </span> <span
											id="BOARD_IMGURL" class="none">${pageContext.request.contextPath}/images/logo_l_pub.png</span>
										<!--
																-->
									</div>

									<div class="info">

										<span>등록일 : <%=article.getRegdate() %></span> <span>조회수 : <%=article.getViewcnt() %></span>
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
									<li><a href="#" id="NaverCafe"><img src="${pageContext.request.contextPath}/images/btn_sns_s_cafe.png" alt="카페"></a></li>-->
										</ul>
									</div>
								</div>

								<div class="cnt_area">
									<%=article.getContent()%>
									<div align="center" style="text-align: center;">
										<img
											src="${pageContext.request.contextPath}/images/logo_pub_black.png"
											title="20170502194254774875.png">
									</div>
								</div>
							</div>
						</form>



						<%
							if (isSame) {
						%>

						<form id="frm" name="frm">
							<input type="hidden" id="imgSeq" name="imgSeq" value="">
							<input type="hidden" id="currentPageName" name="currentPageName"
								value="opinionboard">
							<div class="btns"
								style="font-size: 20px; margin-top: 20px; text-align: center;">

								<input type="hidden" id="usrQnaSeq" name="usrQnaSeq"
									value="32154"> <a
									href="${pageContext.request.contextPath}/cont?command=articleDelete&board_num=<%=article.getBno()%>&board_sort=<%=article.getSort() %>"
									id="deleteButton" class="del"
									style="font-family: 'notokr-regular', sans-serif; width: 200px; background-color: #f2424f; color: #fff; text-decoration: none; font-weight: bold; margin: 0; padding: 0; font-size: 100%; text-align: center; cursor: pointer; display: inline-block; height: 50px; margin-right: 10px; line-height: 50px;">삭제</a>
								<input type="hidden" name="command" value="articleDelete">
								<input type="hidden" name="board_num" value=<%=article.getBno() %>>


								<a href="#" id="modifyButton" class="modify"
									style="color: #666; width: 200px; background-color: #72ebc9; cursor: pointer; display: inline-block; height: 50px; margin-right: 10px; line-height: 50px;">수정</a>
								<a
									href="${pageContext.request.contextPath}/cont?command=citizen"
									class="list"
									style="color: #001b31; width: 200px; background-color: #fff; border: 1px solid #001b31; cursor: pointer; display: inline-block; height: 48px; line-height: 48px;">목록</a>
							</div>
						</form>
						<%
							} else {
						%>
						<form id="frm" name="frm">
							<input type="hidden" id="imgSeq" name="imgSeq" value="">
							<input type="hidden" id="currentPageName" name="currentPageName"
								value="opinionboard">
							<div class="btns"
								style="font-size: 20px; margin-top: 20px; text-align: center;">

								<input type="hidden" id="usrQnaSeq" name="usrQnaSeq"
									value="32154"> <a
									href="${pageContext.request.contextPath}/cont?command=citizen"
									class="list"
									style="color: #001b31; width: 200px; background-color: #fff; border: 1px solid #001b31; cursor: pointer; display: inline-block; height: 48px; line-height: 48px;">목록</a>
							</div>
						</form>
						<%
							}
						%>
						<!-- <a href="#list" class="btnList btn btnM btnBlack">목록</a> -->


						<!-- view_detail : e -->



					</div>
					<div class="view_replyarea">
						<h4>댓글 작성</h4>
						<!--  
						<div class="btn_area">
							<a href="#" class="btn btnXS btnGrayRe1 btnTopLogin">로그인</a> <a
								href="#" class="btn btnXS btnGrayRe1 btnTopJoin">회원가입</a>
						</div>
						-->
						<div class="radio_area">
							<input type="radio" name="OPEN_STATUS1" id="OPEN_STATUS11"
								value="C" checked> <label for="OPEN_STATUS11">일반
								댓글</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio"
								name="OPEN_STATUS1" id="OPEN_STATUS12" value="S"> <label
								for="OPEN_STATUS12">비밀 댓글</label>
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
				<input type="button" name="MobileLogin" value="로그아웃" title="로그아웃"
					class="btn btnTopLogout" /> | <input type="button"
					name="MobileJoin" value="마이페이지" title="마이페이지"
					class="btn btnTopMyPage" /> <input type="button" name=""
					id="edu002A03이지스에듀" value="이지스에듀" title="이지스에듀"
					class="btn btn_short_cut btnMainLink" />
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


	<script src="https://developers.kakao.com/sdk/easy_js/kakao.min.js"></script>

	<script type="text/javascript">
		$(function() {

			$("#modifyButton").on(
					"click",
					function() {
						$("#frm").attr("action",
								"/customer/opinionBoard/opinionBoardEdit.do")
								.submit();
					});

			$("#deleteButton")
					.on(
							"click",
							function() {
								if (confirm('삭제하시겠습니까?')) {
									$
											.ajax({
												type : 'post',
												url : '/customer/opinionBoard/opinionBoardDelete.do',
												dataType : 'json',
												data : $('#frm').serialize(),
												async : false,
												success : function(data) {
													if (data.resultMessage == 'Success') {
														$("#frm")
																.attr(
																		{
																			method : 'post',
																			action : '/customer/opinionBoard/opinionBoardList.do'
																		})
																.submit();
													} else if (data.resultMessage == 'Login') {
														$("#frm")
																.attr(
																		{
																			method : 'post',
																			action : '/login.do'
																		})
																.submit();
													} else {
														alert('게시글 삭제에 실패하였습니다.')
													}
												},
												error : function(jqXHR,
														textStatus, errorThrown) {
													if (jqXHR.status === 500) {
														alert(textStatus);
													} else {
														return false;
													}
													//console.log(textStatus);
												}
											});
								}
							});
			$("#prev").click(function() {//추가 : 비밀글 접근 제어 하기 위해_2016.04.21_by_JHN
				var usrSessIDCntInfo = "0";
				var secretYNInfo = "Y";

				if (secretYNInfo == "Y") {
					if (usrSessIDCntInfo != 1) {
						alert('비공개');
						return false;
					}
				}
			});
			$("#next").click(function() {//추가 : 비밀글 접근 제어 하기 위해_2016.04.21_by_JHN
				var usrSessIDCntInfo = "";
				var secretYNInfo = "";

				if (secretYNInfo == "Y") {
					if (usrSessIDCntInfo != 1) {
						alert('비공개');
						return false;
					}
				}
			});
		});

		$(function() {
			$(".back").on("click", goBack);
			$(".file").find('a').on('click', fileDownload);
			window.osType = '';
			window.osType = window.osType != "" ? window.osType : "web";
			if (window.osType === "web") {
				$(".file").css("display", "");
			}
		});
		function goBack(e) {
			e.preventDefault();
			//alert("2->"+e.type +":"+ window.osType);
			switch (window.osType) {
			case "web":
				window.history.go(-1);
				break;
			case "android":
				window.android.goBack();
				break;
			case "ios":
				window.location = 'toApp://?{"call":"goBack"}';
				break;
			}
		}
		function fileDownload(e) {
			var pData = e.currentTarget.id.split(",");
			$('[name="imgSeq"]').val(pData[0]);

			var downUrlStr = pData[1].substring(7);
			var fileUploadDir = "/nas_link/spb/attachFiles/file_admin/basePath";
			var downUrl = location.protocol + "//" + location.host + pData[1];

			window.osType = window.osType != "" ? window.osType : "web";
			switch (window.osType) {
			case "web":
				$("#frm").attr({
					action : "/customer/opinionBoard/downloadFile.do",
					method : 'post'
				}).submit();
				break;
			case "android":
				window.android.downLoadFile(downUrl);
				break;
			case "ios":
				window.android.downLoadFile(downUrl);
				break;
			}
		};
	</script>
	<script type="text/javascript">
		Kakao.init('d96b43dfb226c516f75c9feebac0ce4e');
		$(document)
				.ready(
						function() {
							var sTitle = $('#BOARD_TITLE').text();
							var sUrl = $('#BOARD_PAGEURL').text();
							var sDesc = $('#BOARD_COMMENT').text();
							var sImg = $('#BOARD_IMGURL').text();

							Kakao.Link.createTalkLinkButton({
								container : '#KakaoTalk',
								label : sTitle + '\n' + sDesc,
								image : {
									src : sImg,
									width : '225',
									height : '334'
								},
								webButton : {
									text : '사람을 구체적으로 도와주는 책, 이지스퍼블리싱(주)',
									url : sUrl
								// 앱 설정의 웹 플랫폼에 등록한 도메인의 URL이어야 합니다.
								}
							});

							$('.BtnSNSLink')
									.click(
											function(e) {
												var sHref = "";
												var sType = $(this).attr('id');
												if (sImg.indexOf('http') < 0) {
													sImg = 'http://www.easyspub.co.kr'
															+ sImg;
												}
												switch (sType) {
												case "KakaoTalk": // KakaoTalk

													break;
												case "FaceBook": // FaceBook
													sHref = "http://www.facebook.com/sharer/sharer.php?t="
															+ encodeURIComponent(sTitle)
															+ "&u="
															+ encodeURIComponent(sUrl);
													window
															.open(sHref,
																	"FaceBook",
																	"width=1100,height=800,resizable=yes,scrollbars=yes");
													break;
												case "Twitter": // Twitter
													sHref = "http://twitter.com/?status="
															+ encodeURIComponent(sTitle)
															+ " "
															+ encodeURIComponent(sUrl);
													window
															.open(sHref,
																	"Twitter",
																	"width=466,height=511,resizable=yes,scrollbars=yes");
													break;
												case "UrlCopy": // UrlCopy
													var IE = (document.all) ? true
															: false;
													if (IE) {
														if (confirm("링크 URL을 클립보드에 복사하시겠습니까?"))
															window.clipboardData
																	.setData(
																			"Text",
																			sTitle
																					+ "\n"
																					+ sUrl);
													} else {
														temp = prompt(
																"Ctrl+C를 눌러 클립보드에 복사하세요.",
																sTitle + "\n"
																		+ sUrl);
													}
													break;
												}
											});
							$('.btnDown')
									.click(
											function() {
												$('#file_seq').val(
														$(this).attr('fseq'));
												$('#frmView')
														.attr('action',
																'/12_Menu/BoardAttachDownload/200/PUB')
														.submit();
											});
							$('.btnList').click(
									function() {
										$('#frmView').attr('action',
												'/12_Menu/BoardList/C200/PUB')
												.submit();
									});
							$('.btnNextPrev').click(
									function() {
										$('#frmView').attr(
												'action',
												'/12_Menu/BoardView/C200/'
														+ $(this).attr('seq')
														+ '/PUB').submit();
									});

						});
	</script>

</body>
</html>
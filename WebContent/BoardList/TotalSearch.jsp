<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="model.BoardDTO"%>
<%@page import="model.BoardDAO"%>
<%@page import="vo.PageInfo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
	ArrayList<BoardDTO> List = (ArrayList<BoardDTO>) request.getAttribute("datas");
	ArrayList<BoardDTO> communityList = (ArrayList<BoardDTO>) request.getAttribute("community_datas");
	System.out.println("communityList.size : " + communityList.size());
%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="format-detection" content="telephone=no" />
<meta name="viewport"
	content="width=device-width, user-scalable=yes, target-densitydpi=device-dpi">

<!-- 따릉이 css -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/login_css/common.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/login_css/jquery-ui.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/login_css/style_kr_v2.css" />


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
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/ie8.css" />
    <script src="${pageContext.request.contextPath}/easy_js/html5.js"></script>
    <script src="${pageContext.request.contextPath}/easy_js/respond.min.js"></script>
<![endif]-->
<title>이지스퍼블리싱 :: 통합검색</title>
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
						class="depth"><b>통합검색</b></span>
				</div>
			</div>

			<div class="contents" id="search_result_wrap">
				<div class="container">
					<h2>통합 검색</h2>

					<div class="cnt_wrap">

						<!-- 검색 결과_ 도서 : s -->
						<div class="search_section" id="board_list_wrap">
							<h3>
								커뮤니티
								<div class="txt_result">
									<em>[<%=request.getAttribute("key")%>]
									</em> 검색 결과 <b><%=request.getAttribute("searchCommunityAllCount")%></b>이
									검색되었습니다.
								</div>
							</h3>
							<a
								href="${pageContext.request.contextPath}/cont?command=searchMoreCommunity&keyWord=<%=request.getAttribute("key") %>"
								type="data" class="btn btnXS btnGray btnMore">+ 더보기</a>
							<div class="book_list_area">
								<div class="board_box">
									<table>
										<colgroup>
											<col width="50%">
											<col width="25%">
											<col width="25%">
										</colgroup>
										<tbody>
											<tr>
												<th class="center">제목</th>
												<th class="center">작성시간</th>
												<th class="center">아이디</th>
											</tr>

											<%
												for (int i = 0; i < communityList.size(); i++) {
											%>
											<tr>
												<td class="left"><a
													href="${pageContext.request.contextPath}/cont?command=boardDetail&board_num=<%=List.get(i).getBno()%>">
														<%=communityList.get(i).getTitle()%>
												</a> <!-- 추가 : 비밀글 접근 제어 하기 위해_2016.04.21_by_JHN --> <input
													type="hidden" id="secretYN_3" name="secretYN_3" value="N">
													<input type="hidden" id="usrSessIDCnt_3"
													name="usrSessIDCnt_3" value="0"> <!-- 끝 : 비밀글 접근 제어 하기 위해_2016.04.21_by_JHN -->
												</td>
												<td><%=communityList.get(i).getRegdate()%></td>
												<!--[if gt IE 8]><!-->
												<td><%=communityList.get(i).getMember_id()%></td>
												<!--<![endif]-->
											</tr>
											<%
												}
											%>
										</tbody>
									</table>

								</div>
							</div>
						</div>
						<!-- 검색 결과_ 도서 : e -->

						<!-- 검색 결과_ 자료실 : s -->
						<div class="search_section" id="board_list_wrap">
							<h3>
								불편해요
								<div class="txt_result">
									<em>[<%=request.getAttribute("key")%>]
									</em> 검색 결과 <b><%=request.getAttribute("searchAllCount")%></b>이
									검색되었습니다.
								</div>
							</h3>
							<a
								href="${pageContext.request.contextPath}/cont?command=searchMore&keyWord=<%=request.getAttribute("key") %>"
								type="data" class="btn btnXS btnGray btnMore">+ 더보기</a>
							<div class="book_list_area">
								<div class="board_box">
									<table>
										<colgroup>
											<col width="50%">
											<col width="25%">
											<col width="25%">
										</colgroup>
										<tbody>
											<tr>
												<th class="center">제목</th>
												<th class="center">작성시간</th>
												<th class="center">아이디</th>
											</tr>

											<%
												for (int i = 0; i < List.size(); i++) {
											%>
											<tr>
												<td class="left"><a
													href="${pageContext.request.contextPath}/cont?command=boardDetail&board_num=<%=List.get(i).getBno()%>">
														<%=List.get(i).getTitle()%>
												</a> <!-- 추가 : 비밀글 접근 제어 하기 위해_2016.04.21_by_JHN --> <input
													type="hidden" id="secretYN_3" name="secretYN_3" value="N">
													<input type="hidden" id="usrSessIDCnt_3"
													name="usrSessIDCnt_3" value="0"> <!-- 끝 : 비밀글 접근 제어 하기 위해_2016.04.21_by_JHN -->
												</td>
												<td><%=List.get(i).getRegdate()%></td>
												<!--[if gt IE 8]><!-->
												<td><%=List.get(i).getMember_id()%></td>
												<!--<![endif]-->
											</tr>
											<%
												}
											%>
										</tbody>
									</table>

								</div>
							</div>
						</div>
						<!-- 검색 결과_ 자료실 : e -->

						<!-- 검색 결과_ 동영상 : s -->
						<div class="search_section" id="board_list_wrap">
							<h3>
								공지사항
								<div class="txt_result">
									<em>[<%=request.getAttribute("key")%>]
									</em> 검색 결과 <b>1건</b>이 검색되었습니다.
								</div>
							</h3>
							<a href="#" type="movie" class="btn btnXS btnGray btnMore">+
								더보기</a>
							<div class="move_list_area">
								<ul>
									<li><a href="#view" class="BtnMovieView" alt="V470">
											<div class="img_area">
												<!--계속 돌고있길래 우선 주석  
												<img src="/upload/BOOK/189/20180131225001166137S.jpg"
													onerror="this.src='${pageContext.request.contextPath}/images/no_imageS.png'"
													alt="" />-->
											</div>
											<div class="brief_info">
												<p class="title">공지사항-킥보드 사용법 전면개정 동영상 강의</p>
												<p class="info">
													<span>강사 : 신혜영</span> <span>강좌수 : 10강</span> <span>등록일
														: 2018.02.13</span> <span>조회수 : 1,986</span>
												</p>
												<span class="txt_area"> 개정5판(오레오)은 개정4판(누가)에서 안드로이드
													스튜디오 사용법 일부가 변경되었습니다. 따라서 동영상 강의는 개정4판의 동영상 강의를 그대로 들으시면
													됩니다. 단, 안드로이드 스튜디오의 화면 중 일부가 변경되었기 때문에 첫째마당의 첫 번째 앱 동영상은 새로
													제작되었습니다. 변경된 안드로이드 스튜디오 화면에 대해 참조하기 바랍니다. ★ 동영상 강의 전체 들으러
													가기 : https://goo.gl/9JLZuc </span>
											</div>
									</a> <!-- 
									<div class="btn_area">
										<a href="#" class="btn btnS btnBlackRe ico_play"><img src="${pageContext.request.contextPath}/images/ico_play.png" alt="">바로보기</a>
										<a href="#" class="btn btnS btnBlackRe ico_down"><img src="${pageContext.request.contextPath}/images/ico_down.png" alt="">다운로드</a>
									</div>
									--></li>
								</ul>
							</div>
						</div>
						<!-- 검색 결과_ 동영상 : e -->
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
						<li><a href="#">찾아오시는 길</a></li>
						<li><a href="#">개인정보취급방침</a></li>
						<li><a href="#">이용약관</a></li>
					</ul>
					<div class="short_cut_ftr">
						<a href="#">가맹점 신청</a>
						</li> <a href="#">수리문의</a> <a href="/72_Menu/BoardWrite/PUB">킥보드샘플
							요청</a>
						</li>
					</div>
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
		action="/20_Menu/BookView/PUB" onSubmit="return true;">
		<input type="hidden" id="BOOK_IDX" name="BOOK_IDX" value="" /> <input
			type="hidden" id="BOARD_IDX" name="BOARD_IDX" value="" /> <input
			type="hidden" id="page" name="page" value="1" /> <input
			type="hidden" id="ShKeyfield" name="ShKeyfield" value="" /> <input
			type="hidden" id="ShKeyword" name="ShKeyword" value="" /> <input
			type="hidden" id="ShMaxpage" name="ShMaxpage" value="" /> <input
			type="hidden" id="ShOrderby" name="ShOrderby" value="" />
	</form>

	<script type="text/javascript">
		$(document).ready(
				function() {
					//$('#TotalKeyword1').val('안드로이드');
					//$('#TotalKeyword2').val('안드로이드');

					$('.BtnBookView').click(
							function(e) {
								$('#BOOK_IDX').val(
										$(this).attr('alt').replace("V", ""));
								$('#frmSearch').attr(
										{
											'action' : '/20_Menu/BookView/'
													+ $(this).attr('alt')
															.replace("V", "")
													+ '/PUB',
											'target' : '_blank'
										}).submit();
							});
					$('.BtnMovieView').click(
							function() {
								$('#BOARD_IDX').val(
										$(this).attr('alt').replace("V", ""));
								$('#frmSearch').attr(
										{
											'action' : '/50_Menu/VideoView/'
													+ $(this).attr('alt')
															.replace("V", "")
													+ '/PUB',
											'target' : '_blank'
										}).submit();
							});
					$('.btnMore')
							.click(
									function() {
										$('#TotalPage').val(1);
										$('#TotalPageType').val(
												$(this).attr('type'));
										$('#TotalKeyword').val('안드로이드');
										$('#frmTotalSearch').attr('action',
												'/71_Menu/SearchMoreList/PUB')
												.submit();
									});
				});
	</script>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="model.BoardDTO"%>
<%@page import="model.BoardDAO"%>
<%@page import="vo.PageInfo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<c:if test="${empty sessionScope.sid}">
	<c:set var="dog" value="noLogin" />
</c:if>
<c:if test="${not empty sessionScope.sid}">
	<c:set var="dog" value="${sid}" />
</c:if>
<%
	String sessionId = (String) pageContext.getAttribute("dog");
	ArrayList<BoardDTO> List = (ArrayList<BoardDTO>) request.getAttribute("datas");
	PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
	int listCount = pageInfo.getListCount();
	int nowPage = pageInfo.getPage();
	int maxPage = pageInfo.getMaxPage();
	int startPage = pageInfo.getStartPage();
	int endPage = pageInfo.getEndPage();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="format-detection" content="telephone=no" />
<meta name="viewport"
	content="width=device-width, user-scalable=yes, target-densitydpi=device-dpi">



<!-- 따릉이 css -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}//login_css/common.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}//login_css/jquery-ui.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/login_css/style_kr_v2.css" />


<!-- 이지스 css -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}//css/common.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}//css/layout_common.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}//css/layout_sub.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}//css/layout_popup.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/jquery-ui-1.11.2.css" />
	

	
	
<script type="text/javascript"
	src="${pageContext.request.contextPath}//easy_js/jquery-1.11.2.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}//easy_js/jquery-ui-1.11.2.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}//easy_js/jquery.cookie-1.4.1.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}//easy_js/common_func.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}//easy_js/jquery.navgoco-0.2.1.js"></script>
<!--[if lt IE 9]>
	<link rel="stylesheet" type="text/css" href="/css/ie8.css" />
    <script src="/easy_js/html5.js"></script>
    <script src="/easy_js/respond.min.js"></script>
<![endif]-->
<title>3H Board :: 불편해요</title>
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

								$('.btnTopLogout').click(function(e) {
									window.location = "/81_Menu/Logout/PUB";
								});
								$('.btnTopMyPage')
										.click(
												function(e) {
													window.location = "/91_Menu/MemberModify/PUB";
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
														$('#frmTotalSearch')
																.attr('action',
																		'/71_Menu/SearchList/PUB')
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
															$('#frmTotalSearch')
																	.attr(
																			'action',
																			'/71_Menu/SearchList/PUB')
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
					<a href="${pageContext.request.contextPath}/Main/main.jsp"
						class="home" title="메인페이지로 이동"></a> <span class="depth pointer"
						onClick="document.location.href='/11_Menu/CompanyInfo/PUB';">불편해요</span>

				</div>
			</div>

			<div class="container">
				<div class="content">

					<div class="board">
						<div class="top">
							<h3>불편해요</h3>
							<button class="back right"></button>
							<button class="close"></button>
						</div>

						<div class="board_srch">
							<form id="frm" name="frm"
								action="/customer/opinionBoard/opinionBoardList.do"
								accept-charset="utf-8">
								<div class="input w70">
									<input type="text" class="w100" id="searchValue"
										name="searchValue" placeholder="검색어를 입력해주세요" value="">
								</div>
								<div class="btn_search">
									<a href="#" id="searchButton" name="searchButton"><img
										src="/images/ic_search.png" alt="">검색</a>
								</div>
							</form>
						</div>

						<div class="board_box">
							<table>
								<colgroup>
									<col width="50%">
									<col width="20%">
									<col width="20%">
									<col width="10%">
								</colgroup>
								<tbody>
									<tr>
										<th class="center">제목</th>
										<th class="center">작성시간</th>
										<th class="center">아이디</th>
										<th class="center">조회수</th>
									</tr>

									<%
										for (int i = 0; i < List.size(); i++) {
									%>
									<tr>
										<td class="left"><a
											href="${pageContext.request.contextPath}/cont?command=boardDetail&board_num=<%=List.get(i).getBno()%>&sort=<%=List.get(i).getSort()%>">
												<%=List.get(i).getTitle()%>
										</a> <!-- 추가 : 비밀글 접근 제어 하기 위해_2016.04.21_by_JHN --> <input
											type="hidden" id="secretYN_3" name="secretYN_3" value="N">
											<input type="hidden" id="usrSessIDCnt_3"
											name="usrSessIDCnt_3" value="0"> <!-- 끝 : 비밀글 접근 제어 하기 위해_2016.04.21_by_JHN -->
										</td>
										<td><%=List.get(i).getRegdate()%></td>
										<!--[if gt IE 8]><!-->
										<td><%=List.get(i).getMember_id()%></td>
										<td><%=List.get(i).getViewcnt()%> </td>
										<!--<![endif]-->
									</tr>
									<%
										}
									%>
								</tbody>
							</table>

						</div>
						<div id="pageList"></div>

						<div class="paging">

							<div id="pagingWeb" class="num" style="display: inline;">
								<a
									href="${pageContext.request.contextPath}/cont?command=citizen&page=<%=startPage %>"
									onclick="linkPage(1); return false;"><img
									src="${pageContext.request.contextPath}/images/first.gif"
									alt="맨 처음 페이지"></a>
								<%
									if (nowPage <= 1) {
								%>
								<a href="#"><img
									src="${pageContext.request.contextPath}/images/p_prev.gif"
									alt="이전 페이지"></a>
								<%
									} else {
								%>
								<a
									href="${pageContext.request.contextPath}/cont?command=citizen&page=<%=nowPage-1 %>"
									onclick="linkPage(1); return false;"><img
									src="${pageContext.request.contextPath}/images/p_prev.gif"
									alt="이전 페이지"></a>
								<%
									}
								%>
								<%
									for (int a = startPage; a <= endPage; a++) {
										if (a == nowPage) {
								%>
								<span class="on"><a href="#"><strong><%=a%></strong></a></span>
								<%
									} else {
								%>
								<span><a
									href="${pageContext.request.contextPath}/cont?command=citizen&page=<%=a %>"
									onclick="linkPage(4); return false;"><%=a%></a></span>
								<%
									}
								%>
								<%
									}
								%>
								<!-- 예압 -->

								<%
									if (nowPage >= maxPage) {
								%>
								<a href="#" onclick="linkPage(6); return false;"><img
									src="${pageContext.request.contextPath}/images/p_next.gif"
									alt="다음 페이지"></a>
								<%
									} else {
								%>
								<a
									href="${pageContext.request.contextPath}/cont?command=citizen&page=<%=nowPage+1 %>"
									onclick="linkPage(6); return false;"><img
									src="${pageContext.request.contextPath}/images/p_next.gif"
									alt="다음 페이지"></a>

								<%
									}
								%>
								<a
									href="${pageContext.request.contextPath}/cont?command=citizen&page=<%=maxPage %>"
									onclick="linkPage(5963); return false;"><img
									src="${pageContext.request.contextPath}/images/last.gif"
									alt="마지막 페이지"></a>

							</div>
							<div id="pagingMobile" class="num" style="display: none;">
								<a href="#" onclick="linkPage(1); return false;"><img
									src="${pageContext.request.contextPath}/images/first.gif"
									alt="맨 처음 페이지"></a> <a href="#"
									onclick="linkPage(1); return false;"><img
									src="${pageContext.request.contextPath}/images/p_prev.gif"
									alt="이전 페이지"></a> <span class="on"><a href="#"><strong>1</strong></a></span>
								<span><a href="#" onclick="linkPage(2); return false;">2</a></span>
								<span><a href="#" onclick="linkPage(3); return false;">3</a></span>
								<a href="#" onclick="linkPage(4); return false;"><img
									src="${pageContext.request.contextPath}/images/p_next.gif"
									alt="다음 페이지"></a> <a href="#"
									onclick="linkPage(5963); return false;"><img
									src="${pageContext.request.contextPath}/images/last.gif"
									alt="마지막 페이지"></a>

							</div>
						</div>
						<c:if test="${empty sessionScope.sid}">
							<div class="btn" style="text-align: center; display: block"
								id="notLogin">
								<a href="#">글쓰기</a>
							</div>
						</c:if>
						<c:if test="${not empty sessionScope.sid}">
							<div class="btn" style="text-align: center; display: block">

								<a
									href="${pageContext.request.contextPath}/BoardList/citizenOpinionWrite.jsp">글쓰기</a>
							</div>
						</c:if>

						<div class="board_info">
							<ul>
								<li>시민의견 수렴 게시판은 회원 <span>누구나 자유롭게 의견을 게시할 수 있는 열린
										공간</span>입니다. 상업성 광고, 저속한 표현, 비방, 정치적 성향, 반복게시물 등은 관리자에 의해 통보없이 삭제될 수
									있으며, 홈페이지를 통해 불법 유해 정보 게시, 배포 시 정보통신망 이용촉진 및 정보보호 등에 관한 법률 제
									74조에 의거 1년 이하 징역 또는 1천만원 이하의 벌금에 처해질 수 있습니다.
								</li>
							</ul>
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
						</li> <a
							href="#">수리문의</a>
						<a href="/72_Menu/BoardWrite/PUB">킥보드샘플 요청</a>
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
					<input type="button" name="MobileLogin" value="로그아웃" title="로그아웃"
						class="btn btnTopLogout" /> | <input type="button"
						name="MobileJoin" value="마이페이지" title="마이페이지"
						class="btn btnTopMyPage" /> <input type="button" name=""
						id="edu002A03이지스에듀" value="이지스에듀" title="이지스에듀"
						class="btn btn_short_cut btnMainLink" />
				</p>
				<!-- mobile 화면에서 로그인// -->
		
			<img src="/82_Menu/MemberStatOK" alt="" width="0" height="0" />

			<!-- 이전 코드 <script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-116139153-1', 'auto');
  ga('send', 'pageview');
</script> -->
			<script type="text/javascript">
				$(document)
						.ready(
								function() {
									$('#notLogin')
											.click(
													function(e) {
														alert("로그인하세요");
														window.location = "${pageContext.request.contextPath}/RegisterStep/loginForm.jsp";
													})
								})
			</script>
			<!-- Gnb 영역 : s -->
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

																$(
																		'#frmTotalSearch')
																		.attr(
																				'action',
																				url)
																		.submit();
															}
														}
													});

									$('.btnMainLink').click(
											function(e) {
												var sBrandCode = $(this).attr(
														'id');
												var sBrandUrl = sBrandCode
														.substring(0, 3);
												$.cookie('BrandCode',
														sBrandCode, {
															expires : 365,
															path : '/'
														});

												window.location = "/Main/"
														+ sBrandUrl;
											});
									$('.btBookLink')
											.click(
													function(e) {
														var sBrandCode = $(this)
																.attr('id');
														var sBrandUrl = sBrandCode
																.substring(0, 3);
														$
																.cookie(
																		'BrandCode',
																		sBrandCode,
																		{
																			expires : 365,
																			path : '/'
																		});

														window.location = "/20_Menu/BookList/"
																+ sBrandUrl;
													});
								});
			</script>
			<!-- Gnb 영역 : e -->
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
			$(document).ready(
					function() {
						$('.btnSearch').click(
								function() {
									if ($('#sh_keyword').val() == "") {
										alert("검색어를 입력하세요.");
										$('#sh_keyword').focus();
										return;
									}
									$('#page').val('1');
									$('#frmSearch').attr('action',
											'/12_Menu/BoardList/C200/PUB')
											.submit();
								});
						$('#sh_keyword').keyup(
								function(e) {
									if (e.keyCode == 13) {
										$('#page').val(1);
										$('#frmSearch').attr('action',
												'/12_Menu/BoardList/C200/PUB')
												.submit();
									}
								});
						$('.btnView').click(
								function() {
									$('#frmSearch').attr(
											'action',
											'/12_Menu/BoardView/C200/'
													+ $(this).attr('seq')
													+ '/PUB').submit();
								});
						$('.BtnPageMove').click(
								function() {
									$('#page').val(
											$(this).attr('alt')
													.replace("P", ""));
									$('#frmSearch').attr('action',
											'/12_Menu/BoardList/C200/PUB')
											.submit();
								});
					});
		</script>
</body>
</html>
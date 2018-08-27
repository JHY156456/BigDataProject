<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="model.BoardDTO"%>
<%@page import="model.BoardDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="format-detection" content="telephone=no" />
<meta name="viewport"
	content="width=device-width, user-scalable=yes, target-densitydpi=device-dpi">

<!-- 따릉이 js -->

<script type="text/javascript"
	src="${pageContext.request.contextPath}/easy_js/select/jquery.selectify.js"></script>
<script
	src="${pageContext.request.contextPath}/easy_js/select/jquery.styled-select-box_gray.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/easy_js/easing/jquery.easing.1.3.js"></script>

<!-- 따릉이 css -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/login_css/common.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/login_css/jquery-ui.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/login_css/style_kr_v2.css" />


<!-- 이지스 css -->
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


<script type="text/javascript">
	$(document).ready(function() {
		$('#tx_editor_form').on('submit', function() {

			if ($('#qestnTitle').val() == "") {
				alert("제목을 입력하세요");
				$('#qestnTitle').focus();
				return false;
			}
			else if ($('#qestnContent').val() == "") {
				alert("내용을 입력하세요.");
				$('#qestnContent').focus();
				return false;
			}else {
				//$('#tx_editor_form').submit();
				return true;
			}
		})
	});
</script>


<!-- daumeditor -->
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/daumeditor/css/editor.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/daumeditor/easy_js/editor_loader.js?environment=production"
	charset="utf-8"></script>
<script type="text/javascript">
	var currentPageName = "opinionboard";
</script>
<title>3H Board :: 커뮤니티 글쓰기</title>
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
					<a href="${pageContext.request.contextPath}/MAIN/main.html"
						class="home" title="메인페이지로 이동"></a> <span class="depth pointer"
						onClick="document.location.href='/11_Menu/CompanyInfo/PUB';">커뮤니티</span>
					<span class="depth"><b>글쓰기</b></span>
				</div>
			</div>

			<div class="container">
				<div class="content">

					<div class="board">
						<div class="top">
							<h3>커뮤니티</h3>
							<button class="back"></button>
							<button class="close"></button>
						</div>

						<form id="tx_editor_form" name="tx_editor_form" method="post"
							action="${pageContext.request.contextPath}/cont">
							<input type="hidden" name="command" value="communityWriteOK"> 
							<input
								type="hidden" name="consentYn" /> <input type="hidden"
								name="secretYN" value="" />
							<!-- 추가 : 비밀글 정보 저장_2016.04.22_by_JHN -->
							<input type="hidden" name="cateCD" value="" />
							<!-- 추가 : 구분 카테고리 변경시 해당 값 저장_2016.05.30_by_JHN -->
							<input type="hidden" id="usrQnaSeq" name="usrQnaSeq" value="0" />
							<input type="hidden" id="mode" name="mode" value="insert" /> <input
								type="hidden" id="bbsClsCD" name="bbsClsCD" value="CTM_003" />
							<input type="hidden" id="currentPageName" name="currentPageName"
								value="opinionboard" /> <input type="hidden" id="wMode"
								name="wMode" value="" />

							<div class="write_box noline">
								<table>
									<colgroup>
										<col width="25%">
										<col width="75%">
									</colgroup>
									<tr>
										<th class="first">구분</th>
										<td class="first"><select id="cateCDList"
											name="cateCDList">
												<option value="">선택</option>
												<option value="OPI_006">이용방법</option>
												<option value="OPI_007">대여소</option>
												<option value="OPI_008">결제관련</option>
												<option value="OPI_009">홈페이지,앱</option>
												<option value="OPI_010">장애,오류</option>
												<option value="OPI_011">정책건의</option>
												<option value="OPI_012">기타문의</option>
										</select> <script>
											$("select").styledSelect();
										</script></td>
									</tr>
									<tr>
										<th>제목</th>
										<td><div class="input w100">
												<input type="text" class="w100" id="qestnTitle"
													name="qestnTitle" value="">
											</div></td>
									</tr>
									<tr>
										<th>아이디</th>
										<td>${sid}</td>
									</tr>
									<tr>
										<th>내용</th>
										<td><div class="input w100">
												<textarea class="w100" id="qestnContent" name="qestnContent"
													value="" style="height: 400px;"></textarea>
											</div></td>
									</tr>
									<div id="tx_attach_div" class="tx-attach-div">
										<!-- <div id="tx_attach_txt" class="tx-attach-txt">파일 첨부</div> -->
										<div id="tx_attach_box" class="tx-attach-box">
											<div class="tx-attach-box-inner">
												<div id="tx_attach_preview" class="tx-attach-preview">
													<p></p>
													<img
														src="${pageContext.request.contextPath}/images/icon/editor/pn_preview.gif"
														width="147" height="108" unselectable="on" />
												</div>
												<div class="tx-attach-main">
													<div id="tx_upload_progress" class="tx-upload-progress">
														<div>0%</div>
														<p>파일을 업로드하는 중입니다.</p>
													</div>
													<ul class="tx-attach-top">
														<li id="tx_attach_delete" class="tx-attach-delete"><a>전체삭제</a></li>
														<li id="tx_attach_size" class="tx-attach-size">파일: <span
															id="tx_attach_up_size" class="tx-attach-size-up"></span>/<span
															id="tx_attach_max_size"></span>
														</li>
														<li id="tx_attach_tools" class="tx-attach-tools"></li>
													</ul>
													<ul id="tx_attach_list" class="tx-attach-list"></ul>
												</div>
											</div>
										</div>
									</div>
									<!-- 첨부박스 끝 -->
									<tr id="fileattach">
										<th>사진 첨부</th>
										<td><input type="file" id="imgFile" name="imgFile"
											accept="image/*" multiple="camera" style="border: none;">

										</td>
									</tr>
									<tr>
										<th>공개여부</th>
										<td><input type="checkbox" name="secretInfo"
											id="secretInfo" value="Y" checked /> <label for="secretInfo"><span></span>비공개</label>
										</td>
									</tr>
								</table>
							</div>

							<div class="btns">
								<input type="hidden" name="write_id" value="${sid}"> <a
									href="${pageContext.request.contextPath}/cont?command=community"
									class="cancel" id="goList">취소</a> 
									
									<input type="submit"
									class="write" id="submitButton" value="글쓰기"
									style="color: #666; width: 200px; background-color: #72ebc9; display: inline-block; cursor: pointer; height: 50px; line-height: 50px; margin: 0; padding: 0; text-align: center; font-size: 100%; font-family: 'notokr-regular', sans-serif;">
							</div>
						</form>

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
		<script type="text/javascript">
			/* 예제용 함수 */
			/*
			function saveContent() { 
				if(confirm("저장 하시겠습니까?")){
					Editor.save(); 
				}
			}
			 */

			function validForm(editor) {
				if ($("#cateCDList").val() === '') {
					alert('시민의견 수렴의 "구분"을 선택해 주세요.');
					return false;
				}
				if ($.trim($("#qestnTitle").val()) == '') {
					$("#qestnTitle").focus();
					alert('제목을 입력해 주세요.');
					return false;
				}
				/* if($("#qestnTextContent").val()=='') {
					alert('내용을 입력해 주세요.');
					return false;
				} */
				/* 본문 내용이 입력되었는지 검사하는 부분 */
				var validator = new Trex.Validator();
				var content = editor.getContent();
				if (!validator.exists(content)) {
					alert('내용을 입력해 주세요.');
					alert("내용을 입력해 주세요.");
					return false;
				}
				var mode = $("#tx_editor_form").children("#mode").val();
				if (mode == 'insert' || mode == 'update') {
					$("#tx_editor_form").attr('action',
							'/customer/opinionBoard/opinionBoardPersist.do')
							.submit();
				} else {
					alert("모드 값이 설정되지 않았습니다.");
					return false;
				}
				return true;
			}

			function setForm(editor) {
				document.getElementById("qestn_TEXT_content").disabled = true;
				var i, input;
				var form = editor.getForm();
				var qestnHTMLContent = editor.getContent();
				var textarea = document.createElement('textarea');
				textarea.name = 'qestnHTMLContent';
				textarea.value = qestnHTMLContent;

				if (document.getElementsByName("qestnHTMLContent").length == 0) {
					form.createField(textarea);
				}

				/*
				$('[name="qestnHTMLContent"]').attr('style', 'display:none');
				var images = editor.getAttachments('image');
				 for (i = 0; i < images.length; i++) {
				     if (images[i].existStage) {
				         //alert('attachment information - image[' + i + '] \r\n' + JSON.stringify(images[i].data));
						iinput = document.createElement('input');
				         input.type = 'hidden';
				         input.name = 'attach_image_info';
				         input.value = JSON.stringify(images[i].data);
				         form.createField(input);
				     }
				 }
				  var files = editor.getAttachments('file');
				 for (i = 0; i < files.length; i++) {
				     input = document.createElement('input');
				     input.type = 'hidden';
				     input.name = 'attach_file';
				     input.value = files[i].data.attachurl;
				     form.createField(input);
				 } 
				 */

				//이미지, 파일 업로드 _cms_20161108
				var edtList = Editor.getAttachBox().datalist;
				var imglist = Editor.getAttachments('image', true);
				var filelist = Editor.getAttachments('file', true);

				for (f = 0; f < edtList.length; f++) {
					for (k = 0; k < imglist.length; k++) {
						if (edtList[f].data.dispElId == imglist[k].data.dispElId) {
							var entry = edtList[f];
							input = document.createElement('input');
							input.type = 'hidden';
							input.name = 'attach_image_info';
							input.value = JSON.stringify(edtList[f].data);
							form.createField(input);
						}
					}
				}

				for (f = 0; f < edtList.length; f++) {
					for (k = 0; k < filelist.length; k++) {
						if (edtList[f].data.dispElId == filelist[k].data.dispElId) {
							var entry = edtList[f];
							input = document.createElement('input');
							input.type = 'hidden';
							input.name = 'attach_file';
							input.value = JSON.stringify(edtList[f].data);
							form.createField(input);
						}
					}
				}

				return true;
			}
		</script>
</body>
</html>
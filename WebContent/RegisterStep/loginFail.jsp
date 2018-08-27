<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String Fail = (String) request.getAttribute("errorMsg");
	System.out.println(Fail);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		alert(
	"로그인에 실패하였습니다 다시 시도해주세요."
		);
		window.location = "RegisterStep/loginForm.jsp";
	</script>
</body>
</html>
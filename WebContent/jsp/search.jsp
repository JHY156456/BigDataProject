<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach var="data" items="${requestScope.search }">
<div onclick="autoComplete('${data.stationID},${data.stationName}')" onmouseover="this.style.backgroundColor = 'skyblue'; this.style.cursor = 'pointer'" onmouseout="this.style.backgroundColor = 'white'">${data.stationID}. ${data.stationName}</div>
</c:forEach>
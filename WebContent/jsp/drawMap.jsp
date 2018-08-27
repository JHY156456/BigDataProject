<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
[
<c:forEach var="data" items="${requestScope.station}">
          {"stationID":"${data.stationID}", "stationName": "${data.stationName}","district":"${data.district}", "holdNum":${data.holdNum}, "boardNum":${data.boardNum}, "latitude":${data.latitude}, "longitude":${data.longitude}},
</c:forEach>
]

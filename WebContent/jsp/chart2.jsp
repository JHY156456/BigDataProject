<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
[
<c:forEach var="data" items="${requestScope.chart2 }">
          [${data.rentalDate},${data.useCount}],
</c:forEach>
]

<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
[<c:forEach var="data" items="${requestScope.record }">
          [${data.latitude},${data.longitude}, ${data.rentalNum}, ${data.returnNum}],
</c:forEach>
]
    
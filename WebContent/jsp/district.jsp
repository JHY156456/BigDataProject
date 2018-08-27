<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <table id="bootstrap-data-table" class="table table-striped table-bordered">
 	<thead>
		<tr>
			<th>대여소번호</th>
			<th>대여소명</th>
			<th>S-HoldNum</th>
			<th>S-BikeNum</th>
			<th>H-HoldNum</th>
			<th>H-BoardNum</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="data" items ="${requestScope.district}">
			<tr>
				<td>${data.stationNo }</td>
				<td>${data.stationName }</td>
				<td>${data.s_holdNum }</td>
				<td>${data.s_bikeNum }</td>
				<td>${data.h_holdNum }</td>
				<td>${data.h_boardNum }</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
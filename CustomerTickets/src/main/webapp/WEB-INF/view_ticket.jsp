<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/css/mains.css">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<title>Ticket</title>
</head>
<body>
	<div class="container">
		<div class="d-flex justify-content-between align-items-center">
			<h1>${ticket.title}</h1>
			<a href="/tickets">Back to Dashboard</a>
		</div>

		<table style="width: 50%" class="table">
			<tbody>
				<tr>
					<td><h4>Added by:</h4></td>
					<td><h4>${ticket.owner.name}</h4></td>
				</tr>
				
				<tr>
					<td>Customer Name:</td>
					<td><c:out value="${ticket.customer}"></c:out></td>
				</tr>
				
				<tr>
					<td>Description:</td>
					<td><c:out value="${ticket.description}"></c:out></td>
				</tr>

				<tr>
					<td>Notes:</td>
					<td><c:out value="${ticket.notes}"></c:out></td>
				</tr>

				<tr>
					<td>Completed:</td>
					<td><c:out value="${ticket.completed}"></c:out></td>
				</tr>
			</tbody>
		</table>

		<c:if test="${ticket.owner.id==userId}">
			<a href="/tickets/${ticket.id}/edit" class="btn btn-secondary">Edit</a>
		</c:if>

		<c:if test="${not empty error}">
			<div style="color: red;">${error}</div>
		</c:if>
	</div>

</body>
</html>
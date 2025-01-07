<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Formatting (dates) -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Service Ticket List</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/mains.css">
<!-- change to match your file/naming structure -->
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/app.js"></script>
<!-- change to match your file/naming structure -->
</head>
<body>
	<div class="container">
		<div class="d-flex justify-content-between align-items-center">
			<h1>Welcome, ${user.name}</h1>
			<a href="/logout" class="btn btn-danger">Logout</a>
		</div>

		<table class="table table-striped table-bordered">
			<thead>
				<tr class="table-secondary">
					<th class="text-center">User</th>
					<th class="text-center">Customer Name</th>
					<th class="text-center">Ticket Title</th>
					<th class="text-center">Completed?</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="ticket" items="${tickets}">
					<tr>
						<td class="text-center">${ticket.owner.name}</a></td>
						<td class="text-center"><c:out value="${ticket.customer}"></c:out></td>
						<td class="text-center"><a href="/tickets/${ticket.id}" class="text-decoration-none">${ticket.title}</a></td>
						<td class="text-center">${ticket.completed}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<a href="/tickets/new" class="btn btn-primary">Submit New Ticket</a>
	</div>
</body>
</html>
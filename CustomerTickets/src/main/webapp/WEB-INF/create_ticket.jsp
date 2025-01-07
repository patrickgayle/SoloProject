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
<title>Create Ticket</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/mains.css">
<!-- change to match your file/naming structure -->
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/app.js"></script>
<style>
	textarea {
		resize: none
	}
</style>
<!-- change to match your file/naming structure -->
</head>
<body>
	<div class="container">
		<h1>Create Ticket</h1>
		<form:form action="/tickets/new" method="post" modelAttribute="ticket">

			<table>
				<thead>
					<tr>
						<td class="float-left">Ticket Title:</td>
						<td class="float-left">
							<form:errors path="title" class="text-danger" /> <br>
							<form:input class="input" path="title" /></td>
					</tr>
					<tr>
						<td class="float-left">Customer Name:</td>
						<td class="float-left">
							<form:errors path="customer" class="text-danger" /> <br>
							<form:input class="input" path="customer" />
						</td>
					</tr>
					<tr>
						<td class="float-left">Description:</td>
						<td class="float-left">
							<form:errors path="description" class="text-danger" /> <br>
							<form:textarea class="input" rows="4" path="description" />
						</td>
					</tr>
					<tr>
						<td class="float-left">Notes:</td>
						<td class="float-left">
							<form:errors path="notes" class="text-danger" /> <br>
							<form:textarea class="input" rows="4" path="notes" />
						</td>
					</tr>
					<tr>
						<td class="float-left">Completed?</td>
						<td class="float-left">
							<form:errors path="completed" class="text-danger" /> <br>
							<form:select path="completed">
								<form:option value="" label="--- Select ---"/>
                        		<form:option value="No" label="No" />
                        		<form:option value="Yes" label="Yes" />
                    		</form:select>
                    	</td>
					</tr>

					<form:errors path="owner" class="error" />
					<br>
					<form:input type="hidden" path="owner" value="${userId}"
						class="form-control" />

					<tr>
						<td><a class="btn btn-primary" href="/tickets">Cancel</a></td>
						<td><input class="btn btn-success" type="submit"
							value="Submit" /></td>
					</tr>
				</thead>
			</table>
		</form:form>
	</div>
</body>
</html>
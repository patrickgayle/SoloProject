<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/mains.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script><!-- change to match your file/naming structure -->
	<style>
		textarea {
			resize: none
		}
	</style>
<title>Edit Ticket</title>
</head>
<body>

	<div class="container">
		<h1>${ticket.title}</h1>


		<form:form action="/tickets/edit/${ticket.id}" method="post"
			modelAttribute="ticket">

			<table>
				<thead>
					<tr>
						<td class="float-left">Ticket Title:</td>
						<td class="float-left">
							<form:errors path="title" class="text-danger" /> <br>
							<form:input class="input" path="title" value="${ticket.title}" />
						</td>
					</tr>
					<tr>
						<td class="float-left">Customer Name:</td>
						<td class="float-left">
							<form:errors path="customer" class="text-danger" /><br>
							<form:input class="input" path="customer" value="${ticket.customer}" />
						</td>
					</tr>
					<tr>
						<td class="float-left">Description:</td>
						<td class="float-left">
							<form:errors path="description" class="text-danger" /><br>
							<form:textarea class="input" rows="4" path="description" value="${ticket.description}" />
						</td>
					</tr>
					<tr>
						<td class="float-left">Notes:</td>
						<td class="float-left">
							<form:errors path="notes" class="text-danger" /><br>
							<form:textarea class="input" rows="4" path="notes" value="${ticket.notes}" />
						</td>
					</tr>
					<tr>
						<td class="float-left">Completed?:</td>
						<td class="float-left"><form:errors path="completed" class="text-danger" /><br>
							<form:select path="completed">
								<form:option value="" label="--- Select ---"/>
                        		<form:option value="No" label="No" />
                        		<form:option value="Yes" label="Yes" />
                       		</form:select>
                       	</td>
					</tr>
					<tr>
						<td><input type="submit" class="btn btn-success" value="Submit" /></td>
						<td><a class="btn btn-primary" href="/tickets">Cancel</a></td>
					</tr>
				</thead>
			</table>
		</form:form>
		<form action="/tickets/delete/${ticket.id}" method="post">
			<input type="hidden" name="_method" value="delete">
			<input type="submit" value="Delete Ticket" class="btn btn-danger">
		</form>
	</div>
</body>
</html>
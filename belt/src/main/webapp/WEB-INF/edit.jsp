<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Courses</title>

	<!-- <link rel="stylesheet" type="text/css" href="/css/style.css"> -->
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
	
	<!-- <script type="text/javascript" src="/js/script.js"></script> -->
	<script src="/webjars/jquery/jquery.min.js"></script>
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>

<body>
	<div class="container-fluid">
		<div class="container mx-auto mt-4">
			<h1 class="display-4">Edit Course</h1>
			<form:form action="/courses" modelAttribute="course" method="POST" class="col-5 mt-4 p-3">
				<input type="hidden" name="user" value= "${userId}"/>
				<div class="mb-3">
					<form:label path="name" class="form-label">Name:</form:label>
					<form:input type="text" path="name" class="form-control" />
				</div>
				<div><form:errors path="name" /></div>
				<div class="mb-3">
					<form:label path="day" class="form-label">Day of Week:</form:label>
					<form:input type="text" path="day" class="form-control" />
				</div>
				<div><form:errors path="day" /></div>
				<div class="mb-3">
					<form:label path="price" class="form-label">Price:</form:label>
					<form:input type="number" path="price" class="form-control" />
				</div>
				<div><form:errors path="price" /></div>
				<div class="mb-3">
					<form:label path="description" class="form-label">Description:</form:label>
					<form:textarea path="description" class="form-control"></form:textarea>
				</div>
				<div><form:errors path="description" /></div>
				<input type="submit" value="Submit" class="btn btn-sm btn-primary" />
			</form:form>
		</div>
	</div>

</body>
</html>
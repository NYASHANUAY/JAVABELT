<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) --> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html data-bs-theme="dark">


<!--/////////////////////////////////////////////////////
//	DASHBOARD JSP
///////////////////////////////////////////////////////// -->

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- //// CSS LINKS //////////////////////////////////////// -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/css/style.css">
<title>Book Club</title>
</head>
<body>
	${books}
	<!-- //// HEADER /////////////////////////////////////////// -->
	<header>
		<div class="navbar navbar-dark bg-dark box-shadow">
			<div class="container d-flex justify-content-between">
				<a href="/logout" class="col-8 navbar-brand"> <strong
					class="text-warning">Log Out</strong>
				</a>
				
	</header>

	<!-- //// MAIN AREA //////////////////////////////////////// -->
	<main role="main">
		<div class="container mt-4">
			<div class="row">
				<h1>Welcome <c:out value="${user.userName}"></c:out></h1>
				<div class="bg-info round p-3">
					<div class="d-flex justify-content-between align-items-center">
						<h2>Course Schedule:</h2>
						<div class="d-flex justify-content-end align-items-center">
							<a class="btn btn-danger" href="/courses/add">New Course</a>
						</div>
					</div>
					<!-- //// TABLE TO DISPLAY ALL BOOKS //////// -->
					<table class="table">
						<thead>
							<tr>
								<th scope="col"><strong>Course Name</strong></th>
								<th scope="col"><strong>Day</strong></th>
								<th scope="col"><strong>Price</strong></th>
                                <th scope="col"><strong>Description</strong></th>
								<th scope="col"><strong>Instructor</strong></th>
								<th scope="col"><strong>Action</strong></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="course" items="${ courses }">
								<tr>
									<!-- <td>${ course.id }</td> -->
									<td><a class=" text-decoration-none"
										href="/courses/${ course.id }">${ course.name }</a></td>
									<td>${ course.day }</td>
									<td>${ course.price }</td>
									<td>${ course.description }</td>
									<td>${ course.user.userName }</td>
									<td class="row">
										<!-- **** Button that points to Book View ************ -->
										<div class="col">
											<button class="btn btn-primary btn-sm round"
												onclick="window.location.href='/courses/${ course.id }';">View</button>
										</div> <c:choose>
											<c:when test="${userId == course.user.id}">
												<div class="col">
													<button class="btn btn-warning btn-sm round"
														onclick="window.location.href='/courses/${ course.id }/edit';">Edit</button>
												</div>
												<!-- **** Button that deletes Book ************ -->
												<form class="col" action="/courses/${ course.id }/delete"
													method="post">
													<input type="hidden" name="_method" value="delete">
													<!-- ### Converts method of form to DELETE ### -->
													<button class="btn btn-danger btn-sm round">Delete</button>
												</form>
											</c:when>
										</c:choose> 
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</main>

	<!-- //// JAVASCRIPT LINKS ///////////////////////////////// -->
	<script src="/webjars/jquery/jquery.min.js"></script>
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/app.js"></script>
</body>
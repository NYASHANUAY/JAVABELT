<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- c:out ; c:forEach etc. -->
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- Formatting (dates) -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- form:form -->
<%@ page isErrorPage="true"%>
<!-- for rendering errors on PUT routes -->



<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- //// CSS LINKS //////////////////////////////////////// -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/css/style.css">
<title>Login and Registration</title>
</head>
<body>
	<!-- //// HEADER /////////////////////////////////////////// -->
	<header>
		<div class="navbar navbar-dark bg-dark box-shadow">
			<div class="container d-flex justify-content-between">
				<a href="/" class="navbar-brand d-flex align-items-center"> <strong
					class="text-danger">LOGIN AND REGISTRATION FORM</strong>
				</a>
				<button class="btn btn-info btn-sm round" onclick="window.location.href='/';">Index</button>
			</div>
		</div>
	</header>

	<main role="main">
		<div class="container mt-4">
			<div class="row">
				<!-- //// REGISTRATION FORM //////////////////////// -->
				<form:form action="/register" method="post" modelAttribute="newUser">
                    <div class="mb-3">
                        <form:label class="form-label" path="userName">user name</form:label>
                        <form:input class="form-control" path="userName"></form:input>
                        <form:errors class="form-text text-warning" path="userName"></form:errors>
                    </div>
                    <div class="mb-3">
                        <form:label class="form-label" path="email">email</form:label>
                        <form:input class="form-control" path="email"></form:input>
                        <form:errors class="form-text text-warning" path="email"></form:errors>
                    </div>
                    <div class="mb-3">
                        <form:label class="form-label" path="password">password</form:label>
                        <form:input class="form-control" path="password"></form:input>
                        <form:errors class="form-text text-warning" path="password"></form:errors>
                    </div>
                    <div class="mb-3">
                        <form:label class="form-label" path="confirm">confirm password</form:label>
                        <form:input class="form-control" path="confirm"></form:input>
                        <form:errors class="form-text text-warning" path="confirm"></form:errors>
                    </div>

                    <input class="btn btn-primary" type="submit" value="register">

                </form:form>
				<!-- //// LOGIN FORM //////////////////////// -->
				<form:form class="col bg-info m-2 round p-2" action="/login"
					method="POST" modelAttribute="newLogin">
					<h2><strong>Log-In</strong></h2>
					<div class="form-group">
						<label>Email:</label> <strong> <form:errors path="email"
								class="text-danger alert mb-3" />
						</strong>
						<form:input path="email" class="form-control mb-3" />
					</div>
					<div class="form-group">
						<label>Password:</label> <strong> <form:errors
								path="password" class="text-danger alert mb-3" />
						</strong>
						<form:password path="password" class="form-control mb-3" />
					</div>
					<input type="submit" value="Login" class="btn btn-success btn-sm round mb-3" />
				</form:form>
			</div>
		</div>
	</main>

	
	<script src="/webjars/jquery/jquery.min.js"></script>
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/app.js"></script>
</body>
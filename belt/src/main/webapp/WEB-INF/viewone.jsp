<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><c:out value = "${course.name}"/></title>
</head>
<body>
<nav> 
<h1><c:out value = "${course.name}" /></h1>
<a href="/welcome">Home</a>

</nav>

<div>
	<h3> Day:<c:out value = "${course.day}"/> </h3>

</div>
		

<div>
<h3> Here is <c:out value = "${course.name}"/> with <c:out value = "${course.user.userName}"/></h3>

</div>
<h3> Price:<c:out value = "${course.price}"/> </h3>
<h2>Description:<c:out value = "${course.description}"/></h2>
<div>

</div>

<div>
<c:set var="userID" value='<%= session.getAttribute("userId") %>'/>
		<c:if test="${userID == course.user.id}">
			<div class="d-flex justify-content-end">
				<a class="btn btn-primary me-2" href="/courses/${course.id}/edit"><button>Edit</button></a>
				<form class="col" action="/courses/${ course.id }/delete"
													method="post">
													<input type="hidden" name="_method" value="delete">
													<!-- ### Converts method of form to DELETE ### -->
													<button class="btn btn-danger btn-sm round">Delete</button>
												</form>
		</c:if>

</div>

</body>
</html>
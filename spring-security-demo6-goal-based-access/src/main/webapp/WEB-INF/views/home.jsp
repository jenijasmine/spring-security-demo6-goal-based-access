<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to my home page!!</title>
</head>
<body>
	<h1>Welcome to home page!!</h1>
	<hr />
	
	<p>
	User: <security:authentication property="principal.username"/>
	<br><br>
	Role(s): <security:authentication property="principal.authorities"/>
	<hr/>
	
	</p>
	<p>Lorem dfkmd dddddddddd ssssssssssssss wwwwwwwwwwwwwwwwwww
		ddddddddd</p>
	<hr />
	<p>
	<security:authorize access="hasRole('MANAGER')">
	<a href="${pageContext.request.contextPath}/leaders">Leaders page</a>
	</security:authorize>
	</p>
	
	<p>
	<security:authorize access="hasRole('ADMIN')">
	<a href="${pageContext.request.contextPath}/systems">Systems page</a>
	</security:authorize>
	</p>
	
	<security:authorize access="hasRole('SUPERVISOR')">
	<a href="${pageContext.request.contextPath}/supervisors">Supervisors page</a>
	</security:authorize>
	</p>
	
	<form:form action="${pageContext.request.contextPath}/logout"
		method="POST">
		<button type="submit">Logout</button>

	</form:form>
</body>
</html>
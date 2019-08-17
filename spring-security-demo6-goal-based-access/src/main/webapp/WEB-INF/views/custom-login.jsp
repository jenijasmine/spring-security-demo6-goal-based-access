<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style type="text/css">
	.error {
		color:red;
	}
	.loggedout {
		color:blue;
	}
</style>
<title>Insert title here</title>
</head>
<body>
	<h1>My custom form</h1>

	<form action="${pageContext.request.contextPath}/authenticateTheUser"  method="POST">
	<c:if test="${param.error != null}">
	<em class="error">Wrong credentials!!</em>
	</c:if>
	<c:if test="${param.logout != null}">
	<em class="loggedout">you have been logged out!!</em>
	</c:if>
		<p>
			Username: <input type="text" name="username" />
		</p>
		<p>
			Password: <input type="password" name="password" />
		</p>
		<button type="submit">Login</button>
		
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		
	</form>

</body>
</html>
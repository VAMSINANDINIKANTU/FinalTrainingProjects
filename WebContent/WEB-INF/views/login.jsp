<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"">
<title>Book app login page</title>
<style type="text/css">
.error {
	color: red;
	font-family: san-serif;
	font-style: italic;
}

body {
	background-color: skyblue;
}
</style>
</head>

<body>
	${error}
	<br /> ${message}
	<br />
	<h2>
		<Center>Enter Login!!Details</Center>
	</h2>
	<form:form action="login" method="post" modelAttribute="userbean">
		<br />
		<table align="center" width=40% bgcolor="Aqua">
			<tr>
				<td>Enter email</td>
				<td><form:input path="email" /> <form:errors path="email"
						class="error" /><br /></td>

			</tr>
			<tr>
				<td>Enter password</td>
				<td><form:input path="password" type="password" /> <form:errors
						path="password" class="error" /><br /></td>
			</tr>
			<tr>
				<td><input type="submit" name="login" value="login" /></td>
			</tr>
		</table>
	</form:form>

</body>
</html>
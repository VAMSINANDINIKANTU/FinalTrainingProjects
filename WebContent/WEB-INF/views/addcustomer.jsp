<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script>
	function goBack() {
		window.history.back();
	}
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add customer page</title>
<style type="text/css">
.error {
	color: blue;
	font-family: serif;
	font-style: italic;
}
</style>
</head>
<body>
	<h2>
		<Center>Add Customer Details</Center>
	</h2>
	<form:form action="addcustomer" method="post" modelAttribute="customer">

		<form:hidden path="id" />
		

Enter name        :<form:input path="name" />
		<form:errors path="name" class="error" />
		<br />
		<br />
Enter address     :<form:input path="address" />
		<form:errors path="address" class="error" />
		<br />
		<br />
Enter email       :<form:input path="email" />
		<form:errors path="email" class="error" />
		<br />
		<br />
		
		
Enter phone number:<form:input path="phoneno" />
		<form:errors path="phoneno" class="error" />
		<br />
		<br />

		<td><input type="submit" name="enter" value="enter" /></td>
	</form:form>
	<button onclick="goBack()">Go Back</button>

</body>
</html>
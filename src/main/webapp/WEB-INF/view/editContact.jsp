<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<link rel="stylesheet"  href="/css/custom.css">
</head>
	<body>
		
		<form:form action="updateContactDetail" method="post" modelAttribute="contact">
		<div class="curlycontainer">
		<h3>Edit Contact</h3>
			<table class="one" border="2">
				<tr>
					<th>First Name:</th>
					<!--  <td><input type="text" name="firstName" id="firstName" value="${contact.firstName}" maxlength="30" /></td> -->
					<td><form:input path="firstName" readonly="true"/></td>
				</tr>
				<tr>
					<th>Last Name:</th>
					<!--  <td><input type="text" name="lastName" id="lastName" maxlength="30"/></td>-->
					<td><form:input path="lastName" readonly="true"/></td>
				</tr>
				<tr>
					<th>Email Id:</th>
					<!-- <td><input type="text" name="emailId" id="emailId" maxlength="50" /></td> -->
					<td><form:input path="emailId" id="emailId" maxlength="50"/></td>
				</tr>
				<tr>
					<th>Contact Number:</th>
					<!-- <td><input type="text" name="contactNo" maxlength="10" id="contactNo" /></td> -->
					<td><form:input path="contactNo" maxlength="10" id="contactNo"/></td>
				</tr>
				<%-- <tr>
					<td>Status:</td>
					<!-- <td><input type="text" name="status" id="emailId" maxlength="50" /></td> -->
					<td><form:input path="status" id="status"/></td>
				</tr> --%>
				<tr>
				    <th>Status:</th>
				    <td>
					    <form:select path="status">  
	                        <form:option value="A" label="Active"/>  
	                        <form:option value="I" label="Inactive"/>  
	                    </form:select> 
                    </td>
				</tr>
				<form:hidden path="id" />
			</table>
			<table class="two">
				<tr class="trone">
					<td class="tdone"><input type="submit" class = "button" value="Update" /></td>
				</tr>
			</table>
		</div>	
		</form:form>	
	</body>
</html>

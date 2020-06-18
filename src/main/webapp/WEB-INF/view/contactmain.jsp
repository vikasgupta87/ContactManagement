<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
 
   function addContact(form) {
	   document.getElementById('contactForm').action = "/addContact";
	   form.submit();	   
   }

   function deleteContact(form) {
	   /* if(document.getElementById('id').checked == ){
		   alert("Please select one record");
		   return false;
	   } */
	   if (confirm("Are you Sure, want to Delete?")) {
		    document.getElementById('contactForm').action = "/deleteContact";
			form.submit();
	   } else {
		    console.log("Delete ");
	   }
   }

   function editContact(form){
	   /* if(document.getElementById('id').checked == false){
		   alert("Please select one record");
		   return false;
	   } */
	   if (confirm("Are you Sure, want to Edit?")) {
		    document.getElementById('contactForm').action = "/editContact";
			form.submit();
	   } else {
		    console.log("Delete ");
	   }
   }
</script>

<html>
<head>
<link rel="stylesheet"  href="/css/custom.css">
</head>
	<!-- <form method="get" action="addContact"> -->
	<form name="contactForm" id="contactForm" method="get">
	<div class="curlycontainer">
	<h3> Contact List</h3>
		<table class="one" border="2">
			<tr>
				<th>Select</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Email Id</th>
				<th>Mobile No</th>
				<th>Status</th>
				<th>Activate/Deactivate</th>
			</tr>
			<c:forEach items="${contactlist}" var="contact">
			<tr>
				<%-- <td><a href="/editContact?id=${contact.id }">${contact.id }</a></td> --%>
				<td><input id="id" name="id" type="radio" value="${contact.id }"/>
				<td>${contact.firstName }</td>
				<td>${contact.lastName }</td>
				<td>${contact.emailId }</td>
				<td>${contact.contactNo }</td>
				<td>${contact.status }</td>
				<td>
					<c:if test="${contact.status == 'A'}">
						<!-- <a href ="deactivate">Deactivate</a> -->
						<a href ="/updateStatus?id=${contact.id}&status=${contact.status}">Deactivate</a>
					</c:if>
					<c:if test="${contact.status == 'I'}">
						<!-- <a href ="activate">Activate</a> -->
						<a href ="/updateStatus?id=${contact.id}&status=${contact.status}">Activate</a>
					</c:if>
					
					<%-- <c:if test="${contact.status == 'A'}">
						Active
					</c:if>
					<c:if test="${contact.status == 'I'}">
						Inactive
					</c:if> --%>
				</td>
			</tr>
			</c:forEach> 
			
		</table>
		<br>
		
		<table class="two">
			<tr class="trone">
				<td class="tdone"><input type="submit" class = "button" id="add" value="Add New Contact" onclick="addContact(this.form);"/></td>
				<td class="tdone"><input type="submit" class = "button" id="edit" value="Edit Contact" onclick="editContact(this.form);"/></td>
				<td class="tdone"><input type="submit" class = "button" id="delete" value="Delete Contact" onclick="deleteContact(this.form);"/></td>
			</tr>
		</table>
	</div>
	</form>
</html>
<script type="text/javascript">
    function myFunction() {
      alert("Valiate Function call");  
      var firstName = document.getElementById('firstName').value;
      var lastName = document.getElementById('firstName').value;
      var contactNo = document.getElementById('contactNo').value;
      var emailId = document.getElementById('emailId').value;
      var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
      var letters = /^[A-Za-z]+$/;
      var mobileno = /^((\\+91-?)|0)?[0-9]{10}$/;
      
      if(!firstName.match(letters) && !lastName.match(letters)) {
    	  alert("Name should contain only alphabet!");
          return false;
      }
      if(!emailId.match(mailformat)) {
    	  alert("You have entered an invalid email address!");
          return false;
      } 
      if(!contactNo.match(mobileno)) {
    	  alert("Contact Number should be Numberic!");
          return false;
      }
      return true;
}
</script>
<html>
<head>
<link rel="stylesheet"  href="/css/custom.css">
</head>
	<body>
		<form id = "addNewContact" name ="addNewContact" method="post" action = "addNewContact" onsubmit="return myFunction();" >
		<div class="curlycontainer">
		<h2>Add New Contact</h2>
			<table class="one" border="2">
				<tr>
					<th>First Name:</th>
					<td><input type="text" name="firstName" id="firstName" maxlength="30" /></td>
				</tr>
				<tr>
					<th>Last Name:</th>
					<td><input type="text" name="lastName" id="lastName" maxlength="30"/></td>
				</tr>
				<tr>
					<th>Email Id:</th>
					<td><input type="text" name="emailId" id="emailId" maxlength="50" /></td>
				</tr>
				<tr>
					<th>Contact Number:</th>
					<td><input type="text" name="contactNo" maxlength="10" id="contactNo" /></td>
				</tr>
			</table>
			<table class="two">
				<tr class="trone">
					<td class="tdone"><input type="submit" class = "button" value="Add Contact"  /></td>
				</tr>
			</table>
		  </div>
		</form>
	</body>
</html>

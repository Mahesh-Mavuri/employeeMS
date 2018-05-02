function removeEmployee(i)
{
	  var xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
		 
		  if (this.readyState == 4 && this.status == 200) {
	      document.getElementById("fullTable").innerHTML = this.responseText;
	      console.log(this.responseText);
	    }
	  };
	  xhttp.open("GET", "removeEmployee.jsp?id="+i, true);
	  xhttp.send();
}
function addEmployee()
{	
	document.getElementById('id01').style.display='block';
	document.getElementById('addfname').value="";
	document.getElementById('addlname').value="";
	document.getElementById('addemail').value="";
	document.getElementById('addphone').value="";
	
}
function editEmployee(id,fname,lname,email,phone)
{	
	
	
	document.getElementById('fname').value=name;
	document.getElementById('lname').value=branch;
	document.getElementById('email').value=email;
	document.getElementById('phone').value=phone;
	document.getElementById('id02').style.display='block';
}
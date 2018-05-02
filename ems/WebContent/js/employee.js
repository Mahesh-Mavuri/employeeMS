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
	alert(" "+fname+" "+lname+" "+phone+" "+email+" "+id);
	
	document.getElementById('editfname').value=fname;
	document.getElementById('editlname').value=lname;
	document.getElementById('editemail').value=email;
	document.getElementById('editphone').value=phone;
	document.getElementById('identity').value=id;
	document.getElementById('id02').style.display='block';
	alert(" "+fname+" "+lname+" "+phone+" "+email+" "+id+"maheshmavuri");
}
<%@page import="com.Employee"%>
<%@page import="com.Employeedao"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/employee.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<title>EmployeeManagementSystem</title>
</head>
<body>
	<div>
		<h1>Employee Management System</h1>
	</div>


	<div class="container" id="fullTable">
		<div>
			<button onclick="addEmployee()" style="width: auto;">Add
				Employee</button>
			<div id="id01" class="modal">
				<form class="modal-content animate" action="" method="post"
					style="padding: 30px; width: 30%;" id="Add">
					<div class="input-group">
						<label for="addfname"><b>First Name</b></label> <input type="text"
							class="form-control" placeholder="Enter First name"
							name="addfname" id="addfname" required><br> <label
							for="addlname"><b>Last name</b></label> <input type="text"
							class="form-control" placeholder="Enter Last name"
							name="addlname" id="addlname" required><br> <label
							for="addemail"><b>Email</b></label> <input type="email"
							class="form-control" placeholder="Enter Email" name="addemail"
							id="addemail" required><br> <label for="addphone"><b>Phone</b></label>
						<input type="text" class="form-control"
							placeholder="Enter phone number" name="addphone" id="addphone"
							required><br>
							<input type="hidden" name="adderror"  id="adderror" value="1">
						<button type="submit" id="addEmp" name="addEmp">Submit</button>
						<button type="button"
							onclick="document.getElementById('id01').style.display='none'"
							class="cancelbtn">Cancel</button>
					</div>
				</form>
			</div>
			<div id="id02" class="modal">
				<form class="modal-content animate" action="" method="post"
					style="padding: 30px; width: 30%;" id="Edit">
					<div class="input-group">
						<label for="editfname"><b>First Name</b></label> <input
							type="text" class="form-control" value=""
							placeholder="Enter First name" name="editfname" id="editfname"
							required><br> <label for="editlname"><b>Last
								name</b></label> <input type="text" class="form-control" value=""
							placeholder="Enter Last name" name="editlname" id="editlname"
							required><br> <label for="editemail"><b>Email</b></label>
						<input type="email" class="form-control" value=""
							placeholder="Enter Email" name="editemail" id="editemail"
							required><br> <label for="editphone"><b>Phone</b></label>
						<input type="text" class="form-control" value=""
							placeholder="Enter phone number" name="editphone" id="editphone"
							required><br> <input type="hidden" name="identity" id="identity" value="">
						<button type="submit" value="submit" id="submit">Submit</button>
						<button type="button"
							onclick="document.getElementById('id02').style.display='none'"
							class="cancelbtn">Cancel</button>
					</div>
				</form>
			</div>
		</div>
		<table class="table">
			<thead>
				<tr>
					<th>#</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email</th>
					<th>Phone</th>
					<th>DOJ</th>
				</tr>
			</thead>
			<tbody>

				<%
					
					if (request.getParameter("addfname") != null && request.getParameter("adderror")!= null ) {
						Employeedao addEmp1 = new Employeedao();
						boolean update = false;
						
						String fname = request.getParameter("addfname");
						String lname = request.getParameter("addlname");
						String email = request.getParameter("addemail");
						String phone = request.getParameter("addphone");
						String fna = request.getParameter("adderror");
						System.out.println("add employee " + fname + " "+lname +" "+ email +" "+ phone+" "+fna);
						update = addEmp1.addEmployee(fname, lname, email, phone);
						//System.out.println(request.getParameterValues("addfname").toString());
						request.setAttribute("adderror",null);
						fna = request.getParameter("adderror");
						System.out.println("add employee after db insert " + fname + " "+lname + " "+email + " "+phone+"fna    "+fna);
						Employee[] allemployee = addEmp1.getall();
						int k = 1;
						for (int i = 0; i < allemployee.length; i++) {
							if (allemployee[i].getStatus().equals("1")) {
				%>
				<tr>
					<td><%=k++%></td>
					<td>
						<%
							out.print(allemployee[i].getFname());
						%>
						
					</td>
					<td>
						<%
							out.print(allemployee[i].getLname());
						%>
					</td>
					<td>
						<%
							out.print(allemployee[i].getEmail());
						%>
					</td>
					<td>
						<%
							out.print(allemployee[i].getPhone());
						%>
					</td>
					<td>
						<%
							out.print(allemployee[i].getDoj());
						%>
					</td>
					<td><button type="button" class="btn btn-default btn-xs"
							style="color: green; border: none; padding: 0; background: none;"
							onclick="editEmployee('<%=allemployee[i].getId()%>','<%=allemployee[i].getFname()%>','<%=allemployee[i].getLname()%>','<%=allemployee[i].getEmail()%>','<%=allemployee[i].getPhone()%>')"
							name="<%=allemployee[i].getId()%>">
							<span class="glyphicon glyphicon-pencil"></span>
						</button>
						<button type="button" class="btn btn-default btn-xs"
							style="color: red; border: none; padding: 0; background: none;"
							onclick="removeEmployee(<%=allemployee[i].getId()%>)"
							name="<%=allemployee[i].getId()%>">
							<span class="glyphicon glyphicon-remove-sign"></span>
						</button>
				</tr>
				<%
					}
						}
					} else if (request.getParameter("editfname") != null) {
						Employeedao e = new Employeedao();
						Employee[] all = e.getall();
						int k = 1;
						String fname = request.getParameter("editfname");
						String lname = request.getParameter("editlname");
						String email = request.getParameter("editemail");
						String phone = request.getParameter("editphone");
						String id1 = request.getParameter("identity");
						System.out.println("edit employee" +fname+" "+lname+" "+email+" "+phone+" "+request.getParameter("identity"));
						int j = Integer.parseInt(id1);
						Employee e1 = new Employee();
						String firstname1 = e1.getfNamewithId(j);
						for (int i = 0; i < all.length; i++) {
							if (all[i].getStatus().equals("1")) {
								if (all[i].getFname().equals(firstname1)) {
									boolean edited = all[i].editEmployee(fname, lname, email, phone,id1);
								}
				%>
				<tr>
					<td><%=k++%></td>
					<td>
						<%
							out.print(all[i].getFname());
						%>
					</td>
					<td>
						<%
							out.print(all[i].getLname());
						%>
					</td>
					<td>
						<%
							out.print(all[i].getEmail());
						%>
					</td>
					<td>
						<%
							out.print(all[i].getPhone());
						%>
					</td>
					<td>
						<%
							out.print(all[i].getDoj());
						%>
					</td>
					<td><button type="button" class="btn btn-default btn-xs"
							style="color: green; border: none; padding: 0; background: none;"
							onclick="editEmployee('<%=all[i].getId()%>','<%=all[i].getFname()%>','<%=all[i].getLname()%>','<%=all[i].getEmail()%>','<%=all[i].getPhone()%>')"
							name="<%=all[i].getId()%>">
							<span class="glyphicon glyphicon-pencil"></span>
						</button>
						<button type="button" class="btn btn-default btn-xs"
							style="color: red; border: none; padding: 0; background: none;"
							onclick="removeEmployee(<%=all[i].getId()%>)"
							name="<%=all[i].getId()%>">
							<span class="glyphicon glyphicon-remove-sign"></span>
						</button>
				</tr>
				<%
					}
							}
						}
					 else {
						//System.out.println("hello");
						Employeedao ed = new Employeedao();
						Employee[] allemployees = ed.getall();
						int k = 1;
						for (int i = 0; i < allemployees.length; i++) {
							if (allemployees[i].getStatus().equals("1")) {
				%>
				<tr>
					<td><%=k++%></td>
					<td>
						<%
							out.print(allemployees[i].getFname());
						%>
					</td>
					<td>
						<%
							out.print(allemployees[i].getLname());
						%>
					</td>
					<td>
						<%
							out.print(allemployees[i].getEmail());
						%>
					</td>
					<td>
						<%
							out.print(allemployees[i].getPhone());
						%>
					</td>
					<td>
						<%
							out.print(allemployees[i].getDoj());
						%>
					</td>
					<td><button type="button" class="btn btn-default btn-xs"
							style="color: green; border: none; padding: 0; background: none;"
							onclick="editEmployee('<%=allemployees[i].getId()%>','<%=allemployees[i].getFname()%>','<%=allemployees[i].getLname()%>','<%=allemployees[i].getEmail()%>','<%=allemployees[i].getPhone()%>')"
							name="<%=allemployees[i].getId()%>">
							<span class="glyphicon glyphicon-pencil"></span>
						</button>
						<button type="button" class="btn btn-default btn-xs"
							style="color: red; border: none; padding: 0; background: none;"
							onclick="removeEmployee(<%=allemployees[i].getId()%>)"
							name="<%=allemployees[i].getId()%>">
							<span class="glyphicon glyphicon-remove-sign"></span>
						</button>
				</tr>
				<%
			}
		}
		}
		%>

			</tbody>
		</table>
	</div>

</body>
</html>
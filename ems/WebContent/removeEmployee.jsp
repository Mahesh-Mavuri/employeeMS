<%@page import="com.Employee"%>
<%@page import="com.Employeedao"%>
<body>
	<script type="text/javascript" src="js/employee.js"></script>
	
	<div class="container" id="fullTable">
	<div>
		<input type="button" class="btn" value="Add Employee" onclick="addEmployee()">
	</div><table class="table">
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
				Employeedao ed = new Employeedao();
				Employee[] allemployees = ed.getall();
				int k = 1;
				int j = Integer.parseInt(request.getParameter("id"));
				Employee emp1 = new Employee();
				String firstname = emp1.getfNamewithId(j);
				for (int i = 0; i < allemployees.length; i++) {
					if (allemployees[i].getStatus().equals("1")) {
						if (allemployees[i].getFname().equals(firstname)) {
							allemployees[i].setOperatorStatus("0", Integer.parseInt(allemployees[i].getId()));
							continue;
						}
			%><tr>
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
						style="color: green; border: none; padding: 0; background: none;">
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
		%>
		</tbody>
	</table>
	</div>
</body>
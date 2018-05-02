package com;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Employee {
	private String id;
	private String fname;
	private String lname;
	private String email;
	private String phone;
	private String doj;
	private String status;
	public Employee()
	{
		
	}
	public Employee(String id, String fname, String lname, String email, String phone, String doj, String status) {
		this.id = id;
		this.fname = fname;
		this.lname = lname;
		this.email = email;
		this.phone = phone;
		this.doj = doj;
		this.status = status;
	}

	public String getfNamewithId(int id) throws SQLException {
		String name = "";
		try(Connection con = Employeedao.getConnection())
		{
			System.out.println("connected");

			String sqlQuery="SELECT fname from database.employee WHERE id=?";
			PreparedStatement pstmt = con.prepareStatement(sqlQuery);
			pstmt.setInt(1,id);
			ResultSet Name = pstmt.executeQuery();
			if(Name.next())
			{
				name = Name.getString(1);
			}

		}
		return name;
	}

	public void setOperatorStatus(String status, int id) throws SQLException {
		try(Connection con = Employeedao.getConnection())
		{
			String sqlQuery="UPDATE employee SET status=0 WHERE id=?";
			PreparedStatement pstmt = con.prepareStatement(sqlQuery);
			pstmt.setInt(1,id);
			int updated = pstmt.executeUpdate();
			//System.out.println("rows affected"+updated);
			this.status = status;
		}


	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getDoj() {
		return doj;
	}

	public void setDoj(String doj) {
		this.doj = doj;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	
	
	
}

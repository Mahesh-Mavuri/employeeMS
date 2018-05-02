package com;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
public class Employeedao {

	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
	static final String DB_URL = "jdbc:mysql://localhost/";
	static String dbName="database";
	static final String USER = "root";
	static final String PASS = "admin";
	public static Connection getConnection()
	{
		Connection conn=null;
		try {

			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(DB_URL+dbName, USER, PASS);
			System.out.println("connected");
			
		} catch (SQLException ex) {
			throw new RuntimeException("Error connecting to the database", ex);
		} catch (ClassNotFoundException e) {

			e.printStackTrace();
		}
		return conn;
	}
	public Employee[] getall() throws SQLException
	{	
	Connection abc = getConnection();
	String sql = "select * from employee";
	PreparedStatement pstmt = abc.prepareStatement(sql);
	ResultSet result = pstmt.executeQuery();
	result.last();
	int row = result.getRow();
	result.beforeFirst();
	result.next();
	Employee[] allEmp = new Employee[row];
	for(int i=0;i<row;i++)
	{
	Employee emp = new Employee(result.getString(1),result.getString(2),result.getString(3),result.getString(4),result.getString(5),result.getString(6),result.getString(7));
	allEmp[i]= emp;
	result.next();
	}
	
		return allEmp;
		
	}
	public boolean addEmployee(String fname, String lname, String email, String phone) throws SQLException
	{
		boolean flag=false;
		Connection con =getConnection();
		String insertQuery = "insert into employee(fname, lname, email, phone) values(?,?,?,?)";
		PreparedStatement pstmt = con.prepareStatement(insertQuery);
		pstmt.setString(1, fname);
		pstmt.setString(2, lname);
		pstmt.setString(3, email);
		pstmt.setString(4, phone);
		int affected_row = pstmt.executeUpdate();
		if(affected_row>0) {
			flag = true;
			//System.out.println("database updated");
		}
		
		return flag;
		
	}
	
	
}

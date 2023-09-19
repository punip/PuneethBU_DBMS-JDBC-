package com.gl.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class EmployeeConnection {
	
	Connection con = null;
	String user = "root";
	String url = "jdbc:mysql://localhost:3306/gl";
	String password = "root";
	
	public Connection getConnection() {
		
		
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gl","root","root");
		
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return con;
	
	}
}

package com.gl.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.gl.connection.EmployeeConnection;

import com.gl.model.Employee;

public class EmployeeDAOimpl implements EmployeeDAO {

	
	Connection con;
	ResultSet rs;
	Statement stmt;
	PreparedStatement pstmt;
	Employee employee;
	ArrayList <Employee> employees;
	EmployeeConnection mycon;
	
	public boolean insertEmployee(Employee emp) {
		// TODO Auto-generated method stub		
		int count=0;
		try {
		Connection con = new  EmployeeConnection().getConnection();
		Statement st = con.createStatement();
		String sql =
				"insert into employee values("+emp.getId()
				+",'"+emp.getName()
				+"','"+emp.getEmail_id()
				+"','"+emp.getPhone_Number()+"')";
		
		count = st.executeUpdate(sql);
		}catch(SQLException e) {
			e.printStackTrace();
		}
	
		if(count!=0)
			return true;
		else
		return false;
	}
	
	public boolean  updateEmailAndPhone(Employee emp) {
		{
			boolean flag = false;
			int count=0;
			try {
				
			Connection con = new  EmployeeConnection().getConnection();
			
			String sql = "update employee set name = ?,"
					+ "email_id=?,"
					+ "phone_number=?"
					+ "where id=?";
			
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, emp.getName());
			pst.setString(2, emp.getEmail_id());
			pst.setString(3, emp.getPhone_Number());
			pst.setInt(4, emp.getId());
			
			
			 count = pst.executeUpdate();
			if(count !=0 )
				flag = true;
					
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			return flag;	
		}	
	}
	
	public boolean deleteEmployeeByID(int id) {
		
			int count=0;
			try {
			Connection con = new  EmployeeConnection().getConnection();
			Statement st = con.createStatement();
			String sql = "delete from employee where Id ="+ id;
			
			count = st.executeUpdate(sql);
			}catch(SQLException e) {
				e.printStackTrace();
			}
			
			if(count==0)
				return false;
			else
				return true;		
	}
}

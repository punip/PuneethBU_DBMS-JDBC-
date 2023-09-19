package com.gl.dao;

import com.gl.model.Employee;

public interface EmployeeDAO {
	
	public boolean insertEmployee(Employee emp);
	
	public boolean  updateEmailAndPhone(Employee emp);
	
	public boolean deleteEmployeeByID(int id);

}

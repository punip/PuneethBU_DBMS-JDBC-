package com.gl.service;

import com.gl.dao.EmployeeDAOimpl;
import com.gl.model.Employee;

public class EmployeeService {

	EmployeeDAOimpl dao = new EmployeeDAOimpl();
	
	public boolean insertEmployee(Employee emp) {
		return dao.insertEmployee(emp);
	
	}
	
	public boolean  updateEmailAndPhone(Employee emp) {
		return dao.updateEmailAndPhone(emp);
		
	}
	
	public boolean deleteEmployeeByID(int id) {
		return dao.deleteEmployeeByID(id);
		
	}
}

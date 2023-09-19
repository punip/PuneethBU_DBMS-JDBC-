package com.gl.model;

public class Employee {
	int Id ; 
	String Name;
	String Email_id;
	String Phone_Number;
	public Employee() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Employee(int id, String name, String email_id, String phone_Number) {
		super();
		Id = id;
		Name = name;
		Email_id = email_id;
		Phone_Number = phone_Number;
	}
	@Override
	public String toString() {
		return "Employee [Id=" + Id + ", Name=" + Name + ", Email_id=" + Email_id + ", Phone_Number=" + Phone_Number
				+ "]";
	}
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getEmail_id() {
		return Email_id;
	}
	public void setEmail_id(String email_id) {
		Email_id = email_id;
	}
	public String getPhone_Number() {
		return Phone_Number;
	}
	public void setPhone_Number(String phone_Number) {
		Phone_Number = phone_Number;
	}
	
}

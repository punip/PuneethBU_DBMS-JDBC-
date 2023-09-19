package com.gl.client;

import java.util.ArrayList;
import java.util.Scanner;

import com.gl.model.Employee;
import com.gl.service.EmployeeService;

public class EmployeeClient {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		int choice =0;
		EmployeeService service = new EmployeeService();
		Scanner sc = new Scanner(System.in);
		do
		{
		System.out.println("1.Insert Employee Record");
		System.out.println("2.Delete employee ID");
		System.out.println("3.Update employee");
		System.out.println("4.Exit");
		System.out.println("Enter your choice: ");
		choice = Integer.parseInt(sc.next());
		switch(choice) {
		
		case 1: 
			System.out.println("Enter the Id");
			int id = sc.nextInt();
			System.out.println("EnterName");
			String name = sc.next();
			System.out.println("Enter  email");
			String email_id = sc.next();
			System.out.println("Enter Phone");
			String phone_number = sc.next();

		
			Employee emp = new Employee(id, name, email_id, phone_number);
			if(service.insertEmployee(emp))
				System.out.println("Record Inserted");
			else
				System.out.println("Record not inserted");
			break;
			
		case 2: 
			System.out.println("Enter the employeeId");
			id = sc.nextInt();
			if(service.deleteEmployeeByID(id)) {
				System.out.println("Deleted employee record");
			}
			else {
				System.out.println("No such employee exist");
			}
			break;
			
		case 3: 
			System.out.println("Enter the Id");
			 id = sc.nextInt();
			System.out.println("EnterName");
			 name = sc.next();
			System.out.println("Enter  email");
			 email_id = sc.next();
			System.out.println("Enter Phone");
			 phone_number = sc.next();

			 Employee emp1 = new Employee(id, name, email_id, phone_number);
			
			if(service.updateEmailAndPhone(emp1))
				System.out.println("Record updated");
			else
				System.out.println("Record not updated");
			break;
		
		case 4: 
			break;
		}
		}while(choice!=4);
	}

	}


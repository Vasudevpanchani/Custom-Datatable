package com.example.customdatatable.service;

import java.util.List;

import org.springframework.http.ResponseEntity;

import com.example.customdatatable.model.Employee;

public interface EmployeeService {
	
	public ResponseEntity<List<Employee>> getAllEmployees();
	public ResponseEntity<Employee> getEmployeeById(long id);
	public ResponseEntity<Employee> addEmployee(Employee employee);
	public ResponseEntity<Employee> deleteEmployee(long id);
	public ResponseEntity<Employee> updateEmployee(Employee employee);

}

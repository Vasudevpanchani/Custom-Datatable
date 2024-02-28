package com.example.customdatatable.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.customdatatable.model.Employee;
import com.example.customdatatable.service.EmployeeService;

@RestController
public class EmployeeRestController {
	
	@Autowired
	private EmployeeService employeeService;
	
	@GetMapping("/employees")
	public ResponseEntity<List<Employee>> getAllEmployees(){
		return employeeService.getAllEmployees();
	}
    @GetMapping("/employee/{id}")
	public ResponseEntity<Employee> getEmployeeById(@PathVariable("id") long id){
		return employeeService.getEmployeeById(id);
	}
    
    @PostMapping("/employee/add")
    public ResponseEntity<Employee> addEmployee(@RequestBody Employee employee) {
        return employeeService.addEmployee(employee);
    }
    
    @DeleteMapping("/deleteEmployee/{id}")
    public ResponseEntity<Employee> deleteProduct(@PathVariable Long id) {
        return employeeService.deleteEmployee(id);
    }
    
    @PutMapping("/editEmployee")
    public ResponseEntity<Employee> updateEmployee(@RequestBody Employee employee) {
        return employeeService.updateEmployee(employee);
    }
    

}

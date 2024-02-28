package com.example.customdatatable.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.example.customdatatable.model.Employee;
import com.example.customdatatable.repository.EmployeeRepository;

@Service
public class EmployeeServiceImpl implements EmployeeService {

	@Autowired
	private EmployeeRepository employeeRepository;

	@Override
	public ResponseEntity<List<Employee>> getAllEmployees() {
		try {
			List<Employee> all = employeeRepository.findAll();
            return new ResponseEntity<>(all, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
	}

	@Override
	public ResponseEntity<Employee> getEmployeeById(long id) {
		try {
			Employee employee = employeeRepository.findById(id).get();
            return new ResponseEntity<>(employee, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
	}

	@Override
	public ResponseEntity<Employee> addEmployee(Employee employee) {
		try {
            Employee employee2 = employeeRepository.save(employee);
            return new ResponseEntity<>(employee2, HttpStatus.CREATED);
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
	}

	@Override
	public ResponseEntity<Employee> deleteEmployee(long id) {
		Optional<Employee> employeeOptional = employeeRepository.findById(id);
        if (!employeeOptional.isPresent()) {
            return ResponseEntity.notFound().build();
        }
        employeeRepository.deleteById(id);
        return ResponseEntity.noContent().build();
    }

	@Override
	public ResponseEntity<Employee> updateEmployee(Employee employee) {
		Optional<Employee> employeeOptional = employeeRepository.findById(employee.getId());
		
		if (!employeeOptional.isPresent()) {
            return ResponseEntity.notFound().build();
        }
		
		Employee employee2 = employeeOptional.get();
		employee2.setName(employee.getName());
		employee2.setLastName(employee.getLastName());
		employee2.setEmail(employee.getEmail());
		employee2.setPhone(employee.getPhone());
		employee2.setActive(employee.getActive());
		employee2.setSalary(employee.getSalary());
        employeeRepository.save(employee2);
       
        return ResponseEntity.ok(employee2);
	}

}

package com.example.customdatatable.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.customdatatable.model.Employee;

@Repository("employeeRepository")
public interface EmployeeRepository extends JpaRepository<Employee, Long>{
	
	@Query("SELECT e FROM Employee as e ORDER BY e.id ASC")
	List<Employee> findAll();

}
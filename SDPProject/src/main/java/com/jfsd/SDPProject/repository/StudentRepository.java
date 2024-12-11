package com.jfsd.SDPProject.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.jfsd.SDPProject.model.Student;

@Repository
public interface StudentRepository extends JpaRepository<Student, Integer> 
{

	    @Query("SELECT s FROM Student s WHERE s.email = ?1 AND s.password = ?2")
	    Student checkStudentLogin(String email, String password);
	    @Query("SELECT s FROM Student s WHERE s.email = ?1")
	    Student findByMail(String email);

	}


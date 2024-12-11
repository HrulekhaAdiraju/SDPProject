package com.jfsd.SDPProject.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.jfsd.SDPProject.model.Achievement;
import com.jfsd.SDPProject.model.Student;

import java.util.Date;
import java.util.List;
import java.util.Optional;

public interface AchievementRepository extends JpaRepository<Achievement, Integer> {

	@Query("SELECT a FROM Achievement a WHERE a.id = :id")
	Optional<Achievement> findById(@Param("id") Integer id);


    // Find achievements by the student ID
    @Query("SELECT a FROM Achievement a WHERE a.studentId = ?1")
    List<Achievement> findByStudentId(int studentId);
    
    // Find achievements by the creation date
    @Query("SELECT a FROM Achievement a WHERE a.dateCreated = ?1")
    List<Achievement> findByDate(Date date);
    
    @Query("SELECT a FROM Achievement a WHERE a.status = :status")
    List<Achievement> findByStatus(@Param("status") String status);
    
    @Query("SELECT a FROM Achievement a WHERE a.category = ?1")
    List<Achievement> findByCategory(String category);
  
    @Query("SELECT DISTINCT a.category FROM Achievement a")
    List<String> findDistinctCategories();
    
    @Query("SELECT DISTINCT a.dateCreated FROM Achievement a")
    List<java.util.Date> findDistinctDates();  // Correctly returning java.util.Date



    @Query("SELECT DISTINCT s FROM Student s JOIN Achievement a ON s.id = a.studentId")
    List<Student> findDistinctStudents();




}

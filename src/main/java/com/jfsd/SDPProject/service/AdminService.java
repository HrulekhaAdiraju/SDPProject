package com.jfsd.SDPProject.service;

import java.sql.Date;
import java.util.List;

import com.jfsd.SDPProject.model.Achievement;
import com.jfsd.SDPProject.model.Admin;
import com.jfsd.SDPProject.model.Contact;
import com.jfsd.SDPProject.model.Student;

public interface AdminService
{
   List<Student> viewAllStudents();
   public Admin checkAdminLogin(String uname,String password);
   public long studentCount();
   public String deleteStudent(int id);
   public Student displayStudentById(int id);
   public Student displayStudentByMail(String email);
   public String addContact(Contact contact);
   public List<Achievement> getUnapprovedAchievements() ;
   public void approveAchievement(int achievementId) ;
   public String studentRegistration(Student student);
   public List<Achievement> getAchievementsByDate(Date date);
   public List<Achievement> getAchievementsByCategory(String category);
   public List<Achievement> getAchievementsByStudentId(int studentId);
   public List<String> getAllCategories();
   public List<Student> getAllStudents();
   public List<Achievement> getAllAchievements();
   
}

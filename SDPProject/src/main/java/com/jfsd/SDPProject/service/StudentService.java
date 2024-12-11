package com.jfsd.SDPProject.service;

import java.util.List;

import com.jfsd.SDPProject.model.Achievement;
import com.jfsd.SDPProject.model.Student;

public interface StudentService
{

	public String studentRegistration(Student student);
	public Student checkStudentLogin(String email,String password);
	public String updateStudent(Student student);
	public String addAchievement(Achievement achievement);
	public List<Achievement> viewAllAchievements(int id);
	//public Achievement displayAchievementById(int id);
}

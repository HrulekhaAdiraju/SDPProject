package com.jfsd.SDPProject.service;

import java.sql.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jfsd.SDPProject.model.Achievement;
import com.jfsd.SDPProject.model.Admin;
import com.jfsd.SDPProject.model.Contact;
import com.jfsd.SDPProject.model.Student;
import com.jfsd.SDPProject.repository.AchievementRepository;
import com.jfsd.SDPProject.repository.AdminRepository;
import com.jfsd.SDPProject.repository.ContactRepository;
import com.jfsd.SDPProject.repository.StudentRepository;


@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	private StudentRepository studentRepository;
	
	@Autowired
	private AdminRepository adminRepository;
	
	@Autowired
	private ContactRepository contactRepository;
	
	@Autowired
	private AchievementRepository achievementRepository;
	
	@Override
	public List<Student> viewAllStudents() {
		return studentRepository.findAll();
	}

	@Override
	public Admin checkAdminLogin(String uname, String password) {
		return adminRepository.checkAdminlogin(uname, password);
	}

	@Override
	public long studentCount() {
	    return studentRepository.count();
	}

	@Override
	public String deleteStudent(int id) {
		 studentRepository.deleteById(id);
		 return "Student deleted successfully";
	}

	@Override
	public Student displayStudentById(int id) {
	    return studentRepository.findById(id).orElse(null);
	}

	@Override
	public String addContact(Contact contact) {
		
		contactRepository.save(contact);
		return "query collected successfully";
	}
	@Override
	public Student displayStudentByMail(String email) {
		  return studentRepository.findByMail(email);
	}

	public List<Achievement> getUnapprovedAchievements() {
	    return achievementRepository.findByStatus("Not Approved");
	}
	public void approveAchievement(int achievementId) {
	    Achievement achievement = achievementRepository.findById(achievementId)
	            .orElseThrow(() -> new RuntimeException("Achievement not found"));
	    achievement.setStatus("Approved");
	    achievementRepository.save(achievement);
	}
	@Override
	public String studentRegistration(Student student)
	{
		studentRepository.save(student);
		return "Student Registered Successfully";
	}
	@Override
	  public List<Achievement> getAchievementsByDate(Date date) {
	        return achievementRepository.findByDate(date); // Calls the repository method to get achievements by date
	    }
	@Override
    public List<Achievement> getAchievementsByCategory(String category) {
        return achievementRepository.findByCategory(category); // Calls the repository method to get achievements by category
    }
	@Override
	 public List<Achievement> getAchievementsByStudentId(int studentId) {
	        return achievementRepository.findByStudentId(studentId); // Calls the repository method to get achievements by student ID
	    }
	@Override
	  public List<String> getAllCategories() {
	        return achievementRepository.findDistinctCategories(); // Fetch all distinct categories
	    }
	@Override
	public List<Student> getAllStudents() {
	    return achievementRepository.findDistinctStudents(); // Fetch distinct students from the database
	}
	public List<Achievement> getAllAchievements() {
        return achievementRepository.findAll();
    }
}

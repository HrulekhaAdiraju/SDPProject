package com.jfsd.SDPProject.service;

import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jfsd.SDPProject.model.Achievement;
import com.jfsd.SDPProject.model.Student;
import com.jfsd.SDPProject.repository.AchievementRepository;
import com.jfsd.SDPProject.repository.StudentRepository;


@Service
public class StudentServiceImpl implements StudentService {

	@Autowired
	private StudentRepository studentRepository;
	@Autowired
	private AchievementRepository achievementRepository;
	@Override
	public String studentRegistration(Student student)
	{
		studentRepository.save(student);
		return "Student Registered Successfully";
	}
	@Override
	public Student checkStudentLogin(String email, String password) {
		return studentRepository.checkStudentLogin(email,password);
	}
	@Override
	public String updateStudent(Student student) {
		
		Student s=studentRepository.findById(student.getId()).orElse(null);
		s.setName(student.getName());
		s.setGender(student.getGender());
		s.setDob(student.getDob());
		s.setPhoneno(student.getPhoneno());
		s.setYear(student.getYear());
		s.setBranch(student.getBranch());
		s.setSec(student.getSec());
		 if (student.getImage() != null) {
		        s.setImage(student.getImage());
		    }
		studentRepository.save(s);
		return "Student data updated successfully";
	}
	@Override
	public String addAchievement(Achievement achievement) {
		
		achievementRepository.save(achievement);
		return "Achievement unlocked!!!";
	}
	@Override
	public List<Achievement> viewAllAchievements(int id) {
		return achievementRepository.findByStudentId(id);
	}
	/*@Override
	public Achievement displayAchievementById(int id) {
		return achievementRepository.findById(id).orElse(null);
	}
	*/
	

}

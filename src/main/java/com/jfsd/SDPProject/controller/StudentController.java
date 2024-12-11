package com.jfsd.SDPProject.controller;
import org.springframework.http.HttpStatus;


import org.springframework.http.MediaType;
import java.io.IOException;
import org.springframework.http.ResponseEntity;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;
import javax.sql.rowset.serial.SerialBlob;
import java.sql.Blob;
import javax.sql.rowset.serial.SerialException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.jfsd.SDPProject.model.Achievement;
import com.jfsd.SDPProject.model.Admin;
import com.jfsd.SDPProject.model.Student;
import com.jfsd.SDPProject.service.StudentService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import java.sql.Date;
@Controller
public class StudentController

{
	@Autowired
	private StudentService studentService;

	@GetMapping("/")
	public ModelAndView home()
	{
		ModelAndView mv=new ModelAndView();
		mv.setViewName("home");
		return mv;
	}
	@GetMapping("contactUs")
	public ModelAndView contactUs()
	{
		ModelAndView mv=new ModelAndView();
		mv.setViewName("contactUs");
		return mv;
	}
	
	@GetMapping("displayCert")
	public ResponseEntity<byte[]> displayCert(@RequestParam int achievementId, HttpSession session) throws SQLException {
	    // Get the logged-in student from session
	    Student student = (Student) session.getAttribute("student");

	    if (student == null) {
	        // If student is not logged in, return error
	        return ResponseEntity.status(HttpStatus.FORBIDDEN).build();
	    }

	    // Fetch all the student's achievements
	    List<Achievement> achievements = studentService.viewAllAchievements(student.getId());

	    // Find the achievement with the specified id
	    Achievement achievement = achievements.stream()
	            .filter(ach -> ach.getId() == achievementId)
	            .findFirst()
	            .orElse(null);

	    if (achievement == null) {
	        // If the achievement is not found
	        return ResponseEntity.notFound().build();
	    }

	    // Check if the achievement is approved
	    if ("Approved".equals(achievement.getStatus())) {
	        byte[] imageBytes = achievement.getImage().getBytes(1, (int) achievement.getImage().length());
	        return ResponseEntity.ok()
	                .contentType(MediaType.IMAGE_JPEG)  // Set the content type to image/jpeg
	                .body(imageBytes);  // Return the image as a byte array in the response
	    } else {
	        // If not approved, return a message "Waiting for approval"
	        return ResponseEntity.status(HttpStatus.FORBIDDEN)
	                .body("Waiting for approval".getBytes());  // Send "Waiting for approval" text if not approved
	    }
	}


	@GetMapping("home")
	public ModelAndView renderHome()
	{
		ModelAndView mv=new ModelAndView();
		mv.setViewName("home");
		return mv;
	}
	@GetMapping("studentProfile")
	public ModelAndView studentProfile()
	{
		ModelAndView mv=new ModelAndView();
		mv.setViewName("studentProfile");
		return mv;
	}
	@GetMapping("updateProfile")
	public ModelAndView updateProfile()
	{
		ModelAndView mv=new ModelAndView();
		return mv;
	}
	@PostMapping("update")
	public ModelAndView update(HttpServletRequest request, @RequestParam("image") MultipartFile file, HttpSession session) throws IOException, SerialException, SQLException
	{
		ModelAndView mv=new ModelAndView("updateProfile");
		    int id = Integer.parseInt(request.getParameter("id"));
		   String name=request.getParameter("name");
		   String gender=request.getParameter("gender");
		   String dob=request.getParameter("dob");
		   String phoneno=request.getParameter("phoneno");
		   String year=request.getParameter("year");
		   String branch=request.getParameter("branch");
		   String sec=request.getParameter("sec");
		   String email=request.getParameter("email");
		   String password=request.getParameter("pwd");
		   byte[] bytes = file.getBytes();
		   Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);
		   Student student=new Student();
		   student.setId(id);
		   student.setName(name);
		   student.setGender(gender);
		   student.setDob(dob);
		   student.setPhoneno(phoneno);
		   student.setYear(year);
		   student.setBranch(branch);
		   student.setSec(sec);
		   student.setEmail(email);
		   student.setPassword(password);
		   student.setImage(blob);  
		   studentService.updateStudent(student);
		   mv.setViewName("studentLogin");
		
		return mv;
	}
	@GetMapping("studentReg")
	public ModelAndView studentReg()
	{
		ModelAndView mv=new ModelAndView();
		mv.setViewName("studentReg");
		return mv;
	}
	@GetMapping("studentHome")
	public ModelAndView studentHome()
	{
		ModelAndView mv=new ModelAndView();
		mv.setViewName("studentHome");
		return mv;
	}
	@GetMapping("studentLogin")
	public ModelAndView studentLogin()
	{
		ModelAndView mv=new ModelAndView();
		mv.setViewName("studentLogin");
		return mv;
	}
	// add message to logout page
	@GetMapping("studentLogout")
	public ModelAndView studentLogout(HttpSession session) {
	    ModelAndView mv = new ModelAndView();
	    
	    // Invalidate the session on logout
	    session.invalidate();
	    
	    mv.setViewName("studentLogin");
	    mv.addObject("message", "Logged out successfully.");
	    return mv;
	}

	@PostMapping("insertStudent")
   public ModelAndView insertStudent(HttpServletRequest request, @RequestParam("image") MultipartFile file, HttpSession session) throws IOException, SerialException, SQLException
   {
	   // take the data from the hmtl form
	   int id = Integer.parseInt(request.getParameter("id"));
	   String name=request.getParameter("name");
	   String gender=request.getParameter("gender");
	   String dob=request.getParameter("dob");
	   String phoneno=request.getParameter("phoneno");
	   String year=request.getParameter("year");
	   String branch=request.getParameter("branch");
	   String sec=request.getParameter("sec");
	   String email=request.getParameter("email");
	   String password=request.getParameter("pwd");
	
	   Student student=new Student();
	   byte[] bytes = file.getBytes();
	    Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);
	    
	   student.setId(id);
	   student.setName(name);
	   student.setGender(gender);
	   student.setDob(dob);
	   student.setPhoneno(phoneno);
	   student.setYear(year);
	   student.setBranch(branch);
	   student.setSec(sec);
	   student.setEmail(email);
	   student.setPassword(password);
	   student.setImage(blob);  
	   
	   String message=studentService.studentRegistration(student);
	   ModelAndView mv=new ModelAndView();
	   mv.setViewName("studentRegSuccess");
	   mv.addObject("message",message);
	   return mv;   
   }
	
	@PostMapping("checkStudentLogin")
	public ModelAndView checkAdminLogin(HttpServletRequest request)
	{
		ModelAndView mv=new ModelAndView();
		String email=request.getParameter("email");
		String pwd=request.getParameter("pwd");
		Student student=studentService.checkStudentLogin(email, pwd);
		if(student!=null)
		{
			HttpSession session=request.getSession();
			session.setAttribute("student",student);
			mv.setViewName("studentHome");	
		}
		else
		{
			mv.setViewName("studentLogin");
			mv.addObject("message","Login Failed");
		}
		return mv;
	}
	@GetMapping("addAchievement")
	public String addAchievement()
	{
		return "addAchievement";
	}
	@PostMapping("insertAchievement")
	public ModelAndView insertAchievement(HttpServletRequest request, @RequestParam("ach_image") MultipartFile file, HttpSession session) throws IOException, SerialException, SQLException {
	    // Get the logged-in student from session
	    Student student = (Student) session.getAttribute("student");
	    
	    if (student == null) {
	        // If no student is logged in, return an error message
	        ModelAndView mv = new ModelAndView("studentLogin");
	        mv.addObject("message", "Please log in to add achievements.");
	        return mv;
	    }

	    // Retrieve the values from the form
	    String category = request.getParameter("ach_category");  // Get category from form
	    String description = request.getParameter("ach_description");  // Get description from form

	    // Handle file upload for the certificate
	    byte[] bytes = file.getBytes();
	    Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);

	    // Create a new Achievement object
	    Achievement achievement = new Achievement();
	    achievement.setCategory(category);  // Set category as the field in the model
	    achievement.setDescription(description);  // Set description
	    achievement.setImage(blob);  // Set image from uploaded file
	    achievement.setStatus("Not Approved");  // Set the default status (e.g., "Not Approved")
	    achievement.setStudentId(student.getId());  // Set the logged-in student's ID
	    achievement.setStudentName(student.getName());  // Set the logged-in student's name
	    achievement.setDateCreated(new java.util.Date());  // Set the current date using java.util.Date

	    // Call the service to save the achievement
	    String message = studentService.addAchievement(achievement);

	    // Prepare the response model and view
	    ModelAndView mv = new ModelAndView();
	    mv.setViewName("achievementSuccess");
	    mv.addObject("message", message);

	    return mv;
	}


	@GetMapping("viewAllAchievements")
	public ModelAndView viewAllAchievements(HttpSession session) {
	    ModelAndView mv = new ModelAndView();

	    // Get the logged-in student from session
	    Student student = (Student) session.getAttribute("student");

	    if (student != null) {
	        // Fetch only the student's achievements
	        List<Achievement> achievements = studentService.viewAllAchievements(student.getId());
	        
	        if (achievements.isEmpty()) {
	            mv.addObject("message", "Oops! No achievements added. Add to unlock victory.");
	        } else {
	            mv.addObject("achievements", achievements);
	        }

	        mv.setViewName("viewAllAchievements");
	    } else {
	        mv.setViewName("error");
	        mv.addObject("message", "Please log in first.");
	    }

	    return mv;
	}



}

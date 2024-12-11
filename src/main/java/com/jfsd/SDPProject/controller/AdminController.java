package com.jfsd.SDPProject.controller;
import java.io.IOException;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;

import javax.sql.rowset.serial.SerialException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;  // Correct import
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.jfsd.SDPProject.model.Achievement;
import com.jfsd.SDPProject.model.Admin;
import com.jfsd.SDPProject.model.Contact;
import com.jfsd.SDPProject.model.Student;
import com.jfsd.SDPProject.service.AdminService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController
{
	@Autowired
	AdminService adminService;
	@GetMapping("adminLogin")
	public ModelAndView adminLogin()
	{
		ModelAndView mv=new ModelAndView();
		mv.setViewName("adminLogin");
		return mv;
	}
	@GetMapping("viewAchByCategory")
	public ModelAndView viewAchByCategory()
	{
		ModelAndView mv=new ModelAndView();
		List<String> categories = adminService.getAllCategories(); // Fetch all categories from the database
        mv.addObject("categoryList", categories);
		mv.setViewName("viewAchByCategory");
		return mv;
	}
	@GetMapping("viewAch")
	public ModelAndView viewAch() {
	    ModelAndView mv = new ModelAndView();
	    List<Achievement> ach = adminService.getAllAchievements(); // Fetch all achievements from the database
	    mv.addObject("achievements", ach); // Add the achievements list to the model
	    mv.setViewName("viewAllAch"); // Set the JSP file name
	    return mv;
	}

	@GetMapping("displayStudentImage")
	public ResponseEntity<byte[]> displayStudentImage(@RequestParam int studentId) throws SQLException {
	    // Fetch the student by ID directly from the database
	    Student studentToDisplay = adminService.displayStudentById(studentId);  // Optimized to fetch only the student by ID

	    if (studentToDisplay == null) {
	        // If the student is not found, return a not found response
	        return ResponseEntity.notFound().build();
	    }

	    // Check if the student has an image associated with their profile
	    if (studentToDisplay.getImage() != null) {
	        // Get the image as a byte array
	        byte[] imageBytes = studentToDisplay.getImage().getBytes(1, (int) studentToDisplay.getImage().length());
	        
	        // Determine the content type (MIME type) based on image format
	        String contentType;
	        if (imageBytes.length > 4 && imageBytes[0] == (byte) 0x89 && imageBytes[1] == (byte) 0x50 
	                && imageBytes[2] == (byte) 0x4E && imageBytes[3] == (byte) 0x47) {
	            // This checks if the image is a PNG (first 4 bytes of a PNG file)
	            contentType = MediaType.IMAGE_PNG_VALUE;
	        } else {
	            // Default to JPEG (use this for JPEG images)
	            contentType = MediaType.IMAGE_JPEG_VALUE;
	        }

	        return ResponseEntity.ok()
	                .contentType(MediaType.parseMediaType(contentType))  // Dynamically set content type
	                .body(imageBytes);  // Return the image as a byte array in the response
	    } else {
	        // If no image is available, return a placeholder or empty response
	        return ResponseEntity.status(HttpStatus.NO_CONTENT).build();
	    }
	}

	@GetMapping("viewAchById")
	public ModelAndView viewAchById() {
	    ModelAndView mv = new ModelAndView();
	    
	    // Fetch all students (id and name)
	    List<Student> students = adminService.getAllStudents(); // Fetch the students from the service
	    
	    mv.addObject("studentList", students); // Pass the studentList to the view
	    mv.setViewName("viewAchById"); // The JSP page to render
	    return mv;
	}


	@PostMapping("displayAchByCategory")
    public ModelAndView displayAchByCategory(@RequestParam("category") String category) {
        ModelAndView mv = new ModelAndView();
        
        // Fetch achievements by the selected category
        List<Achievement> achievements = adminService.getAchievementsByCategory(category);
        
        // Add achievements to the model
        mv.addObject("achievements", achievements);
        mv.setViewName("displayAchByCategory"); // Corresponding JSP page
        return mv;
    }
	@PostMapping("displayAchById")
	public ModelAndView displayAchById(@RequestParam("studentId") int studentId) {
	    ModelAndView mv = new ModelAndView();
	    
	    // Fetch achievements by student ID
	    List<Achievement> achievements = adminService.getAchievementsByStudentId(studentId);
	    
	   
	    
	    // Add achievements to the model
	    mv.addObject("achievements", achievements);
	    mv.setViewName("displayAchById"); // Ensure this matches the JSP filename
	    return mv;
	}

	@GetMapping("manageStudents")
	public ModelAndView manageStudents()
	{
		ModelAndView mv=new ModelAndView();
		mv.setViewName("manageStudents");
		return mv;
	}
	
	@GetMapping("approveAch")  // No need to prefix with /admin anymore
	public ModelAndView viewUnapprovedAchievements() {
	    ModelAndView mv = new ModelAndView();
	    
	    // Fetch all unapproved achievements
	    List<Achievement> unapprovedAchievements = adminService.getUnapprovedAchievements();
	    
	    if (unapprovedAchievements.isEmpty()) {
	        mv.addObject("message", "No achievements to approve.");
	    } else {
	        mv.addObject("achievements", unapprovedAchievements);
	    }
	    
	    mv.setViewName("approveAch");  // View name corresponding to approveAchievements.jsp
	    return mv;
	}
	@GetMapping("displayCert_c")
	public ResponseEntity<byte[]> displayCert_a(@RequestParam String category) throws SQLException {
	    // Fetch achievements based on the category from your service
	    List<Achievement> achievements = adminService.getAchievementsByCategory(category);

	    if (achievements.isEmpty()) {
	        // If no achievements are found for the category, return 404 not found
	        return ResponseEntity.notFound().build();
	    }

	    // Loop through the list of achievements to find an approved one
	    for (Achievement achievement : achievements) {
	        // Check if the achievement is approved
	        if ("Approved".equals(achievement.getStatus())) {
	            byte[] imageBytes = achievement.getImage().getBytes(1, (int) achievement.getImage().length());
	            return ResponseEntity.ok()
	                    .contentType(MediaType.IMAGE_JPEG)  // Set the content type to image/jpeg
	                    .body(imageBytes);  // Return the image as a byte array in the response
	        }
	    }

	    // If no approved achievement is found, return a "Waiting for approval" message
	    return ResponseEntity.status(HttpStatus.FORBIDDEN)
	            .body("No approved achievements found for this category.".getBytes());
	}

	@PostMapping("approveAchievement")  // No need to prefix with /admin anymore
	public String approveAchievement(@RequestParam("achievementId") int achievementId) {
	    try {
	        // Call the service method to approve the achievement
	        adminService.approveAchievement(achievementId);
	        return "redirect:/approveAch";  // Redirect to the same URL after approval
	    } catch (Exception e) {
	        // Handle errors (e.g., achievement not found, etc.)
	        return "redirect:/approveAch?message=Error+approving+achievement";
	    }
	}



	@GetMapping("manageAch")
	public ModelAndView manageAch()
	{
		ModelAndView mv=new ModelAndView();
		mv.setViewName("manageAch");
		return mv;
	}
	@PostMapping("submitContact")
	public ModelAndView submitContact(HttpServletRequest request)
	{
		ModelAndView mv=new ModelAndView();
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String subject=request.getParameter("subject");
		String message=request.getParameter("message");
		Contact c=new Contact();
		c.setEmail(email);
		c.setMessage(message);
		c.setName(name);
		c.setSubject(subject);
		String text=adminService.addContact(c);
		mv.addObject("text",text);
		mv.setViewName("contactSuccess");
		return mv;
	}
	@GetMapping("adminHome")
	public ModelAndView adminHome()
	{
		// another way of writing without setViewName
		ModelAndView mv=new ModelAndView("adminHome");
		long count=adminService.studentCount();
		mv.addObject("count",count);
		return mv;
	}
	@GetMapping("viewAllStudents")
	public ModelAndView viewAllStudents()
	{
		ModelAndView mv=new ModelAndView("viewAllStudents");
		List<Student> students=adminService.viewAllStudents();
		mv.addObject("studentList",students);
		long count=adminService.studentCount();
		mv.addObject("count",count);
		return mv;
	}
	@GetMapping("deleteStudent")
	public ModelAndView deleteStudent()
	{
		ModelAndView mv=new ModelAndView("deleteStudent");
		List<Student> students=adminService.viewAllStudents();
		mv.addObject("studentList",students);
		return mv;
	}
	@GetMapping("delete")
	public String  delete(@RequestParam int id)
	{
		adminService.deleteStudent(id);
		return "redirect:/deleteStudent";
	}
	@GetMapping("createStudentLogin")
	public ModelAndView  createStudentLogin()
	{
	     ModelAndView mv=new ModelAndView("createStudentLogin");
	     return mv;
	}
	@GetMapping("displayAllCerts")
	public ResponseEntity<byte[]> displayAllCerts(@RequestParam int achievementId) throws SQLException {
	    // Check if the user is an admin (you can implement your own admin validation here)
	    boolean isAdmin = true; // Replace with actual admin validation logic

	    if (!isAdmin) {
	        // If not an admin, return error
	        return ResponseEntity.status(HttpStatus.FORBIDDEN).build();
	    }

	    // Fetch all achievements from the adminService (assuming adminService is responsible for fetching all achievements)
	    List<Achievement> achievements = adminService.getAllAchievements();

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

	@PostMapping("insertStudent_a")
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
		   String message=adminService.studentRegistration(student);
		   ModelAndView mv=new ModelAndView();
		   mv.setViewName("manageStudents");
		   mv.addObject("message",message);
		   return mv;   
	   }
	@PostMapping("checkAdminLogin")
	public ModelAndView checkAdminLogin(HttpServletRequest request)
	{
		ModelAndView mv=new ModelAndView();
		String a_name=request.getParameter("a_name");
		String a_pwd=request.getParameter("a_pwd");
		Admin admin=adminService.checkAdminLogin(a_name,a_pwd);
		if(admin!=null)
		{
			mv.setViewName("adminHome");
			long count=adminService.studentCount();
			mv.addObject("count",count);
		}
		else
		{
			mv.setViewName("adminLogin");
			mv.addObject("message","Login Failed");
		}
		return mv;
	}
	@GetMapping("viewStudentById")
	public ModelAndView viewStudentById()
	{
		ModelAndView mv=new ModelAndView();
		List<Student> students=adminService.viewAllStudents();
		mv.addObject("studentList",students);
		mv.setViewName("viewStudentById");
		return mv;
	}
	@GetMapping("updateStudent")
	public ModelAndView updateStudent()
	{
		ModelAndView mv=new ModelAndView();
		mv.setViewName("updateStudent");
		return mv;
	}
	@GetMapping("viewStudentByMail")
	public ModelAndView viewStudentByMail()
	{
		ModelAndView mv=new ModelAndView();
		List<Student> students=adminService.viewAllStudents();
		mv.addObject("studentList",students);
		mv.setViewName("viewStudentByMail");
		return mv;
	}
	@PostMapping("displayStudent")
	public ModelAndView displayStudent(HttpServletRequest request)
	{
		ModelAndView mv=new ModelAndView();
		int id=Integer.parseInt(request.getParameter("id"));
		Student student = adminService.displayStudentById(id);
		mv.addObject("s",student);
		return mv;
		
	}
	@PostMapping("displayStudentByMail")
	public ModelAndView displayStudentByMail(HttpServletRequest request)
	{
		ModelAndView mv=new ModelAndView();
		String email=request.getParameter("email");
		Student student = adminService.displayStudentByMail(email);
		mv.addObject("s",student);
		return mv;
		
	}

}

<%@ page import ="com.jfsd.SDPProject.model.Student" %>
<%@ page import="java.sql.Blob" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.util.Base64" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
Student s = (Student)session.getAttribute("student");
String base64Image = "";
try {
    Blob imageBlob = s.getImage();
    if (imageBlob != null) {
        InputStream inputStream = imageBlob.getBinaryStream();
        byte[] bytes = inputStream.readAllBytes();
        base64Image = Base64.getEncoder().encodeToString(bytes);
    }
} catch (Exception e) {
    e.printStackTrace();
}
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Student Profile</title>
  <style>
    .container {
      display: flex;
      justify-content: center;
      align-items: flex-start;
      margin: 2rem;
      gap: 3rem; /* Increased gap between the image and text box */
    }

    .profile-image {
      flex-basis: 500px;
      width: 700px;
      height: 450px; /* Reduced height by half */
      border-radius: 0.5rem;
      box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
      margin-top: 4rem; /* Move the image further down */
    }

    .profile-image img {
      width: 100%;
      height: 100%;
      object-fit: cover; /* Ensure the image covers the area without distorting */
      border-radius: 0.25rem; /* Rounded corners for the image */
    }

    .profile-details {
      flex-basis: 400px;
      background-color: white; /* White background for the text box */
      border-radius: 0.75rem; /* Increased corner roundness */
      padding: 2rem;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); /* Subtle shadow effect for the text box */
      width: 400px;
      font-size: 1.1rem;
      border: 2px solid #ff6b00; /* Orange border to match the image border */
      line-height: 1.8; /* Improve text readability */
    }

    .profile-details h3 {
      margin-top: 0;
      font-size: 2rem;
      font-weight: 600;
      color: #ff6b00; /* Orange color for the heading */
      text-align: center;
      padding-bottom: 1rem;
      text-transform: uppercase; /* Uppercase for more emphasis */
    }

    .profile-details p {
      margin-bottom: 1.2rem;
      color: #333;
      font-weight: bold; /* Make text bold */
    }

    .profile-details p strong {
      color: #ff6b00; /* Orange color for field labels */
      font-weight: bold; /* Make labels bold */
    }

    .profile-details p span {
      font-weight: normal; /* Keep values in normal weight */
    }
  </style>
</head>
<body>
  <%@include file="studentNavbar.jsp" %><br/>
  <div class="container">
    <% if (!base64Image.isEmpty()) { %>
      <div class="profile-image">
        <img src="data:image/png;base64,<%= base64Image %>" alt="Student Image">
      </div>
    <% } else { %>
      <div class="profile-image">
        No image available.
      </div>
    <% } %>
    <div class="profile-details">
      <h3>My Profile</h3>
      <p><strong>ID:</strong> <span><%= s.getId() %></span></p>
      <p><strong>Name:</strong> <span><%= s.getName() %></span></p>
      <p><strong>Gender:</strong> <span><%= s.getGender() %></span></p>
      <p><strong>DOB:</strong> <span><%= s.getDob() %></span></p>
      <p><strong>Phone No:</strong> <span><%= s.getPhoneno() %></span></p>
      <p><strong>Year:</strong> <span><%= s.getYear() %></span></p>
      <p><strong>Branch:</strong> <span><%= s.getBranch() %></span></p>
      <p><strong>Sec:</strong> <span><%= s.getSec() %></span></p>
      <p><strong>Email:</strong> <span><%= s.getEmail() %></span></p>
    </div>
  </div>
</body>
</html>

<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Navbar with Dropdown</title>
  <link rel="stylesheet" href="styles/styles.css">
  <style>
    /* Increase font size for navbar main text, but keep dropdown text size the same */
    .nav-list li a {
      font-size: 20px; /* Increased font size for main navbar items */
    }
  </style>
</head>
<%@include file="topbar.jsp" %>
<body>
  <!-- Navbar HTML Structure -->
  <nav class="navbar">
    <ul class="nav-list">
      <li><a href="home">Home</a></li>
      <li><a href="studentLogin">Student Login</a></li>
      <li><a href="adminLogin">Admin Login</a></li>
      <li><a href="studentReg">Student Registration</a></li>
      <li><a href="#">About Us</a></li>
      <li><a href="contactUs">Contact Us</a></li>
    </ul>
  </nav>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Student Login</title>
  <style>
    /* Body and global styling */
    body {
      background-color: #f8f9fa; /* Light background */
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
    }

    /* Centered container for the form */
    .container {
      max-width: 640px;
      margin: 2rem auto;
      padding: 2rem;
      background-color: #ffffff; /* White background for form */
      border-radius: 8px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      box-sizing: border-box; /* Ensure padding doesn't affect width */
    }

    /* Form field styling */
    .form-control {
      width: 100%;
      padding: 0.75rem 1rem;
      margin-bottom: 1rem;
      border: 1px solid #ddd;
      border-radius: 0.375rem;
      font-size: 1rem;
      line-height: 1.5;
      box-sizing: border-box; /* Ensure the padding is included within the width */
    }

    /* Focused input styling */
    .form-control:focus {
      border-color: #f97316;
      outline: none;
    }

    /* Button styling */
    .btn {
      display: inline-block;
      padding: 0.75rem 1.5rem;
      background-color: #f97316;
      color: white;
      border: none;
      border-radius: 0.375rem;
      font-size: 1rem;
      line-height: 1.5;
      cursor: pointer;
      text-align: center;
      width: 100%; /* Full width for buttons */
      margin-top: 1rem; /* Space between buttons */
    }

    /* Button hover effect */
    .btn:hover {
      background-color: #e76000;
    }

    /* Label styling */
    label {
      font-weight: bold;
      margin-bottom: 0.5rem;
      display: inline-block;
      color: black; /* Black labels */
    }

    /* Center heading */
    h1 {
      text-align: center;
      color: #f97316; /* Same color as buttons */
    }

    /* Message display */
    .message {
      color: black; /* Black color for the message */
      font-weight: bold;
      margin-bottom: 1rem;
      text-align: center;
    }

    /* Media query for small screens (mobiles and tablets) */
    @media (max-width: 768px) {
      .container {
        padding: 1rem; /* Reduce padding for smaller screens */
      }
      .btn {
        width: 100%; /* Full width buttons on small screens */
      }
    }
  </style>
</head>
<body>
  <%@include file="navbar.jsp" %>

  <!-- Login Form Container -->
  <div class="container">
    <h1>Student Login</h1>
    
    <!-- Display message -->
    <div class="message">
      <c:out value="${message}"></c:out>
    </div>

    <!-- Form -->
    <form action="/checkStudentLogin" method="post">
      <label>Enter Email:</label>
      <input type="email" name="email" class="form-control" placeholder="Enter Email Address" required>
      
      <label>Enter Password:</label>
      <input type="password" name="pwd" class="form-control" placeholder="Enter Password" required>
      
      <!-- Buttons -->
      <button type="submit" class="btn">Login</button>
      <button type="reset" class="btn btn-clear">Clear</button>
    </form>
  </div>
</body>
</html>

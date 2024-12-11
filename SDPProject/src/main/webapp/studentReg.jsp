<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- Ensure responsiveness -->
  <title>Student Registration</title>
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

    /* Clear button color */
    .btn-clear {
      background-color: #f97316;
      color: white;
    }

    .btn-clear:hover {
      background-color: #e76000;
    }

    /* Label styling */
    label {
      font-weight: bold;
      margin-bottom: 0.5rem;
      display: inline-block;
      color: black; /* Black labels */
    }

    /* Radio button styling */
    .form-radio {
      margin-right: 1rem;
    }

    /* Center heading */
    h1 {
      text-align: center;
      color: #f97316; /* Same color as buttons */
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

  <!-- Form Container -->
  <div class="container">
    <h1 class="text-2xl font-bold mb-6">Student Registration</h1>
    <form action="/insertStudent" method="post" enctype="multipart/form-data">
      
      <label>Enter ID:</label>
      <input type="number" name="id" class="form-control" placeholder="Enter Student ID" required>
      
      <label>Enter Name:</label>
      <input type="text" name="name" class="form-control" placeholder="Enter Full Name" required>
      
      <label>Select Gender:</label><br>
      <input type="radio" name="gender" value="Male" class="form-radio" required> Male
      <input type="radio" name="gender" value="Female" class="form-radio"> Female
      <input type="radio" name="gender" value="Other" class="form-radio"> Other<br><br>
      
      <label>Enter Date of Birth:</label>
      <input type="date" name="dob" class="form-control" required>
      
      <label>Enter Phone Number:</label>
      <input type="text" name="phoneno" class="form-control" placeholder="Enter 10-digit Phone Number" pattern="\d{10}" title="Phone number must be 10 digits" required>
      
      <label>Enter Year:</label>
      <input type="number" name="year" class="form-control" placeholder="Enter Year (1 to 4)" min="1" max="4" required>
      
      <label>Enter Branch:</label>
      <input type="text" name="branch" class="form-control" placeholder="Enter Branch" required>
      
      <label>Enter Section:</label>
      <input type="text" name="sec" class="form-control" placeholder="Enter Section" required>
      
      <label>Enter Email:</label>
      <input type="email" name="email" class="form-control" placeholder="Enter Email Address" required>
      
      <label for="image">Upload your Image:</label>
      <input type="file" name="image" class="form-control" required>
      
      <label>Enter Password:</label>
      <input type="password" name="pwd" class="form-control" placeholder="Enter Password" required>
      
      <!-- Register and Clear buttons -->
      <button type="submit" class="btn">Register</button>
      <button type="reset" class="btn btn-clear">Clear</button>
    </form>
  </div>

</body>
</html>

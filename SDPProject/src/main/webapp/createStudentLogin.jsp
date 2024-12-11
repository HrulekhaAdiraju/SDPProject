<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Create Student Login</title>
  <style>
    /* Body and global styling */
    body {
      background-color: #f8f9fa;
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
    }

    /* Container for Sidebar and Form */
    .container {
      display: flex;
      min-height: 100vh;
    }

    /* Sidebar Styling */
    .sidenav {
      width: 250px; /* Sidebar width */
      background-color: #f4f4f4;
      padding-top: 20px;
      box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
      position: fixed;
      height: 100vh;
      top: 0;
      left: 0;
      overflow: auto; /* Ensure scrolling if content overflows */
    }

    /* Form Container Styling */
    .form-container {
      margin-left: 250px; /* Space for the sidebar */
      width: calc(100% - 250px); /* Ensures the form takes up the remaining width */
      padding: 2rem;
    }

    /* Form Styles */
    .container {
      background-color: #ffffff;
      border-radius: 8px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      box-sizing: border-box;
      max-width: 640px;
      margin: 2rem auto;
      padding: 2rem;
    }

    h1 {
      text-align: center;
      color: #f97316;
      font-size: 2rem;
      margin-bottom: 1.5rem;
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
      box-sizing: border-box;
    }

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
      width: 100%;
      margin-top: 1rem;
    }

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
      color: black;
    }

    /* Radio button styling */
    .form-radio {
      margin-right: 1rem;
    }

    /* Media query for small screens */
    @media (max-width: 768px) {
      .form-container {
        margin-left: 0;
        padding: 1rem;
      }

      .container {
        width: 100%;
      }

      .btn {
        width: 100%;
      }
    }
  </style>
</head>
<body>

  <!-- Include the Sidebar -->
  <%@ include file="usersSidebar.jsp" %>

  <!-- Form Container -->
  <div class="form-container">
    <h1>Create Student Login</h1>
    <form action="/insertStudent_a" method="post" enctype="multipart/form-data">

        <label for="id">Enter ID:</label>
        <input type="number" id="id" name="id" class="form-control" placeholder="Enter Student ID" required><br>

        <label for="name">Enter Name:</label>
        <input type="text" id="name" name="name" class="form-control" placeholder="Enter Full Name" required><br>

        <label>Select Gender:</label><br>
        <input type="radio" id="male" name="gender" value="Male" class="form-radio" required>
        <label for="male">Male</label>
        <input type="radio" id="female" name="gender" value="Female" class="form-radio">
        <label for="female">Female</label>
        <input type="radio" id="other" name="gender" value="Other" class="form-radio">
        <label for="other">Other</label><br>

        <label for="dob">Enter Date of Birth:</label>
        <input type="date" id="dob" name="dob" class="form-control" required><br>

        <label for="phoneno">Enter Phone Number:</label>
        <input type="text" id="phoneno" name="phoneno" class="form-control" placeholder="Enter 10-digit Phone Number" pattern="\d{10}" title="Phone number must be 10 digits" required><br>

        <label for="year">Enter Year:</label>
        <input type="number" id="year" name="year" class="form-control" placeholder="Enter Year (1 to 4)" min="1" max="4" required><br>

        <label for="branch">Enter Branch:</label>
        <input type="text" id="branch" name="branch" class="form-control" placeholder="Enter Branch" required><br>

        <label for="sec">Enter Section:</label>
        <input type="text" id="sec" name="sec" class="form-control" placeholder="Enter Section" required><br>

        <label for="email">Enter Email:</label>
        <input type="email" id="email" name="email" class="form-control" placeholder="Enter Email Address" required><br>

        <label for="image">Upload your Image:</label>
        <input type="file" id="image" name="image" class="form-control" required><br>

        <label for="pwd">Enter Password:</label>
        <input type="password" id="pwd" name="pwd" class="form-control" placeholder="Enter Password" required><br>

        <button type="submit" class="btn">Register</button>
        <button type="reset" class="btn btn-clear">Clear</button>
    </form>
  </div>

</body>
</html>

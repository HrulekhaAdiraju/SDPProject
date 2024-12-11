<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Contact Us</title>
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
    .form-control, textarea {
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
    .form-control:focus, textarea:focus {
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
    h2 {
      text-align: center;
      color: #f97316; /* Same color as buttons */
      margin-bottom: 1rem;
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
    <h2>Contact Us</h2>
    <form action="submitContact" method="post">
      <label for="name">Name:</label>
      <input type="text" id="name" name="name" class="form-control" placeholder="Enter your name" required>

      <label for="email">Email:</label>
      <input type="email" id="email" name="email" class="form-control" placeholder="Enter your email" required>

      <label for="subject">Subject:</label>
      <input type="text" id="subject" name="subject" class="form-control" placeholder="Enter the subject" required>

      <label for="message">Message:</label>
      <textarea id="message" name="message" class="form-control" rows="5" placeholder="Enter your message" required></textarea>

      <button type="submit" class="btn">Submit</button>
    </form>
  </div>
</body>
</html>

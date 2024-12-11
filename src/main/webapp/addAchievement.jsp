<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Add Achievement</title>
  <style>
    /* Global styles */
    body {
      background-color: #f8f9fa; /* Light background */
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
    }

    /* Container for the form */
    .container {
      max-width: 640px;
      margin: 2rem auto;
      padding: 2rem;
      background-color: #ffffff; /* White form background */
      border-radius: 8px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      box-sizing: border-box; /* Include padding in width */
    }

    /* Heading styles */
    h2 {
      text-align: center;
      color: #f97316; /* Consistent orange color */
    }

    /* Input and select styles */
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

    textarea.form-control {
      resize: vertical; /* Allow resizing only vertically */
      height: 100px; /* Set a fixed height for textarea */
    }

    /* Button styles */
    .btn {
      display: inline-block;
      padding: 0.75rem 1.5rem;
      background-color: #f97316;
      color: white;
      border: none;
      border-radius: 0.375rem;
      font-size: 1rem;
      cursor: pointer;
      text-align: center;
      width: 100%; /* Full-width buttons */
      margin-top: 1rem;
    }

    .btn:hover {
      background-color: #e76000;
    }

    /* Label styling */
    label {
      font-weight: bold;
      margin-bottom: 0.5rem;
      display: block;
      color: black; /* Black text for labels */
    }

    /* Media query for responsive design */
    @media (max-width: 768px) {
      .container {
        padding: 1rem;
      }
    }
  </style>
</head>
<body>
  <%@ include file="studentNavbar.jsp" %>

  <div class="container">
    <h2>Add Your Achievement</h2>
    <form action="insertAchievement" method="post" enctype="multipart/form-data">
      <label for="category">Select Category:</label>
      <select name="ach_category" class="form-control" required>
        <option value="Sports">Sports</option>
        <option value="Cultural Activities">Cultural Activities</option>
        <option value="Academic">Academic</option>
        <option value="Clubs">Clubs</option>
        <option value="Entrepreneurships/Startups">Entrepreneurships/Startups</option>
      </select>

      <label for="ach_description">Briefly describe your achievement:</label>
      <textarea name="ach_description" class="form-control" required></textarea>

      <label for="ach_image">Upload your certificate:</label>
      <input type="file" name="ach_image" class="form-control" required>

      <button type="submit" class="btn">Add Achievement</button>
      <button type="reset" class="btn">Clear</button>
    </form>
  </div>
</body>
</html>

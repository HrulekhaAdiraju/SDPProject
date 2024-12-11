<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JFSD SDP</title>
<style>
  /* Reset the default margin and padding */
  * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
  }

  /* Style the div to use the image as a background */
  .center-div {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh; /* Full viewport height */
    width: 100vw; /* Full viewport width */
    background-image: url('images/carousel-1.jpg'); /* Set the background image */
    background-size: cover; /* Make the image cover the whole div */
    background-position: center; /* Center the image */
    background-repeat: no-repeat; /* Prevent the image from repeating */
    color: white; /* Text color on top of the background image */
    text-align: center; /* Center the text horizontally */
    position: relative; /* Necessary for absolute positioning of the overlay */
    margin-top: 20px; /* Add space between navbar and first div */
  }

  /* Adding black overlay */
  .center-div::before {
    content: ''; /* Create an empty content for the overlay */
    position: absolute; /* Position it absolutely */
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background-color: rgba(0, 0, 0, 0.6); /* Semi-transparent black layer */
    z-index: 1; /* Ensure the overlay is above the image but below the text */
  }

  /* Apply system font stack for text content */
  .text-content {
    position: relative; /* Ensure the text appears above the overlay */
    z-index: 2; /* Place text on top of the overlay */
    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", "Roboto", "Oxygen", "Ubuntu", "Cantarell", "Fira Sans", "Droid Sans", "Helvetica Neue", sans-serif;
    font-size: 1rem; /* 16px */
    line-height: 1.5;
  }

  h1 {
    font-size: 5rem; /* Increased size for the main heading */
  }

  h2 {
    font-size: 3rem; /* Increased size for the subheading */
  }

  /* About Us Section */
  .about-section {
    display: flex;
    justify-content: flex-start; /* Align the items to the left */
    align-items: center;
    padding: 30px 40px; /* Reduced padding further to bring image and text closer */
    height: auto; /* Keep div height as auto */
    margin-top: 180px; /* Increased space between first div and about section (3x) */
    margin-bottom: 80px; /* Increased space between this section and the footer */
  }

  .about-image {
    flex: 1;
    margin-left: 100px; /* Reduced margin-left to shift the image closer to the text */
    max-width: 100%; /* Ensure the image does not exceed its container */
  }

  .about-image img {
    width: 98%; /* Increased the size of the image from 95% to 98% */
    height: auto; /* Maintain aspect ratio */
    border-radius: 15px; /* Add rounded edges */
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2); /* Optional shadow for the image */
  }

  .about-text {
    flex: 1;
    font-family: Arial, sans-serif;
    font-size: 1rem; /* Normal font size for the text */
    color: #333; /* Dark text color for readability */
    margin-left: 100px; /* Move the text towards the right */
  }

  .about-text h3 {
    color: #f97316; /* Set the "About Us" heading to the specified orange color */
    font-size: 2.5rem; /* Increased font size for better emphasis */
    text-align: center; /* Center the heading */
    margin-bottom: 20px; /* Add space below the heading */
  }

  .about-text h2 {
    font-size: 2rem; /* Adjust the size of the heading */
    text-align: left; /* Align text to the left */
    margin-left: 100px; /* Move the "Innovative way to Learn" text towards the right */
    margin-top: 10px; /* Added margin to separate from the "About Us" text */
    margin-bottom: 20px; /* Add space below the heading */
  }

  .about-text p {
    font-size: 1rem; /* Normal font size for the paragraph */
    line-height: 1.8; /* Increased line height for better readability */
    margin-top: 15px; /* Space between paragraphs */
  }
</style>
</head>
<body>
  <%@include file="navbar.jsp" %>
  
  <!-- First Div: Welcome Section -->
  <div class="center-div">
    <div class="text-content">
      <h1>Welcome to Beyond Grade</h1>
      <h2>Beyond the classroom, a world awaits!!!!!</h2>
    </div>
  </div>

  <!-- About Us Section -->
  <div class="about-section">
    <!-- Left side: Image -->
    <div class="about-image">
      <img src="images/about.jpg" alt="About Us">
    </div>

    <!-- Right side: Text -->
    <div class="about-text">
      <h3>About Us</h3>
      <h2>Innovative way to Learn</h2>
      <p>Beyond Grade is a revolutionary platform designed to take education and learning to new heights. With innovative tools, resources, and opportunities, we aim to make learning accessible, engaging, and enjoyable for everyone. Our platform is built with the latest technology to ensure students and educators have everything they need for success. Get ready to travel beyond the classroom. Your only flight to heaven!!!!</p>
    </div>
  </div>
  
  <%@include file="footer.jsp" %>
</body>
</html>

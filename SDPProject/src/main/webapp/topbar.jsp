<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Topbar</title>

  <style>
    /* Top Bar Styles */
    .top-bar {
      display: flex;
      justify-content: space-between;  /* Distribute space between left and right sections */
      align-items: center;
      padding: 15px 30px;  /* Increased padding for larger top bar */
      font-size: 16px;  /* Increased font size for better visibility */
      background-color: transparent; /* Remove background color */
      border-bottom: 2px solid #ff6b00; /* Orange line separating top bar and navbar */
    }

    /* Branding (BeyondGrade) */
    .branding {
      font-size: 32px;  /* Increased font size for the branding */
      font-weight: bold; /* Bold font for branding */
      color: #000; /* Black text color */
    }

    .branding .orange {
      color: #ff6b00; /* Orange color for the first letter 'B' */
    }

    /* Contact Information */
    .contact-info {
      display: flex;
      justify-content: flex-end; /* Align items to the right */
      align-items: center;
    }

    .contact-item {
      display: flex;
      align-items: center;
      margin-left: 30px;  /* Increased space between each contact item */
      color: #000; /* Black color for text */
    }

    .contact-item .icon {
      font-size: 22px; /* Increased icon size */
      color: #ff6b00; /* Orange color for the icons */
      margin-right: 12px; /* Increased space between icon and text */
    }

    .contact-item div {
      font-size: 16px; /* Font size for text */
    }

    .contact-item strong {
      font-weight: bold; /* Bold text */
    }
  </style>
</head>
<body>
  <div class="top-bar">
    <!-- Left side: BeyondGrade -->
    <div class="branding">
      <span class="orange">B</span>eyondGrade
    </div>

    <!-- Right side: Contact information -->
    <div class="contact-info">
      <div class="contact-item">
        <span class="icon">&#9993;</span> <!-- Email symbol -->
        <div>
          <strong>Email Us</strong><br>
          info@gmail.com
        </div>
      </div>
      <div class="contact-item">
        <span class="icon">&#9742;</span> <!-- Phone symbol -->
        <div>
          <strong>Call Us</strong><br>
          +012 345 6789
        </div>
      </div>
      <div class="contact-item">
        <span class="icon">&#9873;</span> <!-- Location symbol -->
        <div>
          <strong>Visit Us</strong><br>
          123 Street, City
        </div>
      </div>
    </div>
  </div>

  <!-- You can add your navbar below -->
  <!-- Example of a navbar, just as a placeholder -->
  <div class="navbar">
    <!-- Navbar content goes here -->
  </div>
</body>
</html>

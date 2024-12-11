<%@page import ="com.jfsd.SDPProject.model.Student" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Student s = (Student)session.getAttribute("student");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Home</title>
<style>
    body {
        text-align: center;
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
    }
    .welcome-container {
        position: relative;
        background-image: url('images/carousel-2.jpg');
        background-size: cover; /* Ensures the image covers the whole div */
        background-position: center;
        background-repeat: no-repeat; /* Prevents image repetition */
        height: 100vh; /* Makes the container take full height of the viewport */
        display: flex;
        justify-content: center; /* Centers the content horizontally */
        align-items: center; /* Centers the content vertically */
        padding: 0;
        margin: 0;
    }
    /* Adding a black overlay to the image */
    .welcome-container:before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background: rgba(0, 0, 0, 0.5); /* Black overlay with 50% transparency */
        z-index: 1;
    }
    .message {
        z-index: 2; /* Ensures the text is above the overlay */
        color: white;
        font-size: 48px; /* Increased font size */
        font-weight: bold;
        text-align: center;
    }
    .sub-message {
        font-size: 28px; /* Increased font size */
        color: white;
        margin-top: 20px;
    }
</style>
</head>
<body>
<%@include file="topbar.jsp" %><br/>
<%@include file="studentNavbar.jsp" %><br/>
<div class="welcome-container">
    <div class="message">
        "Welcome <%=s.getName() %>"
        <div class="sub-message">
            Goooooooood to see you onboard!!!
        </div>
    </div>
</div>
</body>
</html>

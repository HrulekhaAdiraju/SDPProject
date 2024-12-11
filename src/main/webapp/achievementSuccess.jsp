<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Achievement Success</title>
    <style>
        /* General body styling */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            height: 100vh;
            background-color: #f4f4f4;
        }

        /* Navbar container styling */
        nav {
            width: 100%;
        }

        /* Content container styling */
        .content {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            flex-grow: 1;
            text-align: center;
        }

        /* Styling for the message */
        .message {
            font-size: 1.8rem;
            color: #333;
            margin-bottom: 20px;
        }

        /* Styling for the button */
        .home-button {
            text-decoration: none;
            font-size: 1rem;
            color: white;
            background-color: orange;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .home-button:hover {
            background-color: darkorange;
        }
    </style>
</head>
<body>
    <!-- Include navbar.jsp at the top -->
    <nav>
        <%@ include file="navbar.jsp" %>
    </nav>

    <!-- Main content area -->
    <div class="content">
        <div class="message">
            <c:out value="${message}" />
        </div>
        <a href="studentHome" class="home-button">Go to Home</a>
    </div>
</body>
</html>

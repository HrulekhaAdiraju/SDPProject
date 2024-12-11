<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Students</title>
    <%@ taglib uri="jakarta.tags.core" prefix="c" %>
    <style>
        /* General Body and Content Style */
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
        }

        /* Container for Sidebar and Content */
        .container {
            display: flex;
            width: 100%;
        }

        /* Sidebar Style */
        .sidenav {
            width: 250px;
            background-color: #f4f4f4;
            padding-top: 20px;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
            position: fixed;
            height: 100vh;
            top: 0;
            left: 0;
            overflow: auto;
        }

        .sidenav a {
            display: block;
            padding: 10px;
            text-decoration: none;
            color: #333;
            margin-bottom: 10px;
        }

        .sidenav a:hover {
            background-color: #ddd;
        }

        /* Content Area */
        .content {
            margin-left: 260px;
            padding: 20px;
            width: calc(100% - 260px);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #fff;
        }

        /* Styled Heading */
        .styled-heading {
            font-size: 36px;
            color: #ff6b00;
            text-align: center;
        }

        /* Message Display Style */
        .message {
            text-align: center;
            font-size: 18px;
            color: #333;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Sidebar -->
        <%@ include file="usersSidebar.jsp" %>

        <!-- Content Area -->
        <div class="content">
            <h1 class="styled-heading">Manage Users!!!</h1>
        </div>
    </div>

    <!-- Display Message -->
    <div class="message">
        <c:out value="${message}"></c:out>
    </div>
</body>
</html>

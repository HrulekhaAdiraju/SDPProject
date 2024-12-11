<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Student By Email</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary-color: #ff6b00;
            --primary-dark: #cc5700;
            --primary-light: #ff8533;
            --background-light: #fff3e6;
            --text-color: #333333;
            --text-muted: #666666;
            --hover-background: #ffe6cc;
            --transition-speed: 0.3s;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', sans-serif;
            background-color: #f8f9fa;
            display: flex;
            line-height: 1.6;
            color: var(--text-color);
        }

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
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .form-container {
            max-width: 640px;
            padding: 2rem;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 50%; /* Adjust width as needed */
        }

        label {
            font-weight: bold;
            margin-bottom: 0.5rem;
            display: inline-block;
            color: black;
        }

        select {
            width: 100%;
            padding: 0.75rem 1rem;
            margin-bottom: 1rem;
            border: 1px solid #ddd;
            border-radius: 0.375rem;
            font-size: 1rem;
        }

        select:focus {
            border-color: var(--primary-color);
            outline: none;
        }

        input[type="submit"] {
            padding: 0.75rem 1.5rem;
            background-color: var(--primary-color);
            color: white;
            border: none;
            border-radius: 0.375rem;
            font-size: 1rem;
            cursor: pointer;
            width: 100%;
        }

        input[type="submit"]:hover {
            background-color: var(--primary-dark);
        }

        h3 {
            text-align: center;
            color: var(--primary-color);
            margin-bottom: 1rem;
        }
    </style>
</head>
<body>
    <%@ include file="usersSidebar.jsp" %>

    <div class="content">
        <div class="form-container">
            <h3>View Student By Email</h3>
            <form action="displayStudentByMail" method="post">
                <label for="email">Select Student Email:</label>
                <select name="email" id="email" required>
                    <option value="">--- Select ---</option>
                    <c:forEach items="${studentList}" var="student">
                        <option value="${student.email}">${student.email} - ${student.name}</option>
                    </c:forEach>
                </select>
                <input type="submit" value="View Student">
            </form>
        </div>
    </div>
</body>
</html>

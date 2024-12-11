<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Delete Student</title>
    <style>
        /* General Body Style */
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            padding: 0;
        }

        /* Container for Sidebar and Content */
        .container {
            display: flex;
            min-height: 100vh;
        }

        /* Sidebar Style */
        .sidenav {
            width: 250px;  /* Sidebar width */
            background-color: #f4f4f4;
            padding-top: 20px;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
            position: fixed;
            height: 100vh;
            top: 0;
            left: 0;
            overflow: auto; /* Ensure scrolling if content overflows */
        }

        /* Sidebar Links */
        .sidenav a {
            display: block;
            padding: 10px;
            text-decoration: none;
            color: #333;
            margin-bottom: 10px;
        }

        /* Sidebar Links Hover Effect */
        .sidenav a:hover {
            background-color: #ddd;
        }

        /* Content Area */
        .content {
            margin-left: 250px;  /* Space for sidebar */
            padding: 20px;
            flex: 1;
        }

        /* Card Container */
        .card-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
        }

        /* Individual Card Styling */
        .card {
            width: 300px;
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 20px;
            margin: 20px;
            background-color: #fff;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .card h4 {
            font-size: 20px;
            color: #333;
        }

        .card p {
            color: #555;
            font-size: 14px;
            margin-bottom: 5px;
        }

        .card a {
            text-decoration: none;
            color: #d9534f;
            font-weight: bold;
        }

        .card a:hover {
            color: #c9302c;
        }

        /* Optional: Add scrolling for content if the data is large */
        .content {
            overflow-y: auto; /* Enable vertical scrolling */
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Sidebar -->
        <%@ include file="usersSidebar.jsp" %>

        <!-- Content -->
        <div class="content">
          

            <!-- Card Container -->
            <div class="card-container">
                <c:forEach items="${studentList}" var="student">
                    <div class="card">
                        <h4><c:out value="${student.name}" /></h4>
                        <p><strong>Student ID:</strong> <c:out value="${student.id}" /></p>
                        <p><strong>Gender:</strong> <c:out value="${student.gender}" /></p>
                        <p><strong>Date of Birth:</strong> <c:out value="${student.dob}" /></p>
                        <p><strong>Phone Number:</strong> <c:out value="${student.phoneno}" /></p>
                        <p><strong>Year:</strong> <c:out value="${student.year}" /></p>
                        <p><strong>Branch:</strong> <c:out value="${student.branch}" /></p>
                        <p><strong>Section:</strong> <c:out value="${student.sec}" /></p>
                        <p><strong>Email:</strong> <c:out value="${student.email}" /></p>

                        <!-- Delete Link -->
                        <a href='<c:url value="delete?id=${student.id}"/>' onclick="return confirm('Are you sure you want to delete this student?')">Delete</a>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</body>
</html>

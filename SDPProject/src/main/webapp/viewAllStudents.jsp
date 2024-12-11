<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View All Students</title>
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
            overflow-y: auto; /* Ensure scrolling if content overflows */
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
            display: flex;
            justify-content: center; /* Center the card container */
            flex-wrap: wrap;  /* Allow wrapping */
        }

        /* Heading Style */
        h3 {
            text-align: center;
            margin-bottom: 20px;
            font-size: 36px; /* Increase heading size */
            color: #333;
            width: 100%;  /* Ensure the heading takes full width */
        }

        /* Total Students Text */
        .total-students {
            text-align: center;
            font-size: 24px; /* Adjust font size */
            font-weight: bold;
            color: #333; /* Darker text color for visibility */
            margin-bottom: 20px; /* Spacing below the text */
        }

        /* Card Container */
        .card-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center; /* Center the cards horizontally */
            width: 100%;  /* Ensure the container takes full width */
        }

        /* Individual Card Styling */
        .card {
            width: 48%;  /* Two cards per row */
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 20px;
            background-color: #fff;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            text-align: center;
            margin-right: 2%;  /* Add margin for spacing between cards */
        }

        .card img {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 15px;
        }

        .card h4 {
            font-size: 20px;
            color: #333;
        }

        .card p {
            color: #555;
            font-size: 14px;
        }

        /* Optional: Add scrolling for content if the data is large */
        .content {
            overflow-y: auto; /* Enable vertical scrolling */
        }

        /* Center Paragraph Text */
        p {
            text-align: center;
            font-size: 18px;
            color: #555;
        }

    </style>
</head>
<body>
    <div class="container">
        <!-- Sidebar -->
        <%@ include file="usersSidebar.jsp" %>

        <!-- Content -->
        <div class="content">
            <h3>View All Students</h3>

            <!-- Total Students Text -->
            <p class="total-students">Total Students: <c:out value="${count}" /></p>

            <!-- Card Container -->
            <div class="card-container">
                <c:forEach items="${studentList}" var="student">
                    <div class="card">
                        <c:choose>
                            <c:when test="${not empty student.id}">
                                <!-- Display Image from the server-side endpoint -->
                                <img src="displayStudentImage?studentId=${student.id}" alt="Student Image" />
                            </c:when>
                            <c:otherwise>
                                <span>No Image</span>
                            </c:otherwise>
                        </c:choose>

                        <h4><c:out value="${student.name}" /></h4>
                        <p><strong>Gender:</strong> <c:out value="${student.gender}" /></p>
                        <p><strong>Date of Birth:</strong> <c:out value="${student.dob}" /></p>
                        <p><strong>Phone Number:</strong> <c:out value="${student.phoneno}" /></p>
                        <p><strong>Year:</strong> <c:out value="${student.year}" /></p>
                        <p><strong>Branch:</strong> <c:out value="${student.branch}" /></p>
                        <p><strong>Section:</strong> <c:out value="${student.sec}" /></p>
                        <p><strong>Email:</strong> <c:out value="${student.email}" /></p>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</body>
</html>

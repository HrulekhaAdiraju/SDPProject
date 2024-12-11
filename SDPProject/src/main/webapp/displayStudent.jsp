<%@ page import="com.jfsd.SDPProject.model.Student" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Display Student</title>
    <style>
        /* General Body Style */
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            padding: 0;
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
            width: 100%;
        }

        /* Heading Style */
        h3 {
            text-align: center;
            font-size: 36px;
            margin-bottom: 20px;
            padding-top: 20px;
        }

        /* Card Style */
        .card {
            width: 300px;
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            text-align: center;
            margin: 0 auto;
        }

        .card img {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 15px;
        }

        .card h4 {
            font-size: 24px;
            color: #333;
            margin-bottom: 10px;
        }

        .card p {
            font-size: 16px;
            color: #555;
            margin-bottom: 10px;
        }

        .card p span {
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Sidebar -->
        <%@ include file="usersSidebar.jsp" %>

        <!-- Content -->
        <div class="content">
            <h3>Available students</h3>

            <!-- Student Information in Card Format -->
            <c:if test="${not empty s}">
                <div class="card">
                    <!-- Display Student Image (if available) -->
                    <c:choose>
                        <c:when test="${not empty s.image}">
                            <img src="displayStudentImage?studentId=${s.id}" alt="Student Image" />
                        </c:when>
                        <c:otherwise>
                            <img src="default-avatar.jpg" alt="No Image Available" />
                        </c:otherwise>
                    </c:choose>

                    <!-- Display Student Info -->
                    <h4><c:out value="${s.name}" /></h4>
                    <p><span>ID:</span> <c:out value="${s.id}" /></p>
                    <p><span>Gender:</span> <c:out value="${s.gender}" /></p>
                    <p><span>DOB:</span> <c:out value="${s.dob}" /></p>
                    <p><span>Phone No:</span> <c:out value="${s.phoneno}" /></p>
                    <p><span>Year:</span> <c:out value="${s.year}" /></p>
                    <p><span>Branch:</span> <c:out value="${s.branch}" /></p>
                    <p><span>Section:</span> <c:out value="${s.sec}" /></p>
                    <p><span>Email:</span> <c:out value="${s.email}" /></p>
                </div>
            </c:if>

            <!-- No Student Found -->
            <c:if test="${empty s}">
                <p style="text-align: center; color: red;">No student found with the given ID.</p>
            </c:if>
        </div>
    </div>
</body>
</html>

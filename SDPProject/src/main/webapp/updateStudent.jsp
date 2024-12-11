<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Student</title>
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

        /* Heading Style */
        h3 {
            text-align: center;
            margin-bottom: 20px;
            font-size: 36px; /* Increase heading size */
            color: #333;
        }

        /* Table Styles */
        table {
            width: 80%;  /* Center the table */
            margin-left: 100px; /* Shift table further to the right */
            margin-bottom: 20px;
            border-collapse: collapse;
        }

        table th, table td {
            padding: 18px; /* Increased padding for uniformity with View Students page */
            border: 1px solid #ddd;
            text-align: center; /* Center text in table cells */
        }

        table th {
            background-color: #f2f2f2;
            font-weight: bold;
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
            <h3>Update Student</h3>
            <table>
                <tr>
                    <th>Student ID</th>
                    <th>Name</th>
                    <th>Gender</th>
                    <th>Date of Birth</th>
                    <th>Phone Number</th>
                    <th>Year</th>
                    <th>Branch</th>
                    <th>Section</th>
                    <th>Email</th>
                    <th>Action</th>
                </tr>
                <c:forEach items="${studentList}" var="student">
                    <tr>
                        <td><c:out value="${student.id}" /></td>
                        <td><c:out value="${student.name}" /></td>
                        <td><c:out value="${student.gender}" /></td>
                        <td><c:out value="${student.dob}" /></td>
                        <td><c:out value="${student.phoneno}" /></td>
                        <td><c:out value="${student.year}" /></td>
                        <td><c:out value="${student.branch}" /></td>
                        <td><c:out value="${student.sec}" /></td>
                        <td><c:out value="${student.email}" /></td>
                        <td>
                            <a href='<c:url value="update?id=${student.id}"/>'>Update</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
</body>
</html>

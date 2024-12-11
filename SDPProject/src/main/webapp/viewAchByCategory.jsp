<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="achSidebar.jsp" %> <!-- Including the achSidebar file -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Achievements By Category</title>
    <style>
        /* Body and page settings */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            min-height: 100vh;
            background-color: #f7f7f7;
        }

        /* Main content */
        .main-content {
            margin-left: 270px; /* Sidebar width + padding */
            padding: 20px;
            flex: 1;
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
        }

        /* Form styling */
        form {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
        }

        label {
            font-weight: bold;
            margin-bottom: 0.5rem;
            color: #333;
        }

        .form-control {
            width: 100%;
            padding: 0.75rem 1rem;
            margin-bottom: 1rem;
            border: 1px solid #ddd;
            border-radius: 0.375rem;
            font-size: 1rem;
            color: #666;
        }

        .form-control:focus {
            border-color: #ff6b00;
            outline: none;
        }

        .btn {
            display: inline-block;
            padding: 0.75rem 1.5rem;
            background-color: #ff6b00;
            color: white;
            border: none;
            border-radius: 0.375rem;
            font-size: 1rem;
            cursor: pointer;
            width: 100%;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #cc5700;
        }

        /* Container for achievement cards */
        .container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
        }

        /* Card styling */
        .card {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 300px;
            padding: 20px;
            text-align: center;
            transition: transform 0.2s ease-in-out;
            border: none; /* Remove border */
        }

        .card:hover {
            transform: scale(1.05);
        }

        .card h3 {
            margin: 10px 0;
            font-size: 1.5rem;
            color: #333;
        }

        .card p {
            font-size: 1rem;
            color: #666;
            margin: 5px 0;
        }

        .status {
            padding: 5px 10px;
            border-radius: 5px;
            font-weight: bold;
        }

        .status.approved {
            background-color: #4caf50;
            color: white;
        }

        .status.not-approved {
            background-color: #e53935;
            color: white;
        }

        /* Pagination */
        .pagination {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        .pagination a {
            text-decoration: none;
            padding: 10px 20px;
            margin: 0 5px;
            background-color: #333;
            color: white;
            border-radius: 5px;
        }

        .pagination a:hover {
            background-color: #555;
        }
    </style>
</head>
<body>

<!-- Main content area -->
<div class="main-content">
    <h1>View Achievements By Category</h1>
    <form action="displayAchByCategory" method="post">
        <label for="category">Select Category:</label>
        <select name="category" id="category" class="form-control" required>
            <option value="">--- Select ---</option>
            <c:forEach items="${categoryList}" var="category">
                <option value="${category}">${category}</option>
            </c:forEach>
        </select>
        <button type="submit" class="btn">View Achievements</button>
    </form>

    <!-- Container for achievement cards -->
    <div class="container">
        <c:forEach var="achievement" items="${achievements}">
            <div class="card">
                <h3><c:out value="${achievement.category}" /></h3>
                <p><c:out value="${achievement.description}" /></p>
                <p>Student: <c:out value="${achievement.studentName}" /></p>
                <p>Date: <c:out value="${achievement.dateCreated}" /></p>
                <span class="status <c:out value='${achievement.status == "Approved" ? "approved" : "not-approved"}' />">
                    <c:out value="${achievement.status}" />
                </span>
            </div>
        </c:forEach>
    </div>

    <!-- Pagination links -->
    <div class="pagination">
        <c:if test="${not empty prevPage}">
            <a href="?page=${prevPage}">Previous</a>
        </c:if>
        <c:if test="${not empty nextPage}">
            <a href="?page=${nextPage}">Next</a>
        </c:if>
    </div>
</div>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="achSidebar.jsp" %> <!-- Including the achSidebar file -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>All Achievements</title>
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
        }

        .card:hover {
            transform: scale(1.05);
        }

        .card img {
            max-width: 100%;
            height: auto;
            border-radius: 8px;
            margin-bottom: 15px;
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
    <h1>All Achievements</h1>
    <div class="container">
        <!-- Loop through achievements and display cards -->
        <c:forEach var="achievement" items="${achievements}">
            <div class="card">
                <img src="displayAllCerts?achievementId=${achievement.id}" alt="Achievement Image">
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

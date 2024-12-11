<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Approve Achievements</title>
    <style>
        /* General Body Style */
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            padding: 0;
            display: flex;
            flex-direction: column;
            height: 100vh;
            background-color: #f4f4f4;
        }

        /* Container for Sidebar and Content */
        .container {
            display: flex;
            min-height: 100vh;
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
            margin-left: 250px;
            padding: 20px;
            flex: 1;
            overflow-y: auto;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        /* Page Title */
        h3 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        /* Error Message */
        .message {
            text-align: center;
            color: red;
            margin-bottom: 20px;
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
            font-size: 18px;
            color: #333;
            margin-bottom: 10px;
        }

        .card p {
            color: #555;
            font-size: 14px;
            margin: 5px 0;
        }

        .card button {
            background-color: #5cb85c;
            color: white;
            border: none;
            padding: 8px 15px;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
        }

        .card button:hover {
            background-color: #4cae4c;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Sidebar -->
        <%@ include file="achSidebar.jsp" %>

        <!-- Main Content -->
        <div class="content">
            <h3>Approve Achievements</h3>

            <!-- Display the message if it's not empty -->
            <c:if test="${not empty message}">
                <p class="message">${message}</p>
            </c:if>

            <!-- Only render achievements if they exist -->
            <c:if test="${not empty achievements}">
                <div class="card-container">
                    <c:forEach items="${achievements}" var="ach">
                        <div class="card">
                            <h4>Achievement ID: <c:out value="${ach.id}" /></h4>
                            <p><strong>Category:</strong> <c:out value="${ach.category}" /></p>
                            <p><strong>Description:</strong> <c:out value="${ach.description}" /></p>
                            <p><strong>Status:</strong> <c:out value="${ach.status}" /></p>
                            <form action="${pageContext.request.contextPath}/approveAchievement" method="post">
                                <input type="hidden" name="achievementId" value="${ach.id}" />
                                <button type="submit">Approve</button>
                            </form>
                        </div>
                    </c:forEach>
                </div>
            </c:if>
        </div>
    </div>
</body>
</html>

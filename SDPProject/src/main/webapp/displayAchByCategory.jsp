<%@ page import="com.jfsd.SDPProject.model.Achievement" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Achievements in Category</title>
    <style>
        /* Layout styles */
        body {
            display: flex;
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f7f7f7;
        }

        .main-container {
            display: flex;
            width: 100%;
            flex-direction: row;
            height: 100vh;
        }

        .sidebar {
            width: 250px;
            background-color: #333;
            color: white;
            padding: 20px;
            flex-shrink: 0; /* Prevents shrinking of the sidebar */
        }

        .content {
            flex-grow: 1;
            padding: 20px;
            overflow-y: auto; /* Allows scrolling for content if necessary */
        }

        .achievements-container {
            display: grid;
            grid-template-columns: repeat(2, 1fr); /* Two cards per row */
            gap: 20px; /* Space between cards */
            width: 100%;
        }

        .achievement-card {
            background-color: white;
            border-radius: 12px;
            border: 6px solid #ff6b00;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            padding: 20px;
            text-align: center;
            display: flex;
            flex-direction: column;
            align-items: center;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .achievement-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 6px 18px rgba(0, 0, 0, 0.2);
        }

        .certificate img {
            width: 100%;
            height: 200px;
            object-fit: cover;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }

        .certificate img:hover {
            transform: scale(1.05);
        }

        .status {
            font-size: 1.2rem;
            font-weight: bold;
            margin-top: 10px;
            padding: 5px 15px;
            border-radius: 5px;
            letter-spacing: 1px;
        }

        .status.approved {
            background-color: #4caf50;
            color: white;
            border: 2px solid #388e3c;
        }

        .status.not-approved {
            background-color: #e53935;
            color: white;
            border: 2px solid #d32f2f;
        }
    </style>
</head>
<body>
    <div class="main-container">
        <%@ include file="achSidebar.jsp" %>

        <div class="content">
            <c:choose>
                <c:when test="${not empty achievements}">
                    <div class="achievements-container">
                        <c:forEach items="${achievements}" var="achievement">
                            <div class="achievement-card">
                                <div class="certificate">
                                    <c:choose>
                                        <c:when test="${achievement.status == 'Approved'}">
                                            <img src="displayCert_c?category=${achievement.category}" alt="Certificate" />
                                        </c:when>
                                        <c:otherwise>
                                            <span>Waiting for approval</span>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <div class="status <c:out value="${achievement.status == 'Approved' ? 'approved' : 'not-approved'}" />">
                                    <c:out value="${achievement.status}" />
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:when>
                <c:otherwise>
                    <p style="text-align:center; font-size: 1.2rem; color: #666;">No achievements found for the selected category.</p>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</body>
</html>

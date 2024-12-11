<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View All Achievements</title>
    <style>
        /* Global styles */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f7f7f7;
            margin: 0;
            padding: 0;
        }

        h3 {
            text-align: center;
            margin-top: 20px;
            color: #333;
            font-size: 2.2rem;
            font-weight: 700;
            letter-spacing: 1px;
        }

        /* Container for the achievements */
        .achievements-container {
            display: grid;
            grid-template-columns: repeat(3, 1fr); /* 3 cards per row */
            gap: 30px; /* Increased gap between cards */
            padding: 30px;
            margin-top: 20px;
        }

        /* Each achievement card styling */
      .achievement-card {
    border-radius: 12px;
    border: 6px solid #ff6b00; /* Bright Pink border, increased thickness */
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    overflow: hidden;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    padding: 20px;
    text-align: center;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: space-between;
    height: 100%;
    position: relative;
}
      

        /* Hover effect for cards */
        .achievement-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 6px 18px rgba(0, 0, 0, 0.2);
        }

        .achievement-category {
            font-weight: bold;
            font-size: 1.6rem;
             /* A vibrant pinkish-red for the category */
            text-transform: uppercase;
            margin-bottom: 10px;
            letter-spacing: 1px;
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.1);
        }

        /* New Font for description text */
        .achievement-description {
            font-family: 'Georgia', serif; /* Elegant font for descriptions */
            margin: 10px 0;
            font-size: 1.1rem;
            color: #333; /* Dark text for readability */
            line-height: 1.6;
            padding: 0 15px;
            border: 1px solid #ddd;
            border-radius: 8px;
            background-color: #f9f9f9;
            text-align: justify;
            box-shadow: inset 0 0 8px rgba(0, 0, 0, 0.05);
        }

        .certificate {
            margin: 10px 0;
            position: relative;
        }

        .certificate img {
            width: 100%;
            height: 200px; /* Fixed height for uniform images */
            object-fit: cover;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }

        /* Hover effect on image */
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

        /* Approved status */
        .status.approved {
            background-color: #4caf50; /* Green for approved */
            color: white;
            border: 2px solid #388e3c;
        }

        /* Not approved status */
        .status.not-approved {
            background-color: #e53935; /* Red for not approved */
            color: white;
            border: 2px solid #d32f2f;
        }

        /* Media query for mobile devices */
        @media (max-width: 768px) {
            .achievements-container {
                grid-template-columns: 1fr 1fr; /* 2 cards per row */
                gap: 20px;
            }
        }

        @media (max-width: 480px) {
            .achievements-container {
                grid-template-columns: 1fr; /* 1 card per row */
                gap: 15px;
            }

            .achievement-card {
                padding: 15px;
            }
        }

    </style>
</head>
<body>

    <%@ include file="studentNavbar.jsp" %>

    <h3>View All Achievements</h3>

    <!-- Container for all achievements -->
    <div class="achievements-container">
        <c:forEach items="${achievements}" var="ach">
            <div class="achievement-card">
                <div class="achievement-category">
                    <c:out value="${ach.category}" />
                </div>
                <div class="achievement-description">
                    <c:out value="${ach.description}" />
                </div>
                <div class="certificate">
                    <c:choose>
                        <c:when test="${ach.status == 'Approved'}">
                            <img src="displayCert?achievementId=${ach.id}" alt="Certificate" />
                        </c:when>
                        <c:otherwise>
                            <span>Waiting for approval</span>
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="status <c:out value="${ach.status == 'Approved' ? 'approved' : 'not-approved'}" />">
                    <c:out value="${ach.status}" />
                </div>
            </div>
        </c:forEach>
    </div>

</body>
</html>

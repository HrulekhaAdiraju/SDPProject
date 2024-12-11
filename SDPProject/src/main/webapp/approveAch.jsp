<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Approve Achievements</title>
</head>
<body>
<%@include file="achSidebar.jsp" %>
    <h3 align="center">Approve Achievements</h3>
    
    <c:if test="${not empty message}">
        <p style="color:red; text-align:center">${message}</p>
    </c:if>
    
    <table align="center" border="1" cellpadding="5" cellspacing="0">
        <tr>
            <th>ID</th>
            <th>Category</th>
            <th>Description</th>
            <th>Status</th>
            <th>Action</th>
        </tr>
        
        <c:forEach items="${achievements}" var="ach">
            <tr>
                <td><c:out value="${ach.id}" /></td>
                <td><c:out value="${ach.category}" /></td>
                <td><c:out value="${ach.description}" /></td>
                <td><c:out value="${ach.status}" /></td>
                <td>
                    <form action="${pageContext.request.contextPath}approveAchievement" method="post">
                        <input type="hidden" name="achievementId" value="${ach.id}" />
                        <button type="submit">Approve</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>

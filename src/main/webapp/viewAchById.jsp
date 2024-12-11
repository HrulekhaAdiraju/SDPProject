<%@ page import="com.jfsd.SDPProject.model.Student" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Achievements By Student ID</title>
</head>
<body>
    <h3>View Achievements By Student ID</h3>

    <form action="displayAchById" method="post">
        <label>Select Student:</label>
        <select name="studentId" required>
            <option value="">---Select---</option>
            <!-- Iterate over the studentList to populate the dropdown -->
            <c:forEach items="${studentList}" var="student">
                <option value="${student.id}">${student.id} - ${student.name}</option>
            </c:forEach>
        </select>
        <br/>
        <input type="submit" value="View Achievements">
    </form>
</body>
</html>

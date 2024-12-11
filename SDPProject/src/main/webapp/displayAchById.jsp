<h3>Achievements by Student ID</h3>

<c:if test="${not empty achievements}">
    <table border="1">
        <thead>
            <tr>
                <th>Name</th>
                <th>Description</th>
                <th>Date Created</th>
                <th>Category</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${achievements}" var="achievement">
                <tr>
                    <td><c:out value="${achievement.studentName}"/></td>
                    <td><c:out value="${achievement.description}"/></td>
                    <td><c:out value="${achievement.dateCreated}"/></td>
                    <td><c:out value="${achievement.category}"/></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</c:if>

<c:if test="${empty achievements}">
    <p>No achievements found for the selected student ID.</p>
</c:if>

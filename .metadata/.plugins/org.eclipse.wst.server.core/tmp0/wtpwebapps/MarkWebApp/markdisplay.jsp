<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="model.StudentMark" %>
<!DOCTYPE html>
<html>
<head>
    <title>Display Student Marks</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary px-4">
    <a class="navbar-brand" href="index.jsp">Mark Management</a>
</nav>

<div class="container mt-5">
    <h2>All Student Marks</h2>

    <%
        List<StudentMark> marksList = (List<StudentMark>) request.getAttribute("marksList");
        if (marksList == null || marksList.isEmpty()) {
    %>
        <div class="alert alert-info mt-4">No records found.</div>
    <% } else { %>
        <table class="table table-bordered table-striped mt-4">
            <thead class="table-primary">
                <tr>
                    <th>Student ID</th>
                    <th>Name</th>
                    <th>Subject</th>
                    <th>Marks</th>
                    <th>Exam Date</th>
                </tr>
            </thead>
            <tbody>
                <% for (StudentMark m : marksList) { %>
                    <tr>
                        <td><%= m.getStudentID() %></td>
                        <td><%= m.getStudentName() %></td>
                        <td><%= m.getSubject() %></td>
                        <td><%= m.getMarks() %></td>
                        <td><%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(m.getExamDate()) %></td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    <% } %>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

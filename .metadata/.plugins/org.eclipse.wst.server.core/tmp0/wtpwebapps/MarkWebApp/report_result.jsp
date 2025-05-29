<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="model.StudentMark" %>
<!DOCTYPE html>
<html>
<head>
    <title>Report Results</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary px-4">
    <a class="navbar-brand" href="index.jsp">Mark Management</a>
</nav>

<div class="container mt-5">
    <h2><%= request.getAttribute("reportTitle") != null ? request.getAttribute("reportTitle") : "Report Results" %></h2>

    <%
        List<StudentMark> results = (List<StudentMark>) request.getAttribute("results");
        if (results == null || results.isEmpty()) {
    %>
        <div class="alert alert-info mt-4">No records found for this report.</div>
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
                <% for (StudentMark sm : results) { %>
                    <tr>
                        <td><%= sm.getStudentID() %></td>
                        <td><%= sm.getStudentName() %></td>
                        <td><%= sm.getSubject() %></td>
                        <td><%= sm.getMarks() %></td>
                        <td><%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(sm.getExamDate()) %></td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    <% } %>

    <a href="report_form.jsp" class="btn btn-primary mt-3">Back to Reports</a>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

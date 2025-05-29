<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="model.StudentMark" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Marks</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary px-4">
    <a class="navbar-brand" href="index.jsp">Mark Management</a>
</nav>

<div class="container mt-5">
    <h2>Update Student Marks</h2>

    <% String error = (String) request.getAttribute("error");
       if (error != null) { %>
        <div class="alert alert-danger"><%= error %></div>
    <% } %>

    <%
        StudentMark mark = (StudentMark) request.getAttribute("mark");
        if (mark == null) {
    %>
        <!-- If no mark object (first time or from GET by studentId) -->
        <form action="UpdateMarkServlet" method="get" class="mt-4">
            <div class="mb-3">
                <label for="studentId" class="form-label">Enter Student ID to update</label>
                <input type="number" name="studentId" class="form-control" required/>
            </div>
            <button type="submit" class="btn btn-primary w-100">Fetch Record</button>
        </form>
    <% 
        } else { 
    %>
        <!-- If mark object exists, show pre-filled update form -->
        <form action="UpdateMarkServlet" method="post" class="mt-4">
            <input type="hidden" name="studentId" value="<%= mark.getStudentID() %>" />
            <div class="mb-3">
                <label for="studentName" class="form-label">Student Name</label>
                <input type="text" name="studentName" class="form-control" value="<%= mark.getStudentName() %>" required/>
            </div>
            <div class="mb-3">
                <label for="subject" class="form-label">Subject</label>
                <input type="text" name="subject" class="form-control" value="<%= mark.getSubject() %>" required/>
            </div>
            <div class="mb-3">
                <label for="marks" class="form-label">Marks</label>
                <input type="number" name="marks" min="0" max="100" class="form-control" value="<%= mark.getMarks() %>" required/>
            </div>
            <div class="mb-3">
                <label for="examDate" class="form-label">Exam Date</label>
                <input type="date" name="examDate" class="form-control" value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(mark.getExamDate()) %>" required/>
            </div>
            <button type="submit" class="btn btn-primary w-100">Update Record</button>
        </form>
    <% } %>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

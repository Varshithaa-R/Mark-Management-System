<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Mark Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary px-4">
    <a class="navbar-brand" href="#">Mark Management</a>
</nav>

<div class="container d-flex flex-column align-items-center justify-content-center mt-5">
    <h2 class="text-center mb-4">Welcome to Mark Management System</h2>

    <% String message = (String) session.getAttribute("message");
       if (message != null) { %>
        <div class="alert alert-info alert-dismissible fade show w-75 text-center" role="alert">
            <%= message %>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    <% session.removeAttribute("message"); } %>

    <!-- Vertical stack of buttons -->
    <div class="d-flex flex-column gap-3 w-50">
        <a href="markadd.jsp" class="btn btn-primary">Add Marks</a>
        <a href="markupdate.jsp" class="btn btn-primary">Update Marks</a>
        <a href="markdelete.jsp" class="btn btn-primary">Delete Record</a>
        <a href="DisplayMarksServlet" class="btn btn-primary">Display Marks</a>
        <a href="report_form.jsp" class="btn btn-primary">Generate Reports</a>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

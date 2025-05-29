<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Student Record</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary px-4">
    <a class="navbar-brand" href="index.jsp">Mark Management</a>
</nav>

<div class="container mt-5">
    <h2>Delete Student Record</h2>

    <% String error = (String) request.getAttribute("error");
       if (error != null) { %>
        <div class="alert alert-danger"><%= error %></div>
    <% } %>

    <form action="DeleteMarkServlet" method="post" class="mt-4">
        <div class="mb-3">
            <label for="studentId" class="form-label">Enter Student ID to Delete</label>
            <input type="number" name="studentId" class="form-control" required/>
        </div>
        <button type="submit" class="btn btn-primary w-100">Delete Record</button>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

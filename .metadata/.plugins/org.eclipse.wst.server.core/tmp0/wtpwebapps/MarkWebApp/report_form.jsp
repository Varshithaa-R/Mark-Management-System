<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Generate Reports</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <script>
        function toggleInputs() {
            var reportType = document.getElementById("reportType").value;
            document.getElementById("marksAboveInput").style.display = (reportType === "marksAbove") ? "block" : "none";
            document.getElementById("subjectInput").style.display = (reportType === "subjectScores") ? "block" : "none";
            document.getElementById("topNInput").style.display = (reportType === "topN") ? "block" : "none";
        }
    </script>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary px-4">
    <a class="navbar-brand" href="index.jsp">Mark Management</a>
</nav>

<div class="container mt-5">
    <h2>Generate Reports</h2>

    <form action="ReportCriteriaServlet" method="post" class="mt-4">
        <div class="mb-3">
            <label for="reportType" class="form-label">Select Report Type</label>
            <select id="reportType" name="reportType" class="form-select" onchange="toggleInputs()" required>
                <option value="">-- Select --</option>
                <option value="marksAbove">Students with Marks Above a Value</option>
                <option value="subjectScores">Students Who Scored in a Subject</option>
                <option value="topN">Top N Students by Marks</option>
            </select>
        </div>

        <div class="mb-3" id="marksAboveInput" style="display:none;">
            <label for="threshold" class="form-label">Marks Threshold</label>
            <input type="number" id="threshold" name="threshold" min="0" max="100" class="form-control"/>
        </div>

        <div class="mb-3" id="subjectInput" style="display:none;">
            <label for="subject" class="form-label">Subject</label>
            <input type="text" id="subject" name="subject" class="form-control"/>
        </div>

        <div class="mb-3" id="topNInput" style="display:none;">
            <label for="topN" class="form-label">Number of Top Students</label>
            <input type="number" id="topN" name="topN" min="1" class="form-control"/>
        </div>

        <button type="submit" class="btn btn-primary w-100">Generate Report</button>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

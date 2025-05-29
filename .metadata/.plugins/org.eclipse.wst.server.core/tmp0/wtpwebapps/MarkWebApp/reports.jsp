<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Reports Dashboard</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f0f2f5;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 700px;
            margin: 60px auto;
            background: white;
            padding: 40px 30px;
            border-radius: 12px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            text-align: center;
        }
        h1 {
            margin-bottom: 30px;
            color: #2c3e50;
        }
        .report-link {
            display: block;
            margin: 15px auto;
            font-size: 18px;
            background: #3498db;
            color: white;
            padding: 12px 25px;
            width: 280px;
            border-radius: 8px;
            text-decoration: none;
            transition: background-color 0.3s;
            border: none;
            cursor: pointer;
        }
        .report-link:hover {
            background: #2980b9;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Reports</h1>

    <!-- Link to report: Students with marks above a specified value -->
    <form action="ReportCriteriaServlet" method="get" style="margin-bottom: 20px;">
        <input type="hidden" name="reportType" value="aboveThreshold" />
        <input type="number" name="threshold" placeholder="Enter marks threshold" required min="0" max="100" style="padding: 10px; width: 220px; margin-bottom: 10px;" />
        <br />
        <button class="report-link" type="submit">Students with Marks Above Threshold</button>
    </form>

    <!-- Link to report: Students who scored in a specific subject -->
    <form action="ReportCriteriaServlet" method="get" style="margin-bottom: 20px;">
        <input type="hidden" name="reportType" value="bySubject" />
        <input type="text" name="subject" placeholder="Enter subject name" required style="padding: 10px; width: 220px; margin-bottom: 10px;" />
        <br />
        <button class="report-link" type="submit">Students Scoring in a Subject</button>
    </form>

    <!-- Link to report: Top N students based on marks -->
    <form action="ReportCriteriaServlet" method="get">
        <input type="hidden" name="reportType" value="topN" />
        <input type="number" name="topN" placeholder="Enter number of top students" required min="1" max="100" style="padding: 10px; width: 220px; margin-bottom: 10px;" />
        <br />
        <button class="report-link" type="submit">Top N Students</button>
    </form>

    <br />
    <a href="index.jsp" style="color:#3498db; font-size: 16px; text-decoration:none;">&larr; Back to Home</a>
</div>
</body>
</html>

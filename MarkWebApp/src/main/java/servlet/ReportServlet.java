package servlet;

import dao.MarkDAO;
import model.StudentMark;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/ReportServlet")
public class ReportServlet extends HttpServlet {
    private MarkDAO dao;

    @Override
    public void init() {
        dao = new MarkDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false); // false to avoid creating a new session

        if (session == null) {
            response.sendRedirect("report_form.jsp");
            return;
        }

        String reportType = (String) session.getAttribute("reportType");
        List<StudentMark> results = null;

        try {
            if ("marksAbove".equals(reportType)) {
                String thresholdStr = (String) session.getAttribute("threshold");
                if (thresholdStr != null) {
                    int threshold = Integer.parseInt(thresholdStr);
                    results = dao.getMarksAbove(threshold); // adjust to your DAO method
                    request.setAttribute("reportTitle", "Students scoring above " + threshold);
                }
            } else if ("subjectScores".equals(reportType)) {
                String subject = (String) session.getAttribute("subject");
                if (subject != null) {
                    results = dao.getMarksBySubject(subject); // adjust to your DAO method
                    request.setAttribute("reportTitle", "Students in Subject: " + subject);
                }
            } else if ("topN".equals(reportType)) {
                String topNStr = (String) session.getAttribute("topN");
                if (topNStr != null) {
                    int topN = Integer.parseInt(topNStr);
                    results = dao.getTopNStudents(topN); // adjust to your DAO method
                    request.setAttribute("reportTitle", "Top " + topN + " Students");
                }
            }

            if (results != null) {
                request.setAttribute("results", results);
                request.getRequestDispatcher("report_result.jsp").forward(request, response);
            } else {
                session.setAttribute("message", "Invalid or missing report criteria.");
                response.sendRedirect("report_form.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("message", "An error occurred while generating the report.");
            response.sendRedirect("report_form.jsp");
        }
    }
}

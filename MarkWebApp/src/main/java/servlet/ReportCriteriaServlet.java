package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/ReportCriteriaServlet")
public class ReportCriteriaServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String reportType = request.getParameter("reportType");
        HttpSession session = request.getSession();

        if ("marksAbove".equals(reportType)) {
            String thresholdStr = request.getParameter("threshold");
            session.setAttribute("reportType", "marksAbove");
            session.setAttribute("threshold", thresholdStr);
        } else if ("subjectScores".equals(reportType)) {
            String subject = request.getParameter("subject");
            session.setAttribute("reportType", "subjectScores");
            session.setAttribute("subject", subject);
        } else if ("topN".equals(reportType)) {
            String topNStr = request.getParameter("topN");
            session.setAttribute("reportType", "topN");
            session.setAttribute("topN", topNStr);
        } else {
            session.setAttribute("message", "Invalid report type selected.");
            response.sendRedirect("index.jsp");
            return;
        }

        response.sendRedirect("ReportServlet");
    }
}

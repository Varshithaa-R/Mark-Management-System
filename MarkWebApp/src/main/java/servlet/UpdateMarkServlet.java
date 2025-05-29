package servlet;

import dao.MarkDAO;
import model.StudentMark;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/UpdateMarkServlet")
public class UpdateMarkServlet extends HttpServlet {
    private MarkDAO dao;

    @Override
    public void init() {
        dao = new MarkDAO();
    }

    // Show form pre-filled
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int studentId = Integer.parseInt(request.getParameter("studentId"));
            StudentMark mark = dao.getMarkById(studentId);
            if (mark != null) {
                request.setAttribute("mark", mark);
                request.getRequestDispatcher("markupdate.jsp").forward(request, response);
            } else {
                HttpSession session = request.getSession();
                session.setAttribute("message", "Record not found for StudentID: " + studentId);
                response.sendRedirect("index.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("index.jsp");
        }
    }

    // Process form submission
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int studentId = Integer.parseInt(request.getParameter("studentId"));
            String studentName = request.getParameter("studentName");
            String subject = request.getParameter("subject");
            int marks = Integer.parseInt(request.getParameter("marks"));
            String examDateStr = request.getParameter("examDate");

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date examDate = sdf.parse(examDateStr);

            StudentMark mark = new StudentMark(studentId, studentName, subject, marks, examDate);
            boolean updated = dao.updateMark(mark);

            HttpSession session = request.getSession();
            if (updated) {
                session.setAttribute("message", "Record updated successfully!");
                response.sendRedirect("index.jsp");
            } else {
                request.setAttribute("error", "Failed to update record.");
                request.setAttribute("mark", mark);
                request.getRequestDispatcher("markupdate.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Invalid input or error occurred.");
            request.getRequestDispatcher("markupdate.jsp").forward(request, response);
        }
    }
}

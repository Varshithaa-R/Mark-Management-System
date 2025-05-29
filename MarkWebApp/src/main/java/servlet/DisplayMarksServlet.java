package servlet;

import dao.MarkDAO;
import model.StudentMark;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/DisplayMarksServlet")
public class DisplayMarksServlet extends HttpServlet {
    private MarkDAO dao;

    @Override
    public void init() {
        dao = new MarkDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<StudentMark> marks = dao.getAllMarks();
        request.setAttribute("marksList", marks);
        request.getRequestDispatcher("markdisplay.jsp").forward(request, response);
    }
}

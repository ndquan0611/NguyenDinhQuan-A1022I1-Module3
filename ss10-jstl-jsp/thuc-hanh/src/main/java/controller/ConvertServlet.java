package controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ConvertServlet", value = "/view/convert/convert")
public class ConvertServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        float rate = Float.parseFloat(request.getParameter("rate"));
        float usd = Float.parseFloat(request.getParameter("usd"));

        float vnd = rate + usd;
        request.setAttribute("vnd", vnd);
        RequestDispatcher rd = request.getRequestDispatcher("/view/convert/convert.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        float rate = Float.parseFloat(request.getParameter("rate"));
        float usd = Float.parseFloat(request.getParameter("usd"));

        float vnd = rate + usd;
        request.setAttribute("vnd", vnd);
        RequestDispatcher rd = request.getRequestDispatcher("/view/convert/convert.jsp");
        rd.forward(request, response);
    }
}

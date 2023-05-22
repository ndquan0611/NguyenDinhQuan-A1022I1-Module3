package controller;

import bean.User;
import service.UserService;
import service.UserServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

@WebServlet(name = "UserServlet", value = "/user")
public class UserServlet extends HttpServlet {
    private static UserService service = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }

        switch (action) {
            case "create":
                showCreate(request, response);
                break;
            case "update":
                showUpdate(request, response);
                break;
            case "detail":
                showDetail(request, response);
                break;
            case "sort":
                showSort(request, response);
                break;
            case "delete":
                showDelete(request, response);
                break;
            default:
                showList(request, response);
        }
    }

    private void showSort(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> users = service.sort();
        request.setAttribute("users", users);
        request.getRequestDispatcher("WEB-INF/view/user/list.jsp").forward(request, response);
    }

    private void showDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        User user = service.findById(id);
        request.setAttribute("detail", user);
        request.getRequestDispatcher("/WEB-INF/view/user/detail.jsp").forward(request, response);
    }

    private void showDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        service.delete(id);
        showList(request, response);
    }

    private void showUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        User user = service.findById(id);
        request.setAttribute("user", user);
        request.getRequestDispatcher("/WEB-INF/view/user/update.jsp").forward(request, response);
    }

    private void showCreate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/view/user/create.jsp").forward(request, response);
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> users = service.findAll();
        request.setAttribute("users", users);
        request.getRequestDispatcher("/WEB-INF/view/user/list.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "create":
                doCreate(request, response);
                break;
            case "update":
                doUpdate(request, response);
                break;
            case "search":
                doSearch(request, response);
                break;
            case "delete":
                break;
            default:
                response.sendRedirect("/user?action=list.jsp");
        }
    }

    private void doSearch(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.setCharacterEncoding("UTF-8");
        String txtSearch = request.getParameter("search");
        List<User> users = service.findUserByCountry(txtSearch);
        request.setAttribute("users", users);
        request.setAttribute("search", txtSearch);
        request.getRequestDispatcher("/WEB-INF/view/user/list.jsp").forward(request, response);
    }

    private void doUpdate(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        User user = new User(id, name, email, country);
        service.update(user);
        response.sendRedirect("/user");
    }

    private void doCreate(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        User user = new User(id, name, email, country);
        service.save(user);
        response.sendRedirect("/user");
    }
}

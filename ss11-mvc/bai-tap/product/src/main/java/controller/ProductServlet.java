package controller;

import bean.Product;
import service.ProductService;
import service.ProductServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductServlet", value = "/product")
public class ProductServlet extends HttpServlet {
    private static ProductService service = new ProductServiceImpl();
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
            case "delete":
                showDelete(request, response);
                break;
            default:
                showList(request, response);
        }
    }

    private void showDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        service.delete(id);
        showList(request, response);
    }

    private void showDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = service.findById(id);
        request.setAttribute("product", product);
        request.getRequestDispatcher("/WEB-INF/view/product/detail.jsp").forward(request, response);
    }

    private void showUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = service.findById(id);
        request.setAttribute("product", product);
        request.getRequestDispatcher("/WEB-INF/view/product/update.jsp").forward(request, response);
    }

    private void showCreate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/view/product/create.jsp").forward(request, response);
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> products = service.findAll();
        request.setAttribute("products", products);
        request.getRequestDispatcher("/WEB-INF/view/product/list.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }

        switch (action) {
            case "create":
                doCreate(request, response);
                break;
            case "update":
                doUpdate(request, response);
                break;
            default:
                response.sendRedirect("/product?action=list.jsp");
        }
    }

    private void doUpdate(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String desc = request.getParameter("desc");
        String producer = request.getParameter("producer");
        Product product = new Product(id, name, price, desc, producer);
        if (service.update(product)) {
            response.sendRedirect("/product");
        }
    }

    private void doCreate(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String desc = request.getParameter("desc");
        String producer = request.getParameter("producer");
        Product product = new Product(id, name, price, desc, producer);
        if (service.save(product)) {
            response.sendRedirect("/product");
        }
    }
}

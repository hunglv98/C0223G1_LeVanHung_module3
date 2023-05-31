package servlet;

import model.Product;
import service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductServlet", value = "/product-servlet")
public class ProductServlet extends HttpServlet {
    private ProductService productService = new ProductService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        RequestDispatcher requestDispatcher;
        int id;
        switch (action) {
            case "create":
                createNewProduct(request,response);
                break;
            case "edit":
                editProduct(request,response);
                break;
            case "delete":
                productService.delete(request);
                response.sendRedirect("/product-servlet");
                break;
            default:
                List<Product> list = productService.getList();
                request.setAttribute("list",list);
                requestDispatcher = request.getRequestDispatcher("show.jsp");
                requestDispatcher.forward(request,response);
        }
    }
//    int id, String name, double price, String description, String manufacturer
    private void editProduct(HttpServletRequest request, HttpServletResponse response) {
       int id = Integer.parseInt(request.getParameter("id"));
       request.setAttribute("id",id);
       RequestDispatcher requestDispatcher = request.getRequestDispatcher("edit.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void createNewProduct(HttpServletRequest request, HttpServletResponse response) {
        try {
            response.sendRedirect("add.jsp");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action==null){
            action = "";
        }
        switch (action){
            case "add":
                productService.add(request);
                response.sendRedirect("/product-servlet");
                break;
            case "edit":
                int id = Integer.parseInt(request.getParameter("id")) ;
                String name = request.getParameter("name");
                double price = Double.parseDouble(request.getParameter("price"));
                String description = request.getParameter("description");
                String manufacturer = request.getParameter("manufacturer");
                productService.edit(id,name,price,description,manufacturer);
                response.sendRedirect("/product-servlet");
                break;
            default:
                break;
        }
    }
}

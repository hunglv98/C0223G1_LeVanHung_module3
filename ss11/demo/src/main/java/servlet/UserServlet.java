package servlet;

import model.User;
import service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "UserServlet", value = "/UserServlet")
public class UserServlet extends HttpServlet {
    private final UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        RequestDispatcher requestDispatcher;
        int id;
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "show":
                break;
            case "create":
                requestDispatcher = request.getRequestDispatcher("create.jsp");
                requestDispatcher.forward(request, response);
                break;
            case "edit":
                id = Integer.parseInt(request.getParameter("id"));
                User user = userService.selectUser(id);
                request.setAttribute("user", user);
                requestDispatcher = request.getRequestDispatcher("edit.jsp");
                requestDispatcher.forward(request, response);
                break;
            case "delete":
                id = Integer.parseInt(request.getParameter("id"));
                try {
                    userService.deleteUser(id);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                response.sendRedirect("/UserServlet");
                break;
            default:
                List<User> list = userService.selectAllUsers();
                request.setAttribute("list", list);
                requestDispatcher = request.getRequestDispatcher("show.jsp");
                requestDispatcher.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws  IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createUser(request);
                response.sendRedirect("/UserServlet");
                break;
            case "delete":
                break;
            case "edit":
                int id = Integer.parseInt(request.getParameter("id"));
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String country = request.getParameter("country");
                try {
                    userService.updateUser(id, name, email, country);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                response.sendRedirect("/UserServlet");
                break;
            default:
                break;
        }
    }

    private void createUser(HttpServletRequest request) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        User user = new User(name, email, country);
        try {
            userService.insertUser(user);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

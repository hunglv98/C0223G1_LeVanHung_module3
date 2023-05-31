package servlet;

import model.Student;
import service.StudentService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "StudentServlet", value = "/student-servlet")
public class StudentServlet extends HttpServlet {
    private StudentService studentService = new StudentService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        RequestDispatcher requestDispatcher;
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                requestDispatcher = request.getRequestDispatcher("add.jsp");
                requestDispatcher.forward(request,response);
                break;
            case "delete":
                int id = Integer.parseInt(request.getParameter("id"));
                studentService.delete(id);
                response.sendRedirect("index.jsp");
                break;
            case "edit":
                int id1 = Integer.parseInt(request.getParameter("id"));
                request.setAttribute("id",id1);
                requestDispatcher = request.getRequestDispatcher("edit.jsp");
                requestDispatcher.forward(request,response);
                break;
            default:
                List<Student> list = studentService.getList();
                request.setAttribute("list", list);
                requestDispatcher = request.getRequestDispatcher("show_list.jsp");
                requestDispatcher.forward(request, response);
                break;
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id;
        String name;
        String address;
        String email;


        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action){
            case "edit":
                id = Integer.parseInt(request.getParameter("id"));
                name = request.getParameter("name");
                address = request.getParameter("address");
                email = request.getParameter("email");
                studentService.edit(id,name,address,email);
                response.sendRedirect("index.jsp");
                break;
            default:
                id = Integer.parseInt(request.getParameter("id"));
                name = request.getParameter("name");
                address = request.getParameter("address");
                email = request.getParameter("email");
                Student student = new Student(id,name,address,email);
                studentService.add(student);
                response.sendRedirect("index.jsp");
        }

    }
}

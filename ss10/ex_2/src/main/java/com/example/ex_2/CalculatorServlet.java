package com.example.ex_2;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CalculatorServlet", value = "/CalculatorServlet")
public class CalculatorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        double first = Double.parseDouble(request.getParameter("first"));
        double second = Double.parseDouble(request.getParameter("second"));
        double result=0;
        String operator = request.getParameter("toanTu");
        switch (operator){
            case "cong":
                result = first + second;
                break;
            case "tru":
                result = first - second;
                break;
            case "nhan":
                result = first * second;
                break;
            case "chia":
                try {
                    result = first / second;
                }catch (ArithmeticException e){
                    e.printStackTrace();
                }
                break;
            default:
                break;
        }
        request.setAttribute("result",result);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("show.jsp");
        requestDispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

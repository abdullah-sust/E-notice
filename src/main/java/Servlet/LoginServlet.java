/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Database.*;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Moqsad
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            //System.out.println( +  ", " + request.getParameter("password"));
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + request.getParameter("username") + request.getParameter("password") + "</h1>");
            
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        //System.out.println(request.getParameter("username") + "  " + request.getParameter("password"));
        try {
            System.out.println(request.getParameter("username") + " " + request.getParameter("password") + "*****************************");
            LoginCheck loginCheck = new LoginCheck();
            String access = loginCheck.authenticate(request.getParameter("username"), request.getParameter("password"));

            HttpSession tempSession = request.getSession();
            tempSession.setAttribute("accountType", access);
            tempSession.setAttribute("id", loginCheck.getId());
            tempSession.setAttribute("pageNumber", "0");

            System.out.println("Access : " + access + "---------------------");

            if (access.equals("0")) {
                tempSession.setAttribute("retry", "1");
                response.sendRedirect("login.jsp");
            } else if (access.equals("1")) {
                System.out.println("AccountType111");
                tempSession.setAttribute("id", loginCheck.getId());
                RequestDispatcher rd = request.getRequestDispatcher("StudentNextPrevCombo?click=combo");
                rd.forward(request,response);
            } else {
                tempSession.setAttribute("id", loginCheck.getId());
                RequestDispatcher rd = request.getRequestDispatcher("UploaderNextPrevCombo?click=combo");
                rd.forward(request,response);
            }

            System.out.println("sendRedirect er poreo code kaj kore!!!!!!!");
        } catch (Exception e) {
            System.out.println("----------In doPost() of LoginServlet----------");
            e.printStackTrace();
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

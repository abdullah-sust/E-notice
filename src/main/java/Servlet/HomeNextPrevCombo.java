/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Database.Notices;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Moqsadur Rahman
 */
@WebServlet(name = "HomeNextPrevCombo", urlPatterns = {"/HomeNextPrevCombo"})
public class HomeNextPrevCombo extends HttpServlet {

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

        try {
            String req = request.getParameter("click");//req null hoile exception khai, karon tokhon req.equals("something") invalid hoia jai

            HttpSession tempSession = request.getSession();
            int current = 0;//default value, which will be changed by session, this also the default value for combo selection

            if(req != null)
            {
            if (req.equals("next")) {
                if (tempSession.getAttribute("pageNumber") != null) {
                    current = Integer.parseInt((String) tempSession.getAttribute("pageNumber"));
                }
                current += 1;
            } else if (req.equals("pre")) {
                //Here no need to check the null, because this button will be only visible when the page will be forwarded atleast once
                //that means then the value of current will be greater than zero
                current = Integer.parseInt((String) tempSession.getAttribute("pageNumber"));
                current -= 1;
            } else {
                //current = 0, which is assigned before
            }}

            //we need to save it in session && find the dropdown value
            String dropdown = request.getParameter("dropdown");

            if(dropdown != null)
                tempSession.setAttribute("dropdown", dropdown);
            else
            {
                dropdown = (String)tempSession.getAttribute("dropdown");
                if(dropdown == null)
                {
                    dropdown = "All";
                    tempSession.setAttribute("dropdown", dropdown);
                }
            }
            
            
            String search = request.getParameter("search");
            if(search == null)
                search = "";
            
            Notices notices = new Notices();
            notices.allNotices(dropdown, search);

            tempSession.setAttribute("pageNumber", current + "");
            response.sendRedirect("home.jsp");
        } catch (Exception e) {
            System.out.println("Exception in HomeNextPrevCombo");
            e.printStackTrace();
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
        processRequest(request, response);
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

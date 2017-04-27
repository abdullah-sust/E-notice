/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Database.ChangePreference;
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
 * @author Moqsadur Rahman
 */
@WebServlet(name = "Preference", urlPatterns = {"/Preference"})
public class Preference extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    public static String categoryStore[] = new String[20];

    static {
        categoryStore[0] = "Event";
        categoryStore[1] = "Hall";
        categoryStore[2] = "IICT";
        categoryStore[3] = "Library";
        categoryStore[4] = "Medical";
        categoryStore[5] = "Registry Office";
        categoryStore[6] = "Result";
        categoryStore[7] = "Scholarship";
        categoryStore[8] = "Society";
        categoryStore[9] = "Sports";
        categoryStore[10] = "Vacation";
        categoryStore[11] = "Others";
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession tempSession = request.getSession();
        java.lang.System.out.println(tempSession.getAttribute("accountType") + "---------------student\n");
        if (tempSession.getAttribute("accountType") == null || !tempSession.getAttribute("accountType").equals("1")) {
            response.sendRedirect("login.jsp");
        } else {

            try {
                ChangePreference changePreference = new ChangePreference();

                String value, studentId = (String) request.getSession().getAttribute("id");

                for (int i = 0; i < 12; ++i) {
                    System.out.println("------->" + studentId + " " + categoryStore[i] + " " + request.getParameter(categoryStore[i]));

                    if (request.getParameter(categoryStore[i]) == null) {
                        value = "0";
                    } else {
                        value = "1";
                    }

                    changePreference.changeIt(studentId, categoryStore[i], value);

                }

                RequestDispatcher rd = request.getRequestDispatcher("StudentNextPrevCombo?click=combo");
                rd.forward(request, response);
            } catch (Exception e) {
                System.out.println("Exception in Preference");
                e.printStackTrace();
            }
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

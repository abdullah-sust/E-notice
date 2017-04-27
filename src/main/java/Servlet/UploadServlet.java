/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Database.Upload;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Moqsad
 */
@WebServlet(name = "UploadServlet", urlPatterns = {"/UploadServlet"})
public class UploadServlet extends HttpServlet {

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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet upload</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet upload at " + request.getContextPath() + "</h1>");
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

        HttpSession tempSession = request.getSession();
        java.lang.System.out.println(tempSession.getAttribute("accountType") + "---------------upload\n");
        if (tempSession.getAttribute("accountType") == null || !tempSession.getAttribute("accountType").equals("2")) {
            response.sendRedirect("login.jsp");
        } else {
            System.out.println("------------------IN UPLOADING PROCESS------------------");

            String uploader_id = "", title = "", description = "", importancy = "", category = "", fileName = "", date = "";

            File file;
            int maxFileSize = 5000 * 1024;
            int maxMemSize = 5000 * 1024;
            String filePath = "G:\\GoogleDrive\\Class file\\Current\\Me\\Web\\Lab\\Project\\Web Project\\ENotice\\src\\main\\webapp\\files\\";

            String contentType = request.getContentType();
            if ((contentType.indexOf("multipart/form-data") >= 0)) {

                DiskFileItemFactory factory = new DiskFileItemFactory();
                factory.setSizeThreshold(maxMemSize);
                factory.setRepository(new File("C:\\temp\\"));
                ServletFileUpload upload = new ServletFileUpload(factory);
                upload.setSizeMax(maxFileSize);
                try {
                    List fileItems = upload.parseRequest(request);
                    Iterator i = fileItems.iterator();
                    while (i.hasNext()) {
                        FileItem fi = (FileItem) i.next();
                        if (!fi.isFormField()) {
                            String fieldName = fi.getFieldName();
                            fileName = fi.getName();
                            boolean isInMemory = fi.isInMemory();
                            long sizeInBytes = fi.getSize();
                            file = new File(filePath + fileName);
                            fi.write(file);
                        } else if (fi.getFieldName().equals("title")) {
                            title = fi.getString();
                        } else if (fi.getFieldName().equals("description")) {
                            description = fi.getString();
                        } else if (fi.getFieldName().equals("importancy")) {
                            importancy = fi.getString();
                        } else {
                            category = fi.getString();
                        }

                    }
                } catch (Exception ex) {
                    System.out.println(ex);
                }
            } else {
            }

            //transfering data to Upload notice
            try {
                String uploaderId = (String) tempSession.getAttribute("id");

                System.out.println("id : " + uploaderId);
                System.out.println(title + " " + description + " " + importancy + " " + category + " " + fileName + " " + uploaderId);

                Upload upload = new Upload();
                upload.upload(uploaderId, title, description, importancy, category, fileName);
            } catch (Exception e) {
                System.out.println("Exception in doPost of UploadServlet()");
                e.printStackTrace();
            }

            if (request.getAttribute("fromEdit") == null) {
                //back to upload.jsp
                System.out.println("fromEdit is null!!!");
                System.out.println("position of Notice : " + request.getParameter("positionOfNotice"));
                response.sendRedirect("upload.jsp");
            } else {
                System.out.println("fromEdit is not null!!!");
                RequestDispatcher rd = request.getRequestDispatcher("UploaderNextPrevCombo");
                rd.forward(request, response);
            }
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

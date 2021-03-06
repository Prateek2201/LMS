/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mypackage;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Prateek Agrahari
 */
@MultipartConfig
@WebServlet(name = "uploadcode", urlPatterns = {"/uploadcode"})
public class uploadcode extends HttpServlet {

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
            out.println("<title>Servlet uploadcode</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet uploadcode at " + request.getContextPath() + "</h1>");
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
    String sid=request.getParameter("sid");
    String email=request.getParameter("email");
    String password=request.getParameter("password");
    String sname=request.getParameter("sname");
    String fname=request.getParameter("fname");
    String course=request.getParameter("course");
    String branch=request.getParameter("branch");
    String year=request.getParameter("year");
    String semester=request.getParameter("semester");
    String mobno=request.getParameter("mobno");
    String address=request.getParameter("address");
    String question=request.getParameter("question");
    String answer=request.getParameter("answer");
    Part p=request.getPart("pic");
    InputStream is=p.getInputStream();
    String filename=p.getSubmittedFileName();
    try{
    String query="insert into student values('"+sid+"','"+email+"','"+password+"','"+sname+"','"+fname+"','"+course+"','"+branch+"','"+year+"','"+semester+"','"+mobno+"','"+address+"','"+question+"','"+answer+"','"+filename+"')";
    ConnectDb ob=new ConnectDb();
    if(ob.executeNonQuery(query)==true)
    {
        String sql="insert into login values('"+sid+"','"+password+"','user')";
        ConnectDb ob1=new ConnectDb();
        if(ob1.executeNonQuery(sql)==true)
        {
        File f=new File(request.getRealPath("/upload"),filename);
        Files.copy(is, f.toPath());
        response.sendRedirect("adminzone/addstudent.jsp?msg=save");
        }
        else{
            response.sendRedirect("adminzone/addstudent.jsp?err=2");
        }
    }
    else
    {
        response.sendRedirect("adminzone/addstudent.jsp?err=1");
    }
    }
    catch(Exception e)
    {
        response.sendRedirect("adminzone/addstudent.jsp?err="+e);
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


package com.learn.mycart.servlets;

import com.learn.mycart.dao.userDao;
import com.learn.mycart.entities.User;
import com.learn.mycart.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class loginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           
         
           try{
               
               String email = request.getParameter("email");
               String password = request.getParameter("password");
               
               //validation
               
               
               //authenticate
               userDao userDao = new userDao(FactoryProvider.getFactory());
               
               User user=(User) userDao.getUserByEmailAndPassword(email, password);
               
//               message session
               HttpSession httpSession = request.getSession();
    
               if(user==null){
                   
                   httpSession.setAttribute("message-error", "Invalid details !! try with another one ");
                   response.sendRedirect("login.jsp");
                   return;
                   
               }else{
                   
                   httpSession.setAttribute("current-user", user);
                   
                   //admin
                   if(user.getUserType().equals("admin")){
                       
                          response.sendRedirect("admin.jsp");
                   }
                   
                   //normal
                   else if(user.getUserType().equals("normal")){
                      response.sendRedirect("normal.jsp");
                  }
                   
                   else{
                         out.println("We have not indentified user data type");
                   }
                   
               }

           }catch(Exception e){
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

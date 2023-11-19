package com.learn.mycart.servlets;

import com.learn.mycart.dao.categoryDao;
import com.learn.mycart.dao.productDao;
import com.learn.mycart.entities.Product;
import com.learn.mycart.entities.category;
import com.learn.mycart.helper.FactoryProvider;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@MultipartConfig
public class PeroductOperationServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String op = request.getParameter("operation");

            if (op.trim().equals("addcategory")) {
                //Add Category
                String title = request.getParameter("catTitle");
                String description = request.getParameter("catDescription");
                
                category category = new category();
                category.setCategoryTitle(title);
                category.setCategoryDescription(description);
                
               categoryDao categorydao  =  new categoryDao(FactoryProvider.getFactory());
               
               int catId = categorydao.saveCategory(category);
               
               HttpSession httpSession = request.getSession();
               httpSession.setAttribute("message", "Successfully  added category ");
               response.sendRedirect("admin.jsp");
               
               return;

            }else if(op.trim().equals("addproduct")){
                //Add Product
                
                String pName  = request.getParameter("pName");
                String pDescription = request.getParameter("pDescription");
                int pPrice =Integer.parseInt(request.getParameter("pPrice"));
                int pDescount = Integer.parseInt(request.getParameter("pDescount"));
                int pQuantity = Integer.parseInt(request.getParameter("pQuantity"));
                int catId = Integer.parseInt(request.getParameter("catId"));
                Part part = request.getPart("pPic");
                
                Product p = new Product();
                
                p.setpName(pName);
                p.setpDesc(pDescription);
                p.setpPrice(pPrice);
                p.setpDiscount(pDescount);
                p.setpQuantity(pQuantity);
                p.setpPhoto(part.getSubmittedFileName());
                
                
                //category  id
                categoryDao cDao = new categoryDao(FactoryProvider.getFactory());
                category  category = cDao.getCategorybyId(catId);
                
                p.setCategory(category);
                
                //product dao object
                productDao pDao  = new productDao(FactoryProvider.getFactory());
                pDao.saveProduct(p);
                
         
                     //path of the folder to save product images 
                String path  = request.getRealPath("components")+File.separator+"img"+File.separator+"imgProduct"+File.separator+part.getSubmittedFileName();
                
                try ( //uploading image
                        FileOutputStream fos = new FileOutputStream(path)) {
                    InputStream is = part.getInputStream();
                    
                    //reading data
                    byte[] data = new byte[is.available()];
                    
                    is.read(data);
                    
                    //writing the data
                    fos.write(data);
                    
                }catch (Exception e){
                    e.printStackTrace();
                }
              
                
               
                
                HttpSession httpSession =request.getSession();
                httpSession.setAttribute("message", "Product is added seccessfully");
                response.sendRedirect("admin.jsp");
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

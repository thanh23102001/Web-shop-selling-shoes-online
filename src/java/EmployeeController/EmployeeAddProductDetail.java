/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package EmployeeController;

import Dal.ProductDetailsDAO;
import Models.ProductDetails;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author QUANG HUY
 */
@WebServlet(name = "EmployeeAddProductDetail", urlPatterns = {"/EmployeeAddProductDetail"})
public class EmployeeAddProductDetail extends HttpServlet {

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
        String pid = request.getParameter("pid");
        String size = request.getParameter("size");
        String color = request.getParameter("color");
        String quan = request.getParameter("quantity");
        ProductDetailsDAO pddao = new ProductDetailsDAO();
        ArrayList<ProductDetails> pds = pddao.getProductDetails(Integer.parseInt(pid));
        int pdid = -1;
        int quanOld= 0;
        for (ProductDetails pd : pds ){
            if(size.equals(pd.getSize()) && color.equals(pd.getColor())){
                pdid = pd.getProductDetailId();
                quanOld = pd.getQuantityInStock();
                break;
            }
        }
        if (pdid != -1){
            pddao.updatePD(pdid, Integer.parseInt(pid), size, color, quanOld + Integer.parseInt(quan));
        } else {
        pddao.addPD(Integer.parseInt(pid), size, color, Integer.parseInt(quan));
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

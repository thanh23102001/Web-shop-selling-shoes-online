/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CustomerControllers;

import Dal.FeedbackDAO;
import Dal.ProductDAO;
import Dal.ProductDetailsDAO;
import Models.Product;
import Models.ProductDetails;
import com.google.gson.Gson;
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
 * @author vietd
 */
@WebServlet(name = "product_details", urlPatterns = {"/product_details"})
public class product_details extends HttpServlet {

    private Gson gson = new Gson();

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
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset=UTF-8");
        String productId = request.getParameter("productId") == null ? "" : request.getParameter("productId");
        Product product = new ProductDAO().getProductByProductId(Integer.parseInt(productId));
        request.setAttribute("product", product);
        ArrayList<Models.Feedback> feedbacks = new FeedbackDAO().getFeedbacksByProductId(product.getProductId());
        request.setAttribute("ListOfFeedback", feedbacks);
        request.setAttribute("RelatedProducts", new ProductDAO().getRelatedProducts(product.getProductId()));
        ArrayList<ProductDetails> details = product.getDetails();
        String JsonString = this.gson.toJson(details);
        request.setAttribute("productDetails", JsonString);
        request.getRequestDispatcher("/Customer-Screen/ProductDetails.jsp").forward(request, response);
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
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset=UTF-8");
        String action = request.getParameter("action");
        if (action != null && action.equals("getQuantityOfAttribute")) {
            int productId = Integer.parseInt(request.getParameter("productId"));
            String color = request.getParameter("color");
            String size = request.getParameter("size");
            ProductDetailsDAO detailsDAO = new ProductDetailsDAO();
            response.getWriter().write(new Gson().toJson(detailsDAO.getQuantityOfProduct(productId, color, size)));
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

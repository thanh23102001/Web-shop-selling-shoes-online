/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CustomerControllers;

import Dal.CartDAO;
import Dal.CartItemsDAO;
import Models.Account;
import Models.Cart;
import Models.CartItems;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author vietd
 */
@WebServlet(name = "add_to_cart", urlPatterns = {"/add_to_cart"})
public class add_to_cart extends HttpServlet {

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
            out.println("<title>Servlet add_to_cart</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet add_to_cart at " + request.getContextPath() + "</h1>");
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
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset=UTF-8");
        HttpSession session = request.getSession();
        if (session.getAttribute("userLogin") == null) {
            response.getWriter().write(new Gson().toJson("failed"));
        } else {
            String action = request.getParameter("action");
            if (action != null) {
                if (action.equals("addToCart")) {
                    int productId = Integer.parseInt(request.getParameter("productId"));
                    int ProductDetailId = Integer.parseInt(request.getParameter("ProductDetailId"));
                    String color = request.getParameter("color");
                    String size = request.getParameter("size");
                    int quantity = Integer.parseInt(request.getParameter("quantity"));
                    Account account = (Account) session.getAttribute("userLogin");
                    Cart cart = new CartDAO().getCartByCustomer(account.getAccountId());
                    if (cart == null) {
                        int cartId = new CartDAO().insertCart(account.getAccountId());
                        new CartItemsDAO().insertItemsToCart(cartId, ProductDetailId, quantity);
                    } else {
                        ArrayList<CartItems> items = new CartItemsDAO().getItems(cart.getCartId());
                        boolean temp = true;
                        for (CartItems i : items) {
                            if (i.getProductDetail().getProductDetailId() == ProductDetailId) {
                                temp = false;
                                new CartItemsDAO().updateQuantity(ProductDetailId, quantity, cart.getCartId(), i.getQuantityInCart());
                            }
                        }
                        if (temp) {
                            new CartItemsDAO().insertItemsToCart(cart.getCartId(), ProductDetailId, quantity);
                        }
                    }
                    response.getWriter().write(new Gson().toJson("success"));

                }
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

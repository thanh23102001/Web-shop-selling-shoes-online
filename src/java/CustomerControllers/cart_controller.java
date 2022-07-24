/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CustomerControllers;

import Dal.AccountDAO;
import Dal.CartDAO;
import Dal.CartItemsDAO;
import Dal.ProductDetailsDAO;
import Models.Account;
import Models.Cart;
import Models.CartItems;
import Models.ProductDetails;
import com.google.gson.Gson;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @author vietd
 */
@WebServlet(name = "cart_controller", urlPatterns = {"/cart"})
public class cart_controller extends HttpServlet {

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
        HttpSession session = request.getSession();
        if (session.getAttribute("userLogin") == null) {
            response.sendRedirect("Login");
        } else {
            Account account = (Account) session.getAttribute("userLogin");
            System.out.println(account.getAccountId());
            Cart cart = new CartDAO().getCartByCustomer(account.getAccountId());
            if (cart == null) {
                request.setAttribute("action", "emptyCart");
                request.getRequestDispatcher("emptyCarts.jsp").forward(request, response);
            } else {
                request.setAttribute("cart", cart);
                request.getRequestDispatcher("/Customer-Screen/CartDetails.jsp").forward(request, response);
            }
        }
//        AccountDAO login = new AccountDAO();
//        Account account = login.getAccount("myntt", "mimidayroi");

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
        response.setContentType("application/json"); // set content type
        response.setCharacterEncoding("UTF-8"); // set character encoding
        String action = request.getParameter("action");
//        AccountDAO login = new AccountDAO();
//        Account account = login.getAccount("myntt", "mimidayroi");
        HttpSession session = request.getSession();
        Account account = null;
        if (session.getAttribute("userLogin") == null) {
            response.getWriter().write("{\"status\":\"error\"}");
        } else {
            account = (Account) session.getAttribute("userLogin");
        }
        Cart cart = new CartDAO().getCartByCustomer(account.getAccountId());
        int cartId = cart.getCartId();
        CartItemsDAO itemsDAO = new CartItemsDAO();
        if (action != null) {
            if (action.equals("getQuantity")) {
                try {
                    String color = request.getParameter("color");
                    int productId = Integer.parseInt(request.getParameter("productId"));
                    ArrayList<ProductDetails> productDetails = new ProductDetailsDAO().checkQuantityOfSize(productId, color);
                    if (productDetails.size() > 0) {
                        response.getWriter().write(new Gson().toJson(productDetails)); // write error message to response
                    } else {
                        throw new Exception("This product is no longer available in this color");
                    }
                } catch (Exception e) {
                    response.setStatus(HttpServletResponse.SC_NOT_ACCEPTABLE); // set status
                    response.getWriter().write(e.getMessage()); // write error message to response
                }
                return;
            }
            if (action.equals("deleteCartItem")) {
                try {
                    int cartDetailId = Integer.parseInt(request.getParameter("cartDetailId"));
                    if (itemsDAO.deleteCartItems(cartDetailId, cartId) != 0) {

                        response.setStatus(HttpServletResponse.SC_OK); // set status
                        response.getWriter().write(new Gson().toJson("{message : delete success}"));
                    }
                } catch (NumberFormatException e) {
                    response.setStatus(HttpServletResponse.SC_BAD_REQUEST); // set status
                    response.getWriter().write(new Gson().toJson("{message : delete failed}"));
                }
                return;
            }
            if (action.equals("updateCart")) {
                try {
                    int cartDetailId = Integer.parseInt(request.getParameter("cartDetailId"));
                    int quantity = Integer.parseInt(request.getParameter("quantityOrder"));
                    int productDetailId = Integer.parseInt(request.getParameter("productDetailId"));
                    CartItems cartItems = new CartItems();
                    cartItems.setCartDetailId(cartDetailId);
                    cartItems.setQuantityInCart(quantity);
                    cartItems.setProductDetail(new ProductDetails(productDetailId, "", "", 0));
                    cartItems.setCartId(cartId);
                    if (itemsDAO.updateCartItems(cartItems) != 0) {
                        response.setStatus(HttpServletResponse.SC_OK); // set status
                        response.getWriter().write(new Gson().toJson("{message : update success}"));
                    }
                } catch (NumberFormatException e) {
                    response.setStatus(HttpServletResponse.SC_BAD_REQUEST); // set status
                    response.getWriter().write(new Gson().toJson("{message : update failed}"));
                }
                return;
            }

            if (action.equals("getItemCheckout")) {
                if (request.getParameter("listOrder") != null) {
                    ArrayList<CartItems> orderList = new ArrayList();
                    String s = request.getParameter("listOrder");
                    String[] items = s.split(",");
                    for (String i : items) {
                        orderList.add(new CartItemsDAO().getCartItem(account.getAccountId(), Integer.parseInt(i)));
                    }
                    session.setAttribute("orderList", orderList);
                    response.setStatus(HttpServletResponse.SC_OK); // set status
                    response.getWriter().write(new Gson().toJson("{message : get success}"));
                } else {
                    response.setStatus(HttpServletResponse.SC_BAD_REQUEST); // set status
                    response.getWriter().write(new Gson().toJson("{message : get failed}"));
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CustomerControllers;

import Dal.AddressDAO;
import Dal.CartDAO;
import Dal.CartItemsDAO;
import Dal.OrderDAO;
import Dal.OrderDetailsDAO;
import Dal.ProductDetailsDAO;
import Dal.ShippingCompanyDAO;
import Models.Account;
import Models.Address;
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
@WebServlet(name = "checkout_controller", urlPatterns = {"/checkout"})
public class checkout_controller extends HttpServlet {

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
        AddressDAO aDao = new AddressDAO();
        HttpSession session = request.getSession();
        if (session.getAttribute("userLogin") == null || session.getAttribute("orderList") == null) {
            response.sendRedirect("HomePage");
        } else {
            double total = 0;
            Account acc = (Account) session.getAttribute("userLogin");
            ArrayList<Address> addresses = aDao.getListAddressByCustomerId(acc.getAccountId());
            ArrayList<CartItems> items = (ArrayList<CartItems>) session.getAttribute("orderList");
            for (CartItems i : items) {
                double price = i.getProduct().getUnitPrice() - i.getProduct().getUnitPrice() * (i.getProduct().getDiscount() / 100);
                total += price * i.getQuantityInCart();
            }
            request.setAttribute("addresses", addresses);
            request.setAttribute("orderList", items);
            request.setAttribute("totalPrice", total);
            request.setAttribute("shipping", new ShippingCompanyDAO().getAllShips());
            request.getRequestDispatcher("/Customer-Screen/Checkout.jsp").forward(request, response);
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
        response.setContentType("application/json"); // set content type
        response.setCharacterEncoding("UTF-8"); // set character encoding
        HttpSession session = request.getSession();
        OrderDAO Odao = new OrderDAO();
        OrderDetailsDAO Ddao = new OrderDetailsDAO();
        AddressDAO Adao = new AddressDAO();
        if (session.getAttribute("userLogin") == null) {
            response.getWriter().write("{\"status\":\"failed\"}");
        } else {
            Account account = (Account) session.getAttribute("userLogin");
            Cart cart = new CartDAO().getCartByCustomer(account.getAccountId());
            String action = request.getParameter("action");
            ArrayList<CartItems> orderList = (ArrayList<CartItems>) session.getAttribute("orderList");
            double total = 0;
            for (CartItems i : orderList) {
                double price = i.getProduct().getUnitPrice() - i.getProduct().getUnitPrice() * (i.getProduct().getDiscount() / 100);
                total += price * i.getQuantityInCart();
            }
            if (action.equals("checkout_order")) {
                try {
                    int addressId = Integer.parseInt(request.getParameter("addressId"));
                    String shipId = request.getParameter("shipCompanyId");
                    Address address = new AddressDAO().getAddressById(addressId);
                    // insert
                    int orderId = Odao.addOrder(account.getAccountId(), Integer.parseInt(shipId), address.getAddress(),
                             total, 1 , address.getCustomerName() , address.getPhoneNumber());
                    for (CartItems c : orderList) {
                        Ddao.insertOrderItems(orderId, c.getProductDetail().getProductDetailId(),
                                c.getQuantityInCart(), c.getProduct().getUnitPrice(), c.getProduct().getDiscount());
                        new CartItemsDAO().deleteCartItems(c.getCartDetailId(), cart.getCartId());
                        new ProductDetailsDAO().updateQuantity(c.getProductDetail().getProductDetailId(), c.getProductDetail().getQuantityInStock() - c.getQuantityInCart());
                    }
                    response.getWriter().write(new Gson().toJson(orderId)); // write error message to response
                } catch (Exception e) {
                    response.setStatus(HttpServletResponse.SC_NOT_ACCEPTABLE); // set status
                    response.getWriter().write(e.getMessage()); // write error message to response
                }

            }
            if (action.equals("checkout_addAddress")) {
                try {
                    String customerName = request.getParameter("name");
                    String phone = request.getParameter("phone");
                    String address = request.getParameter("address");
                    String shipId = request.getParameter("shipCompanyId");
                    // insert
                    int addressId = Adao.addNewAddress(account.getAccountId(), address, phone, customerName);
                    int orderId = Odao.addOrder(account.getAccountId(), Integer.parseInt(shipId),request.getParameter("address"),
                            total , 1 , customerName, phone);
                    for (CartItems c : orderList) {
                        Ddao.insertOrderItems(orderId, c.getProductDetail().getProductDetailId(),
                                c.getQuantityInCart(), c.getProduct().getUnitPrice(), c.getProduct().getDiscount());
                        new CartItemsDAO().deleteCartItems(c.getCartDetailId(), cart.getCartId());
                        new ProductDetailsDAO().updateQuantity(c.getProductDetail().getProductDetailId(), c.getQuantityInCart());
                    }
                    response.getWriter().write(new Gson().toJson(orderId)); // write error message to response
                } catch (Exception e) {
                    response.setStatus(HttpServletResponse.SC_NOT_ACCEPTABLE); // set status
                    response.getWriter().write(e.getMessage()); // write error message to response
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

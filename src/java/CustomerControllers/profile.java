/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CustomerControllers;

import Dal.AccountDAO;
import Dal.AddressDAO;
import Dal.CustomerDAO;
import Models.Account;
import Models.Address;
import Models.Customer;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "profile", urlPatterns = {"/profile"})
public class profile extends HttpServlet {

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
        HttpSession session = request.getSession();
        CustomerDAO Cdao = new CustomerDAO();
        request.setAttribute("action", request.getParameter("action"));
        if (session.getAttribute("userLogin") == null) {
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        } else {
            Account account = (Account) session.getAttribute("userLogin");
            if (account.getRole().equalsIgnoreCase("customer")) {
                Customer customer = Cdao.getProfile(account.getAccountId());
                request.setAttribute("account", account);
                request.setAttribute("profile", customer);
                request.setAttribute("cid", customer.getCustomerId());
                request.getRequestDispatcher("/Customer-Screen/Profile.jsp").forward(request, response);
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
        request.setCharacterEncoding("UTF-8");
        CustomerDAO Cdao = new CustomerDAO();
        AccountDAO Adao = new AccountDAO();
        AddressDAO address_dao = new AddressDAO();
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("userLogin");
        String action = request.getParameter("action") == null ? "" : request.getParameter("action");
        if (action.equals("")) {
            String fullname = request.getParameter("name");
            String phone = request.getParameter("phone");
            boolean temp = true;
            if (phone.length() < 10 && phone.length() > 10) {
                temp = false;
            }
            for (int i = 0; i < phone.length(); i++) {
                try {
                    int value = Integer.parseInt(String.valueOf(phone.charAt(i)));
                } catch (Exception e) {
                    temp = false;
                }
            }
            if (temp) {
                address_dao.updateInforCustomer(fullname, phone, account.getAccountId());
                request.setAttribute("result", "success");
                request.setAttribute("message", "Edited Successfully !");
            } else {
                request.setAttribute("result", "failed");
                request.setAttribute("message", "Please enter valid information!");
            }

        }
       
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

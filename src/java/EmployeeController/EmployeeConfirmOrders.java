/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package EmployeeController;

import Dal.CustomerDAO;
import Dal.OrderDAO;
import Dal.SendMail;
import Models.Order;
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
@WebServlet(name = "EmployeeConfirmOrders", urlPatterns = {"/EmployeeConfirmOrders"})
public class EmployeeConfirmOrders extends HttpServlet {

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
        OrderDAO oDao = new OrderDAO();

        if (request.getParameter("id") != null || request.getParameter("status") != null) {
            int id = Integer.parseInt(request.getParameter("id"));
            int statusId = Integer.parseInt(request.getParameter("status"));
            oDao.changeStatus(id, statusId);
            CustomerDAO cDao = new CustomerDAO();
            String receiver = cDao.getCustomerEmailByOrderId(id);
            if (receiver.equals("huypq1801@gmail.com")) {
                SendMail sendMail = new SendMail();
                String subject = "You've ordered successfully!";
                String message = "We've received your contact information. We will contact you soon.";
                sendMail.sendMailConfirm(receiver, subject, message);
            }
        }
        response.sendRedirect("EmployeeViewOrders");
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
        OrderDAO oDao = new OrderDAO();
        ArrayList<Order> pendingOrders = oDao.getOrdersByStatus(1);

        for (Order o : pendingOrders) {
            int oid = o.getOrderID();
            if (request.getParameter("" + oid) != null) {
                if (request.getParameter("" + oid).equals("on")) {
                    oDao.changeStatus(oid, (request.getParameter("action").equals("Confirm")) ? 2 : 4);
                    CustomerDAO cDao = new CustomerDAO();
                    String receiver = cDao.getCustomerEmailByOrderId(oid);
                    if (receiver.equals("huypq1801@gmail.com")) {
                        SendMail sendMail = new SendMail();
                        String subject = "You've ordered successfully!";
                        String message = "We've received your contact information. We will contact you soon.";
                        sendMail.sendMailConfirm(receiver, subject, message);
                    }
                }
            }
        }
        response.sendRedirect("EmployeeViewOrders");
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

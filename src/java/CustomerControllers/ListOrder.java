/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CustomerControllers;

import Dal.OrderDAO;
import Dal.StatusDAO;
import Models.Order;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "ListOrder", urlPatterns = {"/ListOrder"})
public class ListOrder extends HttpServlet {

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
        OrderDAO Odao = new OrderDAO();
        HttpSession session = request.getSession();
        if (request.getParameter("cusid") == null || session.getAttribute("userLogin") == null) {
            response.sendRedirect("HomePage");
        } else {
            int customerID = Integer.parseInt(request.getParameter("cusid"));
            ArrayList<Order> order = Odao.getListOrders(customerID);
            request.setAttribute("ListOrder", order);
            request.setAttribute("customerId", customerID);
            request.setAttribute("statuses", new StatusDAO().getAllStatus());
            request.getRequestDispatcher("/Customer-Screen/ListOrder.jsp").forward(request, response);
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
        int status = Integer.parseInt(request.getParameter("status"));
        String datefrom = request.getParameter("datefrom");
        String dateto = request.getParameter("dateto");
        OrderDAO ODao = new OrderDAO();
        String cusid = request.getParameter("custid");
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDateTime now = LocalDateTime.now();
        if (cusid == null) {
            cusid = "";
        }

        if ((datefrom == null && dateto == null) || ("".equals(datefrom) && "".equals(dateto))) {
            datefrom = "2000-01-01";
            dateto = dtf.format(now);
        }
        Date from = Date.valueOf(datefrom);
        Date to = Date.valueOf(dateto);
        request.setAttribute("custid", cusid);
//        ArrayList<Order> order = ODao.getListOrdersBySearch(cusid, status, from, to);
//        request.setAttribute("ListOrder", order);
        request.getRequestDispatcher("/Customer-Screen/ListOrder.jsp").forward(request, response);
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package EmployeeController;

import Dal.AccountDAO;
import Dal.CustomerDAO;
import Dal.FeedbackDAO;
import Dal.OrderDAO;
import Dal.ProductDAO;
import Models.Account;
import Models.Customer;
import Models.Product;
import Models.StatisticCB;
import Models.StatisticOrders;
import Models.StatisticRevenues;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import java.io.IOException;
import java.text.NumberFormat;
import java.util.List;
import java.util.Locale;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author QUANG HUY
 */
@WebServlet(name = "Employee", urlPatterns = {"/Employee"})
public class Employee extends HttpServlet {

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
        int accountid = ((Account) session.getAttribute("userLogin")).getAccountId();
        AccountDAO accountDao = new AccountDAO();
        Account ac = accountDao.getAccountById(accountid);
        request.setAttribute("accountName", ac.getUsername());
        OrderDAO oDao = new OrderDAO();
        Gson gson = new Gson();
        
        //Common
        request.setAttribute("numOfOrders", oDao.getNumberOfOrders());
        request.setAttribute("numOfCpOrders", oDao.getNumberOfOrders(3));
        request.setAttribute("numOfCcOrders", oDao.getNumberOfOrders(4));
        request.setAttribute("completionRate", Math.round((oDao.getNumberOfOrders(3)*1.0/(oDao.getNumberOfOrders(3)+oDao.getNumberOfOrders(4)))*100)+"%");
        request.setAttribute("numCustomers", new CustomerDAO().getNumOfCustomers());
        request.setAttribute("numReviews", new FeedbackDAO().getNumOfReview());
        request.setAttribute("numPurchasedProducts", new ProductDAO().getPurchasedProducts());
        Locale localeVN = new Locale("vi", "VN");
        NumberFormat currencyVN = NumberFormat.getCurrencyInstance(localeVN);
        request.setAttribute("revenue", oDao.getRevenueVND());
        request.setAttribute("profit", currencyVN.format(oDao.getRevenue()-oDao.getCapital()));
        request.setAttribute("capital", currencyVN.format(oDao.getCapital()));
        request.setAttribute("profitMargin", Math.round((oDao.getRevenue()-oDao.getCapital())/oDao.getRevenue()*100)+"%");
        
        //Orders
        List<StatisticOrders> os = oDao.getAllOrdersByMonth();
        List<StatisticOrders> osCompleted = oDao.getOrdersByMonth(3);
        List<StatisticOrders> osCanceled = oDao.getOrdersByMonth(4);
        JsonArray osJson = gson.toJsonTree(os).getAsJsonArray();
        JsonArray oscpJson = gson.toJsonTree(osCompleted).getAsJsonArray();
        JsonArray osccJson = gson.toJsonTree(osCanceled).getAsJsonArray();
        request.setAttribute("os", osJson);
        request.setAttribute("oscp", oscpJson);
        request.setAttribute("oscc", osccJson);
        //Category
        List<StatisticCB> cate = oDao.getNumberOfCate();
        JsonArray cateJson = gson.toJsonTree(cate).getAsJsonArray();
        request.setAttribute("cate", cateJson);
        //Brand
        List<StatisticCB> brands = oDao.getNumberOrdersByBrand();
        JsonArray brandsJson = gson.toJsonTree(brands).getAsJsonArray();
        request.setAttribute("brands", brandsJson);
        
        //Revenue
        List<StatisticRevenues> rs = oDao.getRevenuesByMonth();
        JsonArray rsJson = gson.toJsonTree(rs).getAsJsonArray();
        request.setAttribute("rs", rsJson);
        List<StatisticRevenues> prfs = oDao.getProfitByMonth();
        JsonArray prfsJson = gson.toJsonTree(prfs).getAsJsonArray();
        request.setAttribute("prfs", prfsJson);
        List<StatisticRevenues> cpts = oDao.getCapitalByMonth();
        JsonArray cptsJson = gson.toJsonTree(cpts).getAsJsonArray();
        request.setAttribute("cpts", cptsJson);
        
        //Top
        ProductDAO pDao = new ProductDAO();
        List<StatisticCB> topPs = pDao.getTopProducts();
        request.setAttribute("topPs", topPs);
        List<StatisticCB> topRPs = pDao.getTopRatedProducts();
        request.setAttribute("topRPs", topRPs);
        
        CustomerDAO cusDao = new CustomerDAO();
        List<StatisticCB> topCus = cusDao.getTopCustomers();
        request.setAttribute("topCus", topCus);
        
        request.getRequestDispatcher("/screens-employee/Employeedashboard.jsp").forward(request, response);
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

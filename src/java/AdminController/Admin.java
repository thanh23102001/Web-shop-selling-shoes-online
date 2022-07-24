/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AdminController;

import Dal.AccountDAO;
import Dal.OrderDAO;
import Dal.ProductDAO;
import Models.Account;
import Models.StatisticCB;
import Models.StatisticRevenues;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "Admin", urlPatterns = {"/Admin"})
public class Admin extends HttpServlet {

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
        Account account = accountDao.getAccountById(accountid);
        request.setAttribute("accountName", account.getUsername());

        OrderDAO oDao = new OrderDAO();
        Gson gson = new Gson();
        
        //Common
        AccountDAO aDao = new AccountDAO();
        request.setAttribute("numAcc", aDao.getAllAccount().size());
        Locale localeVN = new Locale("vi", "VN");
        NumberFormat currencyVN = NumberFormat.getCurrencyInstance(localeVN);
        request.setAttribute("revenue", oDao.getRevenueVND());
        request.setAttribute("profit", currencyVN.format(oDao.getRevenue()-oDao.getCapital()));
        request.setAttribute("capital", currencyVN.format(oDao.getCapital()));
        request.setAttribute("profitMargin", Math.round((oDao.getRevenue()-oDao.getCapital())/oDao.getRevenue()*100)+"%");
        
        //ACC: new acc by month
        List<StatisticCB> acc = aDao.getNumberOfNewAccByMonth();
        JsonArray accJson = gson.toJsonTree(acc).getAsJsonArray();
        request.setAttribute("acc", accJson);
        
        //Role: % cus, em
        List<StatisticCB> role = aDao.getRoleStatistic();
        JsonArray roleJson = gson.toJsonTree(role).getAsJsonArray();
        request.setAttribute("role", roleJson);
        
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
        
        //Category stock
        ProductDAO pDao = new ProductDAO();
        List<StatisticCB> cate = pDao.getNumberProductsByCate();
        JsonArray cateJson = gson.toJsonTree(cate).getAsJsonArray();
        request.setAttribute("cate", cateJson);
        //Brand stock
        List<StatisticCB> brands = pDao.getNumberProductsByBrand();
        JsonArray brandsJson = gson.toJsonTree(brands).getAsJsonArray();
        request.setAttribute("brands", brandsJson);
        
        //Product
        request.setAttribute("totalP", pDao.getListProducts().size());
        request.setAttribute("outof", pDao.getOutOfStocks());
        request.setAttribute("low", pDao.getLowStocks());
        request.getRequestDispatcher("/screens-admin/Admindashboard.jsp").forward(request, response);
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

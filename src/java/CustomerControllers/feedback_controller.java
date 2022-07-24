/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CustomerControllers;

import Dal.FeedbackDAO;
import com.google.gson.Gson;
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
@WebServlet(name = "feedback_controller", urlPatterns = {"/feedback_controller"})
public class feedback_controller extends HttpServlet {

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
            out.println("<title>Servlet feedback_controller</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet feedback_controller at " + request.getContextPath() + "</h1>");
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
        response.setContentType("application/json"); // set content type
        response.setCharacterEncoding("UTF-8"); // set character encoding
        HttpSession session = request.getSession();
        String action = request.getParameter("action");
        if (action != null) {
            if (action.equals("complete")) {
                try {
                    int customerId = Integer.parseInt(request.getParameter("customerId"));
                    int OrderId = Integer.parseInt(request.getParameter("orderId"));
                    int orderDetailId = Integer.parseInt(request.getParameter("orderDetailsId"));
                    String comment = request.getParameter("comment");
                    int rating = Integer.parseInt(request.getParameter("rating"));
                    System.out.println(comment);
                    System.out.println(new FeedbackDAO().insertFeedback(customerId, OrderId, orderDetailId, rating, comment));
                    response.setStatus(HttpServletResponse.SC_OK); // set status
                    response.getWriter().write(new Gson().toJson("{message :success}"));
                } catch (Exception e) {
                    response.setStatus(HttpServletResponse.SC_BAD_REQUEST); // set status
                    response.getWriter().write(new Gson().toJson("{message :failed}"));
                }
            }
            if (action.equals("edit")) {
                try {
                    int rating = Integer.parseInt(request.getParameter("rating"));
                    String comment = request.getParameter("comment");
                    int feedbackId = Integer.parseInt(request.getParameter("feedbackId"));
                    new FeedbackDAO().updateFeedback(rating, comment, feedbackId);
                    response.setStatus(HttpServletResponse.SC_OK); // set status
                    response.getWriter().write(new Gson().toJson("{message :success}"));
                } catch (Exception e) {
                    response.setStatus(HttpServletResponse.SC_BAD_REQUEST); // set status
                    response.getWriter().write(new Gson().toJson("{message :failed}"));
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

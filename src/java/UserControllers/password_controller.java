/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package UserControllers;
import com.google.gson.Gson;
import Dal.AccountDAO;
import Models.Account;
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
 * @author QUANG HUY
 */
@WebServlet(name = "password_controller", urlPatterns = {"/password_controller"})
public class password_controller extends HttpServlet {

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
            out.println("<title>Servlet password_controller</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet password_controller at " + request.getContextPath() + "</h1>");
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
        AccountDAO Adao = new AccountDAO();
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("userLogin");
        try {
            String password = request.getParameter("current_password");
            String newPassword = request.getParameter("new_password");
            String cfPassword = request.getParameter("confirm_password");
            System.out.println(password);
            System.out.println(newPassword);
            System.out.println(cfPassword);
            System.out.println(account.getPassword());
            if (!account.getPassword().equals(password)) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST); // set status
                response.getWriter().write(new Gson().toJson("{message :failed}"));
            } else if (account.getPassword().equals(password) && newPassword.equals(cfPassword)) {
                Adao.updatePassword(account.getEmail(), newPassword);
                response.setStatus(HttpServletResponse.SC_OK); // set status
                response.getWriter().write(new Gson().toJson("{message :success}"));
            }
        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST); // set status
            response.getWriter().write(new Gson().toJson("{message :failed}"));
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

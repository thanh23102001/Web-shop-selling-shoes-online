/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package UserControllers;

import Dal.AccountDAO;
import Dal.SendMail;
import Models.Account;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.lang3.RandomStringUtils;

/**
 *
 * @author vietd
 */
@WebServlet(name = "Forgot_password", urlPatterns = {"/Forgot_password"})
public class Forgot_password extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        AccountDAO Adao = new AccountDAO();
        HttpSession session = request.getSession();
        String keyword = request.getParameter("keyword") == null ? "" : request.getParameter("keyword");
        if (keyword.equals("reset")) {
            String emailTo = request.getParameter("email");
            Account account = Adao.getAccountByEmail(emailTo);
            String mess = "";
            String status = "";
            if (account != null) {
                String newPassword = RandomStringUtils.randomAlphanumeric(6);
                Adao.updatePassword(emailTo, newPassword);
                String url = "http://localhost:" + request.getServerPort() + request.getContextPath() + "/Change_password";
                String subject = "PLEASE CONFIRM RESET PASSWORD";
                String message = "<i>This message is in response to your request to reset your account password. Please click the link below and follow the instructions to change your password.</i><br>";
                message += "<b>Your password is : " + newPassword + "</b><br>";
                message += "<a href='" + url + "'>Click here to change password</a>";
                message += "<p>Thank you !</p>";
                SendMail mail = new SendMail();
                if (mail.sendMailConfirm(emailTo, subject, message)) {
                    session.setAttribute("userLogin", null);
                    session.setAttribute("resetPassword", newPassword);
                    session.setMaxInactiveInterval(300);
                    status = "success";
                    mess = "Our system will send you a new password within seconds. If a new password is sent to you,please go back to login then change password for extra security.";
                } else {
                    status = "failed";
                    mess = "Server failed to send password. Please re-enter your email !";
                }
            } else {
                status = "failed";
                mess = "Account does not exist. Please re-enter !";
            }
            request.setAttribute("message", mess);
            request.setAttribute("status", status);

        }
        request.setAttribute("actionFor", request.getParameter("actionFor"));
        request.getRequestDispatcher("Forgot-Password.jsp").forward(request, response);

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

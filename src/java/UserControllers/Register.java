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
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;
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
@WebServlet(name = "Register", urlPatterns = {"/Register"})
public class Register extends HttpServlet {

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
        request.getRequestDispatcher("Register.jsp").forward(request, response);
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
        String name = request.getParameter("name");
        String username = request.getParameter("username");
        String password = request.getParameter("pass");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String role = "CUSTOMER";
        String subject = "You have successfully registered";
        String message2 = "Thank you " + name + " for trusting Shoe Store. Wish you have a pleasant shopping experience";
        AccountDAO login = new AccountDAO();
        List<Account> list = login.getAllAccount();
        boolean check = true;

        if (name.equals("") || username.equals("") || password.equals("") || phone.equals("") || email.equals("")) {
            check = false;
            request.setAttribute("name", name);
            request.setAttribute("usernamerg", username);
            request.setAttribute("pass", password);
            request.setAttribute("phone", phone);
            request.setAttribute("email", email);
            request.setAttribute("message1", "Please enter all the information");
            processRequest(request, response);
        }

        for (int i = 0; i < list.size(); i++) {
            if (email.equals(list.get(i).getEmail()) || username.equals(list.get(i).getUsername())) {
                check = false;
                request.setAttribute("name", name);
                request.setAttribute("usernamerg", username);
                request.setAttribute("pass", password);
                request.setAttribute("phone", phone);
                request.setAttribute("email", email);
                request.setAttribute("message1", "Information about username or email already exists. Please check again");
                processRequest(request, response);

            }
        }

        Pattern e = Pattern.compile("^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$");
        if (!e.matcher(email).find()) {
            check = false;
            request.setAttribute("name", name);
            request.setAttribute("usernamerg", username);
            request.setAttribute("pass", password);
            request.setAttribute("phone", phone);
            request.setAttribute("email", email);
            request.setAttribute("message1", "Email sai format");
            processRequest(request, response);

        }

        Pattern p = Pattern.compile("^(1[ \\-\\+]{0,3}|\\+1[ -\\+]{0,3}|\\+1|\\+)?((\\(\\+?1-[2-9][0-9]{1,2}\\))|(\\(\\+?[2-8][0-9][0-9]\\))|(\\(\\+?[1-9][0-9]\\))|(\\(\\+?[17]\\))|(\\([2-9][2-9]\\))|([ \\-\\.]{0,3}[0-9]{2,4}))?([ \\-\\.][0-9])?([ \\-\\.]{0,3}[0-9]{2,4}){2,3}$");
        if (!p.matcher(phone).find()) {
            check = false;
            request.setAttribute("name", name);
            request.setAttribute("usernamerg", username);
            request.setAttribute("pass", password);
            request.setAttribute("phone", phone);
            request.setAttribute("email", email);
            request.setAttribute("message1", "Phone sai format");
            processRequest(request, response);
        }

        if (request.getParameter("selector") == null || !request.getParameter("selector").equals("on")) {
            check = false;
            request.setAttribute("name", name);
            request.setAttribute("usernamerg", username);
            request.setAttribute("pass", password);
            request.setAttribute("phone", phone);
            request.setAttribute("email", email);
            request.setAttribute("message1", "You do not agree to the terms and privacy policy. Please check again");
            processRequest(request, response);
        }

        if (check == true) {
            int accountid = login.insertAccount(username, password, role, email);
            login.insertCustomer(accountid, name, phone);
            request.setAttribute("message1", "You have successfully registered");
            SendMail sendmail = new SendMail();
            sendmail.sendMailConfirm(email, subject, message2);
            processRequest(request, response);
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

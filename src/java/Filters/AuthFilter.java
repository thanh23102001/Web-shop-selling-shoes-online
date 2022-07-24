/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Filters;

import Models.Account;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author QUANG HUY
 */
@WebFilter(filterName = "AuthFilter", urlPatterns = {"/*"})
public class AuthFilter implements Filter {

    /**
     *
     * @param request The servlet request we are processing
     * @param response The servlet response we are creating
     * @param chain The filter chain we are processing
     *
     * @exception IOException if an input/output error occurs
     * @exception ServletException if a servlet error occurs
     */
    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession();
        Account accountSession = (Account) session.getAttribute("userLogin");
        String url = ((HttpServletRequest) request).getRequestURL().toString();

        if (url.contains("Admin") || url.contains("Employee")) {
            if (accountSession != null) {
                if (url.contains("Admin")) {
                    if (accountSession.getRole().equalsIgnoreCase("admin")) {
                        chain.doFilter(request, response);
                    } else if (accountSession.getRole().equalsIgnoreCase("employee")) {
                        httpResponse.sendRedirect("Employee");
                    } else {
                        httpResponse.sendRedirect("HomePage");
                    }
                } 
                if (url.contains("Employee") && !url.contains("Admin")) {
                    if (accountSession.getRole().equalsIgnoreCase("employee")) {
                        chain.doFilter(request, response);
                    } else if (accountSession.getRole().equalsIgnoreCase("admin")) {
                        httpResponse.sendRedirect("Admin");
                    } else {
                        httpResponse.sendRedirect("HomePage");
                    }
                } 
            } else {
                httpResponse.sendRedirect("Login");
            }
        } else {
            chain.doFilter(request, response);
        }
    }

    /**
     * Destroy method for this filter
     */
    @Override
    public void destroy() {
    }

    @Override
    public void init(FilterConfig filterConfig) {

    }
}

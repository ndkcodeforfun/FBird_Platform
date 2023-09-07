/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package fbird.controller;

import fbird.customer.CustomerDAO;
import fbird.customer.CustomerDTO;
import fbird.google_authentication.GooglePojo;
import fbird.user.UserDAO;
import fbird.user.UserDTO;
import fbird.utils.GoogleUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author Louis Kien
 */
public class LoginGoogleController extends HttpServlet {

    private static final String LOGIN_PAGE = "login.jsp";
    private static final String SUCCESS = "MainController?action=";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = LOGIN_PAGE;
        try {
            String code = request.getParameter("code");
            if (code == null || code.isEmpty()) {
                request.setAttribute("ERROR", "Can't login to Google account");
            } else {
                String accessToken = GoogleUtils.getToken(code);
                GooglePojo googlePojo = GoogleUtils.getUserInfo(accessToken);
                String username = googlePojo.getId();
                int role_id = 3;
                int status = 1;
                String fullname = googlePojo.getName();
                String email = googlePojo.getEmail();
                String avatar = googlePojo.getPicture();
                UserDAO dao = new UserDAO();
                if (!dao.checkDublicate(username)) {
                    UserDTO googleUser = new UserDTO(username, "jBafbWnF5FHeoa0ivQp2ingLF6vlOQNp", role_id, status);
                    boolean checkInsert = dao.insertAccount(googleUser);
                    if (checkInsert) {
                        CustomerDAO cdao = new CustomerDAO();
                        CustomerDTO googleCustomer = new CustomerDTO(username, fullname, email, avatar);
                        boolean checkInsertCustomer = cdao.insertCustomer(googleCustomer);
                        if (checkInsertCustomer) {
                            UserDTO loginUser = dao.checkGoogleLogin(username);
                            HttpSession session = request.getSession();
                            session.setAttribute("LOGIN_USER", loginUser);
                            url = SUCCESS;
                        }
                    }
                } else {
                    UserDTO loginUser = dao.checkGoogleLogin(username);
                    HttpSession session = request.getSession();
                    session.setAttribute("LOGIN_USER", loginUser);
                    if(loginUser.getRole() == 2){
                        url = "MainController?action=ViewShopDashboard";
                    } else {
                        url = SUCCESS;
                    }
                }
            }
        } catch (Exception e) {
            log("Error at LoginGoogleController: " + e.toString());
        } finally {
            response.sendRedirect(url);
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

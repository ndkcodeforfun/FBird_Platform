/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package fbird.controller;

import fbird.user.UserDAO;
import fbird.user.UserDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

/**
 *
 * @author louis
 */
public class LoginController extends HttpServlet {

    private static final String LOGIN_PAGE = "login.jsp";
    private static final int ADMIN = 1;
    private static final String ADMIN_PAGE = "adminDashboard.jsp";
    private static final int SHOP = 2;
    private static final String SHOP_PAGE = "MainController?action=ViewShopDashboard";
    private static final int CUSTOMER = 3;
    private static final String CUSTOMER_PAGE = "MainController?action=";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = LOGIN_PAGE;
        try {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            UserDAO dao = new UserDAO();
            UserDTO loginUser = dao.checkLogin(username, password);
            if (loginUser == null) {
                request.setAttribute("ERROR", "Tài khoản hoặc mật khẩu không chính xác");
            } else {
                HttpSession session = request.getSession();
                int role_id = loginUser.getRole();
                if (ADMIN == role_id) {
                    url = ADMIN_PAGE;
                    session.setAttribute("LOGIN_USER", loginUser);
                } else if (SHOP == role_id) {
                    int status = loginUser.getStatus();
                    if (status == 1) {
                        url = SHOP_PAGE;
                        session.setAttribute("LOGIN_USER", loginUser);
                    } else {
                        request.setAttribute("ERROR", "Tài khoản của bạn đã bị khóa bởi quản trị viên, vui lòng liên hệ chăm sóc khách hàng để biết thêm chi tiết");
                    }
                } else if (CUSTOMER == role_id) {
                    url = CUSTOMER_PAGE;
                    session.setAttribute("LOGIN_USER", loginUser);
                } else {
                    request.setAttribute("ERROR", "Your role is not support");
                }
            }
        } catch (Exception e) {
            log("ERROR at LoginConttroller: " + toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package fbird.controller;

import fbird.customer.CustomerDAO;
import fbird.customer.CustomerDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 *
 * @author Khanh
 */
public class AddUserAddressController extends HttpServlet {

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
        try {
            boolean check;
            int customer_id = Integer.parseInt(request.getParameter("customer_id"));
            String username = request.getParameter("username");
            String home_number = request.getParameter("home_number");
            String city = request.getParameter("city");
            String street = request.getParameter("street");

            CustomerDAO cusDao = new CustomerDAO();
            CustomerDTO customer = cusDao.checkCustomerExist(username);
            if (customer != null) {
                check = cusDao.createAddress(customer_id, home_number, city, street);
                if (check == true) {
                    request.setAttribute("msg", "Cập nhật địa chỉ thành công");
                    request.getRequestDispatcher("createAddress.jsp").forward(request, response);
                }else{
                    request.setAttribute("msg", "Cập nhật địa chỉ thất bại");
                    request.getRequestDispatcher("createAddress.jsp").forward(request, response);
                }
            }else{
                request.setAttribute("msg", "Tài khoản không tồn tại");
                request.getRequestDispatcher("createAddress.jsp").forward(request, response);
            }

        } catch (Exception e) {
            log("ERROR at AddUserProfileConttroller: " + toString());
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

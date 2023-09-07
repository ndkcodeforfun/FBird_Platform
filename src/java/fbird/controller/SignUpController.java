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
import java.io.IOException;



public class SignUpController extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        response.setContentType("text/html;charset=UTF-8");
         try {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirm = request.getParameter("confirm");

      
        if (username.length() < 5 || username.length() > 20) {
            request.setAttribute("msg", "Tên đăng nhập phải từ 5 đến 20 ký tự");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return; 
        }

       
        if (password.length() < 5 || password.length() > 12) {
            request.setAttribute("msg", "Mật khẩu phải từ 5 đến 12 ký tự");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return; 
        }

        if (!confirm.equals(password)) {
            request.setAttribute("msg", "Mật khẩu không trùng khớp");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        } else {
            UserDAO dao = new UserDAO();
            UserDTO user = dao.checkUserExist(username);
            if (user != null) {
                request.setAttribute("msg", "Tài khoản đã tồn tại");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            } else {
                dao.singup(username, password);
                request.setAttribute("user", username);
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        }
    } catch (Exception e) {
        log("ERROR at SignUpConttroller: " + toString());
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

package servlet;

import model.User;
import service.UserManageAdminService;
import util.DBUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;

@SuppressWarnings("serial")
@WebServlet("/UserManageAdminServlet")
public class UserManageAdminServlet extends HttpServlet {
    private UserManageAdminService userService;

    @Override
    public void init() throws ServletException {
        try {
            Connection conn = DBUtil.getConnection();
            userService = new UserManageAdminService(conn);
        } catch (Exception e) {
            throw new ServletException("Failed to initialize UserManageAdminServlet", e);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        
        try {
            if ("view".equals(action)) {
                // Show all users
                List<User> users = userService.getAllUsers();
                request.setAttribute("users", users);
            } 
            else if ("search".equals(action)) {
                // Search for a specific user
                String email = request.getParameter("email");
                User user = userService.getUserByEmail(email);
                request.setAttribute("searchedUser", user);
                request.setAttribute("users", userService.getAllUsers());
            }
            else if ("viewProfile".equals(action)) {
                // View user profile details
                String email = request.getParameter("email");
                User user = userService.getUserByEmail(email);
                request.setAttribute("viewedUser", user);
            }
            
            request.getRequestDispatcher("UserManagementAdmin.jsp").forward(request, response);
        } catch (Exception e) {
            response.sendRedirect("UserManageAdminServlet?action=view&status=failed");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        boolean success = false;
        
        try {
            if ("update".equals(action)) {
                // Update user
                User user = new User(
                    Integer.parseInt(request.getParameter("id")),
                    request.getParameter("fullname"),
                    request.getParameter("username"),
                    request.getParameter("email"),
                    request.getParameter("phone"),
                    request.getParameter("country"),
                    request.getParameter("password")
                );
                success = userService.updateUser(user);
                response.sendRedirect("UserManageAdminServlet?action=view&status=" + (success ? "updated" : "failed"));
            } 
            else if ("delete".equals(action)) {
                // Delete user
                String email = request.getParameter("email");
                success = userService.deleteUser(email);
                response.sendRedirect("UserManageAdminServlet?action=view&status=" + (success ? "deleted" : "failed"));
            }
        } catch (Exception e) {
            response.sendRedirect("UserManageAdminServlet?action=view&status=failed");
        }
    }
}
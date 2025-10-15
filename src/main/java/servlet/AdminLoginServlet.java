package servlet;

import util.DBUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@SuppressWarnings("serial")
@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try (Connection conn = DBUtil.getConnection()) {
            String sql = "SELECT * FROM admin WHERE email = ? AND password = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String position = rs.getString("position");
                int adminId = rs.getInt("admin_id");

                HttpSession session = request.getSession();
                session.setAttribute("adminId", adminId);
                session.setAttribute("email", email);
                session.setAttribute("position", position);

                // Redirect to respective dashboard
                if ("BookingAdmin".equals(position)) {
                    response.sendRedirect("BookingAdmin.jsp");
                } else if ("User_Admin".equals(position)) {
                    response.sendRedirect("UserManagementAdmin.jsp");
                } else if ("Bus_Operator".equals(position)) {
                    response.sendRedirect("BusOperatorAdmin.jsp");
                } else {
                    response.sendRedirect("admin_login.jsp?error=1");
                }
            } else {
                response.sendRedirect("admin_login.jsp?error=1");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("admin_login.jsp?error=1");
        }
    }
}

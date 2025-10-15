package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.DBUtil;

@SuppressWarnings("serial")
@WebServlet("/UpdateTicketServlet")
public class UpdateTicketServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int ticketId = Integer.parseInt(request.getParameter("ticket_id"));
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String seats = request.getParameter("seat_numbers");
        double total = Double.parseDouble(request.getParameter("total_price"));
        int busId = Integer.parseInt(request.getParameter("bus_id"));

        try (Connection conn = DBUtil.getConnection()) {
            PreparedStatement ps = conn.prepareStatement(
                "UPDATE ticket SET fullname = ?, email = ?, seat_numbers = ?, total_price = ?, bus_id = ? WHERE ticket_id = ?"
            );
            ps.setString(1, fullname);
            ps.setString(2, email);
            ps.setString(3, seats);
            ps.setDouble(4, total);
            ps.setInt(5, busId);
            ps.setInt(6, ticketId);
            ps.executeUpdate();
            response.sendRedirect("BookingAdmin.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}

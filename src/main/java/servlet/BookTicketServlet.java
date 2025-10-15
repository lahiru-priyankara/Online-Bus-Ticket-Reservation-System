package servlet;

import util.DBUtil;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.ServletException;
import java.io.IOException;
import java.sql.*;

@SuppressWarnings("serial")
@WebServlet("/BookTicketServlet")
public class BookTicketServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String seats = request.getParameter("seats");
        double totalPrice = Double.parseDouble(request.getParameter("totalPrice"));
        int busId = Integer.parseInt(request.getParameter("busId"));

        try (Connection conn = DBUtil.getConnection()) {
            // Save ticket
            String insertSql = "INSERT INTO ticket (fullname, email, seat_numbers, total_price, bus_id) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(insertSql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, fullname);
            ps.setString(2, email);
            ps.setString(3, seats);
            ps.setDouble(4, totalPrice);
            ps.setInt(5, busId);
            ps.executeUpdate();

            ResultSet rs = ps.getGeneratedKeys();
            int ticketId = 0;
            if (rs.next()) {
                ticketId = rs.getInt(1);
            }

            // Mark seats as booked
            for (String seat : seats.split(",")) {
                PreparedStatement updateSeat = conn.prepareStatement("UPDATE seat SET status = 'booked' WHERE seat_number = ? AND bus_id = ?");
                updateSeat.setString(1, seat.trim());
                updateSeat.setInt(2, busId);
                updateSeat.executeUpdate();
            }

            response.sendRedirect("ticket.jsp?ticketId=" + ticketId);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}

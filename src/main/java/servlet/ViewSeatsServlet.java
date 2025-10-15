package servlet;

import service.SeatService;
import model.Seat;
import util.DBUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;

@SuppressWarnings("serial")
@WebServlet("/ViewSeatsServlet")
public class ViewSeatsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int busId = Integer.parseInt(request.getParameter("busId"));

        try {
            Connection conn = DBUtil.getConnection();
            SeatService seatDAO = new SeatService(conn);
            List<Seat> seats = seatDAO.getSeatsByBusId(busId);
            request.setAttribute("seats", seats);
            request.getRequestDispatcher("viewSeats.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error fetching seats.");
        }
    }
}

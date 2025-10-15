package servlet;

import model.Bus;
import model.Route;
import service.BusRouteService;
import util.DBUtil;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.ServletException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

@SuppressWarnings("serial")
@WebServlet("/AddBusRoute")
public class AddBusRouteServlet extends HttpServlet {
    private BusRouteService service;

    public void init() {
        try {
            Connection conn = DBUtil.getConnection();
            service = new BusRouteService(conn);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String source = request.getParameter("source");
        String destination = request.getParameter("destination");
        String travelDate = request.getParameter("travelDate");

        String name = request.getParameter("name");
        String type = request.getParameter("type");
        int seatCount = Integer.parseInt(request.getParameter("seatCount"));
        String departureTime = request.getParameter("departureTime");
        String arivelTime = request.getParameter("arivelTime");
        double seatPrice = 0.0;

        try {
            seatPrice = Double.parseDouble(request.getParameter("seatPrice"));
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }

        Route route = new Route();
        route.setSource(source);
        route.setDestination(destination);
        route.setTravelDate(travelDate);

        Bus bus = new Bus();
        bus.setName(name);
        bus.setType(type);
        bus.setSeatCount(seatCount);
        bus.setDepartureTime(departureTime);
        bus.setArivelTime(arivelTime);
        bus.setPrice(seatPrice); // ✅ This is key

        boolean success = service.addRouteBusSeats(route, bus);
        if (success) {
            response.sendRedirect("viewBusRoute.jsp?success=true");
        } else {
            response.sendRedirect("addBusRoute.jsp?error=true");
        }
    }
}

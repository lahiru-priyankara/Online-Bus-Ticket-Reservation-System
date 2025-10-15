package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BusRouteView;
import service.BusRouteService;
import util.DBUtil;

@SuppressWarnings("serial")
@WebServlet("/BusRouteController")
public class BusRouteController extends HttpServlet {
    private BusRouteService service;

    public void init() {
        Connection conn = null;
		try {
			conn = DBUtil.getConnection();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        service = new BusRouteService(conn);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("update".equals(action)) {
            BusRouteView view = new BusRouteView();
            view.setBusId(Integer.parseInt(request.getParameter("busId")));
            view.setRouteId(Integer.parseInt(request.getParameter("routeId")));
            view.setBusName(request.getParameter("busName"));
            view.setType(request.getParameter("type"));
            view.setDepartureTime(request.getParameter("departureTime"));
            view.setSource(request.getParameter("source"));
            view.setDestination(request.getParameter("destination"));
            view.setTravelDate(request.getParameter("travelDate"));

            boolean result = service.updateBusRoute(view);
            if (result) {
                response.sendRedirect("viewBusRoute.jsp?success=updated");
            } else {
                response.sendRedirect("viewBusRoute.jsp?error=updateFailed");
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("delete".equals(action)) {
            int busId = Integer.parseInt(request.getParameter("busId"));
            int routeId = Integer.parseInt(request.getParameter("routeId"));

            boolean result = service.deleteBusRoute(busId, routeId);
            if (result) {
                response.sendRedirect("viewBusRoute.jsp?success=deleted");
            } else {
                response.sendRedirect("viewBusRoute.jsp?error=deleteFailed");
            }
        }
    }
}

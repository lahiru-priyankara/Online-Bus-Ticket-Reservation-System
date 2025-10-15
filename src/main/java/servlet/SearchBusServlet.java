package servlet;

import service.BusService;
import model.Bus;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@SuppressWarnings("serial")
@WebServlet("/SearchBusServlet")
public class SearchBusServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String source = request.getParameter("source");
        String destination = request.getParameter("destination");
        String travelDate = request.getParameter("travelDate");

        BusService busDAO = new BusService();
        List<Bus> buses = null;
		try {
			buses = busDAO.getBusesByRoute(source, destination, travelDate);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

        request.setAttribute("buses", buses);
        request.getRequestDispatcher("searchBuses.jsp").forward(request, response);
    }
}
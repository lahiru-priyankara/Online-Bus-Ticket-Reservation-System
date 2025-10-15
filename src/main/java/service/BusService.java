package service;

import model.Bus;
import util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BusService {
    public List<Bus> getBusesByRoute(String source, String destination, String date) throws ClassNotFoundException {
        List<Bus> buses = new ArrayList<>();
        String query = "SELECT b.* FROM Bus b JOIN Route r ON b.route_id = r.route_id WHERE r.source = ? AND r.destination = ? AND r.travel_date = ?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, source);
            stmt.setString(2, destination);
            stmt.setString(3, date);

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Bus bus = new Bus();
                bus.setBusId(rs.getInt("bus_id"));
                bus.setName(rs.getString("name"));
                bus.setType(rs.getString("type"));
                bus.setRouteId(rs.getInt("route_id"));
                bus.setDepartureTime(rs.getString("departure_time"));
                bus.setArivelTime(rs.getString("arivel_time"));
                buses.add(bus);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return buses;
    }

	

}

	

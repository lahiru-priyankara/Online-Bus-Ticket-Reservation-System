package service;

import model.Bus;
import model.BusRouteView;
import model.Route;
import model.Seat;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BusRouteService {
    private Connection conn;

    public BusRouteService(Connection conn) {
        this.conn = conn;
    }

    public List<BusRouteView> getAllBusRouteData() {
        List<BusRouteView> list = new ArrayList<>();
        String sql = "SELECT b.bus_id, b.name AS bus_name, b.type, b.departure_time, b.arivel_time, r.route_id, r.source, r.destination, r.travel_date " +
                     "FROM bus b JOIN route r ON b.route_id = r.route_id";
        try (PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                BusRouteView br = new BusRouteView();
                br.setBusId(rs.getInt("bus_id"));
                br.setBusName(rs.getString("bus_name"));
                br.setType(rs.getString("type"));
                br.setDepartureTime(rs.getString("departure_time"));
                br.setArivelTime(rs.getString("arivel_time"));
                br.setRouteId(rs.getInt("route_id"));
                br.setSource(rs.getString("source"));
                br.setDestination(rs.getString("destination"));
                br.setTravelDate(rs.getString("travel_date"));
                list.add(br);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean updateBusRoute(BusRouteView view) {
        try {
            String updateBus = "UPDATE bus SET name=?, type=?, departure_time=? WHERE bus_id=?";
            String updateRoute = "UPDATE route SET source=?, destination=?, travel_date=? WHERE route_id=?";

            PreparedStatement busStmt = conn.prepareStatement(updateBus);
            busStmt.setString(1, view.getBusName());
            busStmt.setString(2, view.getType());
            busStmt.setString(3, view.getDepartureTime());
            busStmt.setInt(4, view.getBusId());

            PreparedStatement routeStmt = conn.prepareStatement(updateRoute);
            routeStmt.setString(1, view.getSource());
            routeStmt.setString(2, view.getDestination());
            routeStmt.setString(3, view.getTravelDate());
            routeStmt.setInt(4, view.getRouteId());

            return busStmt.executeUpdate() > 0 && routeStmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteBusRoute(int busId, int routeId) {
        try {
            // Delete bus first (FK dependency), then route
            PreparedStatement busStmt = conn.prepareStatement("DELETE FROM bus WHERE bus_id=?");
            busStmt.setInt(1, busId);

            PreparedStatement routeStmt = conn.prepareStatement("DELETE FROM route WHERE route_id=?");
            routeStmt.setInt(1, routeId);

            return busStmt.executeUpdate() > 0 && routeStmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    
    public boolean addRouteBusSeats(Route route, Bus bus) {
        try {
            // Insert route
            String routeSql = "INSERT INTO route (source, destination, travel_date) VALUES (?, ?, ?)";
            PreparedStatement routeStmt = conn.prepareStatement(routeSql, Statement.RETURN_GENERATED_KEYS);
            routeStmt.setString(1, route.getSource());
            routeStmt.setString(2, route.getDestination());
            routeStmt.setString(3, route.getTravelDate());
            routeStmt.executeUpdate();
            ResultSet routeRs = routeStmt.getGeneratedKeys();
            if (!routeRs.next()) return false;
            int routeId = routeRs.getInt(1);
            bus.setRouteId(routeId);

            // Insert bus
            String busSql = "INSERT INTO bus (name, type, route_id, departure_time, arivel_time, seat_count) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement busStmt = conn.prepareStatement(busSql, Statement.RETURN_GENERATED_KEYS);
            busStmt.setString(1, bus.getName());
            busStmt.setString(2, bus.getType());
            busStmt.setInt(3, routeId);
            busStmt.setString(4, bus.getDepartureTime());
            busStmt.setString(5, bus.getArivelTime());
            busStmt.setInt(6, bus.getSeatCount());
            busStmt.executeUpdate();
            ResultSet busRs = busStmt.getGeneratedKeys();
            if (!busRs.next()) return false;
            int busId = busRs.getInt(1);

            // Insert seats
            String seatSql = "INSERT INTO seat (seat_number, status, bus_id, price) VALUES (?, 'available', ?, ?)";
            PreparedStatement seatStmt = conn.prepareStatement(seatSql);
            for (int i = 1; i <= bus.getSeatCount(); i++) {
                seatStmt.setString(1, "S" + i);
                seatStmt.setInt(2, busId);
                seatStmt.setDouble(3, bus.getPrice()); 
                seatStmt.addBatch();
                
            }
            seatStmt.executeBatch();

            return true;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    
}

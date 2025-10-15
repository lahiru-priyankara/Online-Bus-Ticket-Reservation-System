package service;

import model.Seat;
import java.sql.*;
import java.util.*;

public class SeatService {
    private Connection conn;

    public SeatService(Connection conn) {
        this.conn = conn;
    }

    public List<Seat> getSeatsByBusId(int busId) throws SQLException {
        List<Seat> seats = new ArrayList<>();
        String sql = "SELECT * FROM seat WHERE bus_id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, busId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Seat seat = new Seat(busId);
                seat.setSeatId(rs.getInt("seat_id"));
                seat.setSeatNumber(rs.getString("seat_number"));
                seat.setStatus(rs.getString("status"));
                seat.setBusId(rs.getInt("bus_id"));
                seat.setPrice(rs.getDouble("price"));
                seats.add(seat);
            }
        }
        return seats;
    }
}

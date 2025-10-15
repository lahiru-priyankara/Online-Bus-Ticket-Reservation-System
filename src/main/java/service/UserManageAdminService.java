package service;

import model.User;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserManageAdminService {
    private final Connection conn;

    public UserManageAdminService(Connection conn) {
        this.conn = conn;
    }

    public List<User> getAllUsers() throws SQLException {
        List<User> users = new ArrayList<>();
        String sql = "SELECT * FROM users";
        try (PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                users.add(extractUserFromResultSet(rs));
            }
        }
        return users;
    }

    public User getUserByEmail(String email) throws SQLException {
        String sql = "SELECT * FROM users WHERE email = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, email);
            try (ResultSet rs = stmt.executeQuery()) {
                return rs.next() ? extractUserFromResultSet(rs) : null;
            }
        }
    }

    public boolean updateUser(User user) throws SQLException {
        String sql = "UPDATE users SET fullname=?, username=?, phone=?, country=?, password=? WHERE email=?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, user.getName());
            stmt.setString(2, user.getUsername());
            stmt.setString(3, user.getPhone());
            stmt.setString(4, user.getCountry());
            stmt.setString(5, user.getPassword());
            stmt.setString(6, user.getEmail());
            return stmt.executeUpdate() > 0;
        }
    }

    public boolean deleteUser(String email) throws SQLException {
        String sql = "DELETE FROM users WHERE email=?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, email);
            return stmt.executeUpdate() > 0;
        }
    }

    private User extractUserFromResultSet(ResultSet rs) throws SQLException {
        return new User(
            rs.getInt("id"),
            rs.getString("fullname"),
            rs.getString("username"),
            rs.getString("email"),
            rs.getString("phone"),
            rs.getString("country"),
            rs.getString("password")
        );
    }
}
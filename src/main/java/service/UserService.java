package service;

import model.User;
import java.sql.*;


public class UserService {
    private Connection conn;

    public UserService(Connection conn) {
        this.conn = conn;
    }

    public boolean registerUser(User user) {
        String sql = "INSERT INTO users (fullname, username, email, phone, country, password) VALUES (?, ?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, user.getName());
            stmt.setString(2, user.getUsername());
            stmt.setString(3, user.getEmail());
            stmt.setString(4, user.getPhone());
            stmt.setString(5, user.getCountry());
            stmt.setString(6, user.getPassword());

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public User loginUser(String email, String password) {
        String sql = "SELECT * FROM users WHERE email = ? AND password = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, email);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                logLoginAttempt(email, "success");
                return new User(
                    rs.getInt("id"),
                    rs.getString("fullname"),
                    rs.getString("username"),
                    rs.getString("email"),
                    rs.getString("phone"),
                    rs.getString("country"),
                    rs.getString("password")
                );
            } else {
                logLoginAttempt(email, "failed");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    private void logLoginAttempt(String email, String status) {
        String sql = "INSERT INTO userLoginLogs (email, status) VALUES (?, ?)";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, email);
            stmt.setString(2, status);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    public boolean updateUser(User user) {
        String sql = "UPDATE users SET fullname = ?, username = ?, phone = ?, country = ?, password = ? WHERE email = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, user.getName());
            stmt.setString(2, user.getUsername());
            stmt.setString(3, user.getPhone());
            stmt.setString(4, user.getCountry());
            stmt.setString(5, user.getPassword());
            stmt.setString(6, user.getEmail());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }


    public boolean deleteUser(String email) {
        String sql = "DELETE FROM users WHERE email = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, email);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

}

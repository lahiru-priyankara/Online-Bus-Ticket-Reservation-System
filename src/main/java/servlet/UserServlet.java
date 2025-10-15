package servlet;

import model.User;
import service.UserService;
import util.DBUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;

@SuppressWarnings("serial")
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
    private UserService userService;

    public void init() {
        try {
            Connection conn = DBUtil.getConnection();
            userService = new UserService(conn);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("register".equals(action)) {
            registerUser(request, response);
        } else if ("login".equals(action)) {
            loginUser(request, response);
        } else if ("update".equals(action)) {
            updateUser(request, response);
        } else if ("delete".equals(action)) {
            deleteUser(request, response);
        }
    }

    private void registerUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String fullname = request.getParameter("fullname");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String country = request.getParameter("country");
        String password = request.getParameter("password");

        User user = new User(0, fullname, username, email, phone, country, password);
        boolean isRegistered = userService.registerUser(user);

        if (isRegistered) {
            response.sendRedirect("UserLogin.jsp?success=registered");
        } else {
            response.sendRedirect("UserRegister.jsp?error=failed");
        }
    }

    private void loginUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = userService.loginUser(email, password);

        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            response.sendRedirect("UserProfile.jsp");
        } else {
            response.sendRedirect("UserLogin.jsp?error=invalid");
        }
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String fullname = request.getParameter("fullname");
        String username = request.getParameter("username");
        String phone = request.getParameter("phone");
        String country = request.getParameter("country");
        String password = request.getParameter("password");
        String email = request.getParameter("email");

        User user = new User(0, fullname, username, email, phone, country, password);
        boolean isUpdated = userService.updateUser(user);

        if (isUpdated) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user); // update session
            response.sendRedirect("UserProfile.jsp?success=updated");
        } else {
            response.sendRedirect("UserProfile.jsp?error=failed");
        }
    }


    private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String email = request.getParameter("email");
        boolean isDeleted = userService.deleteUser(email);

        if (isDeleted) {
            HttpSession session = request.getSession();
            session.invalidate();
            response.sendRedirect("UserRegister.jsp?success=deleted");
        } else {
            response.sendRedirect("UserProfile.jsp?error=failed");
        }
    }
}

package Delivery;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;
@WebServlet("/Loginservlet")
public class Loginservlet extends HttpServlet {
  
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        System.out.println("Attempting login with: " + username + ", " + password + ", " + role);

        try (Connection con = DBconnect.getConnection()) {
            String query = "SELECT * FROM users WHERE username = ? AND password = ? AND role = ?";
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1, username);
            stmt.setString(2, password);
            stmt.setString(3, role);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                String dbRole = rs.getString("role");
                int userId = rs.getInt("id");  // Get user id from the result set
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                session.setAttribute("role", dbRole);
                session.setAttribute("user_id", userId);  // Store user_id in session

                System.out.println("Login successful for user: " + username + " with role: " + dbRole);

                switch (dbRole) {
                    case "admin":
                        response.sendRedirect("admin_dashboard.jsp");
                        break;
                    case "user":
                        response.sendRedirect("PlaceOrder.jsp");
                        break;

                    case "staff":
                        response.sendRedirect("staffDashboard");
                        break;
                    case "delivery":
                        response.sendRedirect("showServlet");
                        break;
                    default:
                        response.sendRedirect("login.jsp?error=Unknown role: " + dbRole);
                }
            } else {
                System.out.println("Login failed for user: " + username + " with role: " + role);
                response.sendRedirect("login.jsp?error=Invalid credentials");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp?error=Server error: " + e.getMessage());
        }
    }
}

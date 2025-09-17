package Delivery;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/userDashboard")
public class UserDashboardServlet extends HttpServlet {
   
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get user_id from session
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("user_id");

        if (userId == null) {
            response.sendRedirect("loginPage.jsp"); // Redirect to login if user is not logged in
            return;
        }

        List<OrderAz> orders = new ArrayList<>();
        try (Connection conn = DBconnect.getConnection()) {
            String sql = "SELECT * FROM orders WHERE user_id = ? ORDER BY order_date DESC";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, userId);  // Fetch orders only for the logged-in user
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                OrderAz order = new OrderAz(
                        rs.getInt("id"),
                       rs.getString("order_code"),
                        rs.getInt("item_count"),
                         rs.getDate("order_date"),
                        rs.getString("status")
                );
                orders.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Set orders in request to display in JSP
        request.setAttribute("orderList", orders);
        request.getRequestDispatcher("user_dashboard.jsp").forward(request, response);
    }
}

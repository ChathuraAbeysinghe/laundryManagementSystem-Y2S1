package Delivery;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.time.LocalDate;
import java.util.UUID;


public class PlaceOrderServletAz extends HttpServlet {
    
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get item count from form
        int itemCount = Integer.parseInt(request.getParameter("itemCount"));

        // Get user ID from session
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("user_id");

        if (userId == null) {
            response.sendRedirect("loginPage.jsp");
            return;
        }

        // Generate order code
        String orderCode = "ORD-" + UUID.randomUUID().toString().substring(0, 8).toUpperCase();

        try (Connection conn = DBconnect.getConnection()) {
            String sql = "INSERT INTO ordersaz (order_code, user_id, item_count, order_date, status) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, orderCode);
            stmt.setInt(2, userId); // ✅ Save user_id
            stmt.setInt(3, itemCount);
            stmt.setDate(4, Date.valueOf(LocalDate.now()));
            stmt.setString(5, "Pending");
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        response.sendRedirect("user_dashboard.jsp");
    }
}

package Delivery;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class ViewOrdersServletAz extends HttpServlet {

  
	private static final long serialVersionUID = 1L;

	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get the user ID from session
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("user_id");

        if (userId == null) {
            response.sendRedirect("loginPage.jsp");
            return;
        }

        List<OrderAz> orders = new ArrayList<>();

        try (Connection conn = DBconnect.getConnection()) {
            String sql = "SELECT * FROM ordersaz WHERE user_id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();

            // Loop through the result set and create Order objects
            while (rs.next()) {
                int id = rs.getInt("id");
                String orderCode = rs.getString("order_code");
                int itemCount = rs.getInt("item_count");
                Date orderDate = rs.getDate("order_date");
                String status = rs.getString("status");

                OrderAz order = new OrderAz(id, orderCode, userId, itemCount, orderDate, status);
                orders.add(order);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Add orders to request attribute and forward to JSP page
        request.setAttribute("orders", orders);
        request.getRequestDispatcher("view_ordersAz.jsp").forward(request, response);
    }
}

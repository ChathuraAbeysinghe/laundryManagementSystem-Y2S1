package Delivery;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/staffDashboard")
public class StaffDashboardServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String staffUsername = (String) request.getSession().getAttribute("username");
        List<Staff> staffList = new ArrayList<>();
        List<OrderAz> completedOrders = new ArrayList<>();

        try (Connection conn = DBconnect.getConnection()) {
            // Fetch staff details
            String staffSql = "SELECT * FROM users WHERE username = ? AND role = 'staff'";
            PreparedStatement ps = conn.prepareStatement(staffSql);
            ps.setString(1, staffUsername);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Staff staff = new Staff(
                        rs.getInt("id"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("role"),
                        rs.getString("email"),
                        rs.getString("phone")
                );
                staffList.add(staff);
            }

         // Inside doGet() method after fetching staff details

         // Fetch pending orders (placed by users)
            String orderSql = "SELECT * FROM ordersaz WHERE status != 'Cancelled'";
            Statement orderStmt = conn.createStatement();
            ResultSet or = orderStmt.executeQuery(orderSql);
            while (or.next()) {
                OrderAz order = new OrderAz(
                    or.getInt("id"),
                    or.getString("order_code"),
                    or.getInt("user_id"),
                    or.getInt("item_count"),
                    or.getDate("order_date"),
                    or.getString("status")
                );
                completedOrders.add(order);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Set attributes for the JSP to access
        request.setAttribute("staffDetails", staffList);
        request.setAttribute("orderList", completedOrders);  // ✅ Matches JSP variable name


        // Forward to the JSP page for rendering
        request.getRequestDispatcher("staff_dashboard.jsp").forward(request, response);
    }
}

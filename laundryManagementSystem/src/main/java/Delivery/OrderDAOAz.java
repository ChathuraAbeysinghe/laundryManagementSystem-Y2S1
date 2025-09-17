package Delivery;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderDAOAz {
    public List<OrderAz> getAllOrders() {
        List<OrderAz> orders = new ArrayList<>();
        String sql = "SELECT * FROM ordersaz ORDER BY order_date DESC";

        try (Connection conn = DBconnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                OrderAz order = new OrderAz();
                order.setId(rs.getInt("id"));
                order.setOrderCode(rs.getString("order_code"));
                order.setUserId(rs.getInt("user_id"));
                order.setItemCount(rs.getInt("item_count"));
                order.setOrderDate(rs.getDate("order_date"));
                order.setStatus(rs.getString("status"));
                orders.add(order);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return orders;
    }
}

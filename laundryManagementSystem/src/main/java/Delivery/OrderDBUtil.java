package Delivery;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderDBUtil {

    // ✅ INSERT NEW ORDER
    public static boolean insertOrder(Order order) {
        boolean isSuccess = false;
        try {
            Connection con = DBconnect.getConnection();

            String sql = "INSERT INTO orders (user_id, category, quantity, wash_type, wash_note, pickup_address, pickup_date, pickup_time, " +
                         "delivery_address, delivery_date, delivery_time, delivery_note, payment_method, payment_status) " +
                         "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement stmt = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stmt.setInt(1, order.getUserId());
            stmt.setString(2, order.getCategory());
            stmt.setInt(3, order.getQuantity());
            stmt.setString(4, order.getWashType());
            stmt.setString(5, order.getWashNote());
            stmt.setString(6, order.getPickupAddress());
            stmt.setString(7, order.getPickupDate());
            stmt.setString(8, order.getPickupTime());
            stmt.setString(9, order.getDeliveryAddress());
            stmt.setString(10, order.getDeliveryDate());
            stmt.setString(11, order.getDeliveryTime());
            stmt.setString(12, order.getDeliveryNote());
            stmt.setString(13, order.getPaymentMethod());
            stmt.setString(14, order.getPaymentStatus());

            int rows = stmt.executeUpdate();
            if (rows > 0) {
                ResultSet rs = stmt.getGeneratedKeys();
                if (rs.next()) {
                    int id = rs.getInt(1);
                    order.setId(id); // set the generated ID
                }
                isSuccess = true;
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isSuccess;
    }

    // GET ORDER BY ID
    public static Order getOrderById(int orderId) {
        Order order = null;
        try {
            Connection con = DBconnect.getConnection();
            String sql = "SELECT * FROM laundry_management.orders WHERE  order_id=?";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, orderId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                order = new Order(
                    rs.getInt("order_id"),
                    rs.getInt("user_id"),
                    rs.getString("category"),
                    rs.getInt("quantity"),
                    rs.getString("wash_type"),
                    rs.getString("wash_note"),
                    rs.getString("pickup_address"),
                    rs.getString("pickup_date"),
                    rs.getString("pickup_time"),
                    rs.getString("delivery_address"),
                    rs.getString("delivery_date"),
                    rs.getString("delivery_time"),
                    rs.getString("delivery_note"),
                    rs.getString("payment_method"),
                    rs.getString("payment_status")
                );
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return order;
    }

    // ✅ UPDATE ORDER
    public static boolean updateOrder(Order order) {
        boolean updated = false;
        try {
            Connection con = DBconnect.getConnection();
            String sql = "UPDATE laundry_management.orders SET category=?, quantity=?, wash_type=?, wash_note=?, pickup_address=?, pickup_date=?, pickup_time=?,delivery_address=?, delivery_date=?, delivery_time=?, delivery_note=?, payment_method=?, payment_status=? WHERE order_id=?";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, order.getCategory());
            stmt.setInt(2, order.getQuantity());
            stmt.setString(3, order.getWashType());
            stmt.setString(4, order.getWashNote());
            stmt.setString(5, order.getPickupAddress());
            stmt.setString(6, order.getPickupDate());
            stmt.setString(7, order.getPickupTime());
            stmt.setString(8, order.getDeliveryAddress());
            stmt.setString(9, order.getDeliveryDate());
            stmt.setString(10, order.getDeliveryTime());
            stmt.setString(11, order.getDeliveryNote());
            stmt.setString(12, order.getPaymentMethod());
            stmt.setString(13, order.getPaymentStatus());
            stmt.setInt(14, order.getId());

            int rows = stmt.executeUpdate();
            updated = (rows > 0);
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return updated;
    }

    // ✅ DELETE ORDER
    public static boolean deleteOrder(int orderId) {
        boolean deleted = false;
        try {
            Connection con = DBconnect.getConnection();
            String sql = "DELETE FROM laundry_management.orders WHERE order_id=?";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, orderId);
            int rows = stmt.executeUpdate();
            deleted = (rows > 0);
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return deleted;
    }

    // ✅ LIST ALL ORDERS
    public static List<Order> getAllOrders() {
        List<Order> orders = new ArrayList<>();
        try {
            Connection con = DBconnect.getConnection();
            String sql = "SELECT * FROM laundry_management.orders ORDER BY created_at DESC";
            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Order order = new Order(
                    rs.getInt("order_id"),
                    rs.getInt("user_id"),
                    rs.getString("category"),
                    rs.getInt("quantity"),
                    rs.getString("wash_type"),
                    rs.getString("wash_note"),
                    rs.getString("pickup_address"),
                    rs.getString("pickup_date"),
                    rs.getString("pickup_time"),
                    rs.getString("delivery_address"),
                    rs.getString("delivery_date"),
                    rs.getString("delivery_time"),
                    rs.getString("delivery_note"),
                    rs.getString("payment_method"),
                    rs.getString("payment_status")
                );
                orders.add(order);
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return orders;
    }
}

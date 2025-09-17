package Delivery;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PaymentService {

    // INSERT NEW PAYMENT
    public static boolean insertPayment(CardPaymentModel payment) {
        boolean isSuccess = false;
        try (Connection con = DBconnect.getConnection()) {
            String sql = "INSERT INTO pay (name, amount, date, status, userID) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement stmt = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, payment.getName());
            stmt.setDouble(2, payment.getAmount());
            stmt.setString(3, payment.getDate());
            stmt.setString(4, payment.getStatus());
            stmt.setString(5, payment.getUserID());
            int rows = stmt.executeUpdate();
            if (rows > 0) {
                ResultSet rs = stmt.getGeneratedKeys();
                if (rs.next()) {
                    payment.setPaymentID(rs.getInt(1));
                }
                isSuccess = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isSuccess;
    }

    // GET ALL PENDING PAYMENTS
    public List<CardPaymentModel> getPendingPayments() {
        List<CardPaymentModel> list = new ArrayList<>();
        try (Connection con = DBconnect.getConnection()) {
            String sql = "SELECT * FROM pay WHERE status = 'pending'";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                CardPaymentModel p = new CardPaymentModel();
                p.setPaymentID(rs.getInt("paymentID"));
                p.setName(rs.getString("name"));
                p.setAmount(rs.getDouble("amount"));
                p.setDate(rs.getString("date"));
                p.setStatus(rs.getString("status"));
                p.setUserID(rs.getString("userID"));
                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // MARK PAYMENT AS COMPLETED
    public void markPaymentAsCompleted(int paymentID) {
        try (Connection con = DBconnect.getConnection()) {
            String sql = "UPDATE pay SET status = 'completed' WHERE paymentID = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, paymentID);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // DELETE PAYMENT
    public void deletePayment(int paymentID) {
        try (Connection con = DBconnect.getConnection()) {
            String sql = "DELETE FROM pay WHERE paymentID = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, paymentID);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // ✅ NEW: GET PAYMENTS BY USER ID
    public List<CardPaymentModel> getPaymentsByUser(String userID) {
        List<CardPaymentModel> list = new ArrayList<>();
        try (Connection con = DBconnect.getConnection()) {
            String sql = "SELECT * FROM pay WHERE userID = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, userID);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                CardPaymentModel p = new CardPaymentModel();
                p.setPaymentID(rs.getInt("paymentID"));
                p.setName(rs.getString("name"));
                p.setAmount(rs.getDouble("amount"));
                p.setDate(rs.getString("date"));
                p.setStatus(rs.getString("status"));
                p.setUserID(rs.getString("userID"));
                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // ✅ NEW: UPDATE PAYMENT NAME FOR A GIVEN PAYMENT ID
    public void updatePaymentName(int paymentID, String newName) {
        try (Connection con = DBconnect.getConnection()) {
            String sql = "UPDATE pay SET name = ? WHERE paymentID = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, newName);
            ps.setInt(2, paymentID);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

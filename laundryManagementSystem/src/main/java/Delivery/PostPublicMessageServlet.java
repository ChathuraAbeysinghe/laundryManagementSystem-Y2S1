package Delivery;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.List;

@WebServlet("/PostPublicMessageServlet")
public class PostPublicMessageServlet extends HttpServlet {
  
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String message = request.getParameter("message");

        if (message == null || message.trim().isEmpty()) {
            request.setAttribute("error", "Message cannot be empty");
            forwardToDashboard(request, response);
            return;
        }

        try (Connection conn = DBconnect.getConnection()) {
            String sql = "INSERT INTO public_messages (message) VALUES (?)";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, message.trim());
                stmt.executeUpdate();
            }

            request.setAttribute("msg", "Public message sent successfully");
            // Fetch staff details and orders again and set them to the request
            List<Staff> staffDetails = getStaffDetails();
            List<OrderAz> orderList = getOrders();
            request.setAttribute("staffDetails", staffDetails);
            request.setAttribute("orderList", orderList);

            forwardToDashboard(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Failed to post message");
            forwardToDashboard(request, response);
        }
    }

    private void forwardToDashboard(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Forward request and response to staff_dashboard.jsp
        request.getRequestDispatcher("/staff_dashboard.jsp").forward(request, response);
    }

    // Example method to get staff details (you should implement this based on your DB logic)
    private List<Staff> getStaffDetails() {
        // Fetch staff details from DB (dummy data for now)
        return List.of(new Staff());
    }

    // Example method to get orders (you should implement this based on your DB logic)
    private List<OrderAz> getOrders() {
        // Fetch orders from DB (dummy data for now)
        return List.of(new OrderAz());
    }
}

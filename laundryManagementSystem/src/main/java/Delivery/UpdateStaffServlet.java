package Delivery;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UpdateStaffServlet extends HttpServlet {
   
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = 0;
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        try {
            // Validate input parameters
            if (username == null || username.isEmpty() || email == null || email.isEmpty() || phone == null || phone.isEmpty()) {
                throw new IllegalArgumentException("All fields are required.");
            }
            
            id = Integer.parseInt(request.getParameter("id"));
            
            try (Connection conn = DBconnect.getConnection()) {
                String sql = "UPDATE users SET username = ?, email = ?, phone = ? WHERE id = ?";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setString(1, username);
                stmt.setString(2, email);
                stmt.setString(3, phone);
                stmt.setInt(4, id);

                int rowsUpdated = stmt.executeUpdate();
                if (rowsUpdated > 0) {
                    // Redirect back to editStaff.jsp with the ID after a successful update
                    response.sendRedirect("editStaff.jsp?id=" + id);
                } else {
                    throw new SQLException("Failed to update staff details.");
                }
            }
        } catch (IllegalArgumentException e) {
            // Handle validation errors
            e.printStackTrace();
            request.setAttribute("errorMessage", e.getMessage());
            request.getRequestDispatcher("editStaff.jsp").forward(request, response);
        } catch (SQLException e) {
            // Handle SQL errors
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
            request.getRequestDispatcher("editStaff.jsp").forward(request, response);
        } catch (Exception e) {
            // Handle any unexpected errors
            e.printStackTrace();
            request.setAttribute("errorMessage", "An unexpected error occurred: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}

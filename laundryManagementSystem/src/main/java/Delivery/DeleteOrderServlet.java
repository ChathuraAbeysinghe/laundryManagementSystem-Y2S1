package Delivery;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/DeleteOrderServlet")
public class DeleteOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("orderId"));
            boolean deleted = OrderDBUtil.deleteOrder(id);

            if (deleted) {
                response.sendRedirect("ListOrderServlet");
            } else {
                request.setAttribute("errorMessage", "Delete failed.");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
        } catch (Exception e) {
            request.setAttribute("errorMessage", "Error deleting order.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}

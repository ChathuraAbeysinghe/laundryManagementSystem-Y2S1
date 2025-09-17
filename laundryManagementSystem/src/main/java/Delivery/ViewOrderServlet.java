package Delivery;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/ViewOrderServlet")
public class ViewOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int orderId = Integer.parseInt(request.getParameter("orderId"));
            Order order = OrderDBUtil.getOrderById(orderId);
            if (order != null) {
                request.setAttribute("order", order);
                request.getRequestDispatcher("viewOrder.jsp").forward(request, response);
            } else {
                request.setAttribute("errorMessage", "Order not found.");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Something went wrong.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}

package Delivery;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/loadUpdateOrder")
public class LoadUpdateOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("orderId"));
        Order order = OrderDBUtil.getOrderById(id);
        if (order != null) {
            request.setAttribute("order", order);
            request.getRequestDispatcher("updateOrder.jsp").forward(request, response);
        } else {
            request.setAttribute("errorMessage", "Order not found");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}

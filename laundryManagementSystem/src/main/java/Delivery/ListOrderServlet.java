package Delivery;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/ListOrderServlet")
public class ListOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Order> orders = OrderDBUtil.getAllOrders();
        request.setAttribute("orders", orders);
        request.getRequestDispatcher("orderList.jsp").forward(request, response);
    }
}

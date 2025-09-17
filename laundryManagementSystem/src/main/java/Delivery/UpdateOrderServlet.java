package Delivery;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/UpdateOrderServlet")
public class UpdateOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Order order = new Order();
            order.setId(Integer.parseInt(request.getParameter("orderId")));
            order.setCategory(request.getParameter("category"));
            order.setQuantity(Integer.parseInt(request.getParameter("quantity")));
            order.setWashType(request.getParameter("washType"));
            order.setWashNote(request.getParameter("washNote"));
            order.setPickupAddress(request.getParameter("pickupAddress"));
            order.setPickupDate(request.getParameter("pickupDate"));
            order.setPickupTime(request.getParameter("pickupTime"));
            order.setDeliveryAddress(request.getParameter("deliveryAddress"));
            order.setDeliveryDate(request.getParameter("deliveryDate"));
            order.setDeliveryTime(request.getParameter("deliveryTime"));
            order.setDeliveryNote(request.getParameter("deliveryNote"));
            order.setPaymentMethod(request.getParameter("paymentMethod"));
            order.setPaymentStatus("Updated");

            boolean success = OrderDBUtil.updateOrder(order);

            if (success) {
                response.sendRedirect("ViewOrderServlet?orderId=" + order.getId());
            } else {
                request.setAttribute("errorMessage", "Update failed.");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
        } catch (Exception e) {
            request.setAttribute("errorMessage", "Error updating order.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}

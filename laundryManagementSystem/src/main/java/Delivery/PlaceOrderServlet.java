package Delivery;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/PlaceOrderServlet")
public class PlaceOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int userId = 1; // Assume session login, or static for now

            Order order = new Order();
            order.setUserId(userId);
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
            order.setPaymentStatus("Pending");

            boolean success = OrderDBUtil.insertOrder(order);

            if (success) {
                request.setAttribute("order", order);
                request.getRequestDispatcher("OrderSuccess.jsp").forward(request, response);
            } else {
                request.setAttribute("errorMessage", "Failed to place order.");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
        } catch (Exception e) {
            request.setAttribute("errorMessage", "Error placing order.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}

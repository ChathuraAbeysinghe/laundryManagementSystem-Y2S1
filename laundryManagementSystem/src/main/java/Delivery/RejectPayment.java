package Delivery;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/RejectPayments")
public class RejectPayment extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int paymentID = Integer.parseInt(request.getParameter("paymentID"));
        PaymentService service = new PaymentService();
        service.deletePayment(paymentID);
        response.sendRedirect("pendingPayments.jsp");
    }
}

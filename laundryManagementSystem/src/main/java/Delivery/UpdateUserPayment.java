package Delivery;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/UpdateUserPayments")
public class UpdateUserPayment extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int paymentID = Integer.parseInt(request.getParameter("paymentID"));
        String newName = request.getParameter("newName");

        PaymentService service = new PaymentService();
        service.updatePaymentName(paymentID, newName);

        response.sendRedirect("userPaymentHistory.jsp?msg=Updated+successfully");
    }
}

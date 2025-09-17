package Delivery;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/DeletePayments")
public class DeletePayment extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int paymentID = Integer.parseInt(request.getParameter("paymentID"));

        PaymentService service = new PaymentService();
        service.deletePayment(paymentID);

        response.sendRedirect("userPaymentHistory.jsp");
    }
}


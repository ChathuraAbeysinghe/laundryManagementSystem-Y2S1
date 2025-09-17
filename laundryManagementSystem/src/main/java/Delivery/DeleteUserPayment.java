package Delivery;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/DeleteUserPayments")
public class DeleteUserPayment extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int paymentID = Integer.parseInt(request.getParameter("paymentID"));

        PaymentService service = new PaymentService();
        service.deletePayment(paymentID);

        response.sendRedirect("userPaymentHistory.jsp?msg=Payment+deleted+successfully");
    }
}

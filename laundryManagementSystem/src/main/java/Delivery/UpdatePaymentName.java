package Delivery;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/UpdatePaymentNames")
public class UpdatePaymentName extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int paymentID = Integer.parseInt(request.getParameter("paymentID"));
        String newName = request.getParameter("name");

        PaymentService service = new PaymentService();
        service.updatePaymentName(paymentID, newName);

        response.sendRedirect("userPaymentHistory.jsp");
    }
}


package Delivery;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/CODServlet")
public class CashOnDeliveryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public CashOnDeliveryServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        double amount = Double.parseDouble(request.getParameter("amount"));

        CardPaymentModel payment = new CardPaymentModel();
        payment.setName(name);
        payment.setAmount(amount);
        payment.setDate(LocalDate.now().toString());
        payment.setStatus("Pending");
        String userID = "0"; // assuming session
        payment.setUserID(userID);


        PaymentService service = new PaymentService();
        service.insertPayment(payment);

        request.setAttribute("message", "Cash on Delivery order placed successfully!");
        RequestDispatcher dispatcher = request.getRequestDispatcher("paymentSuccess.jsp");
        dispatcher.forward(request, response);
    }
}

package Delivery;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import java.io.IOException;
import java.time.LocalDate;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/AddPayment")
public class AddPaymentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AddPaymentServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        CardPaymentModel payment = new CardPaymentModel();

        // Get form data
        payment.setName(request.getParameter("name"));
        payment.setAmount(Double.parseDouble(request.getParameter("amount")));
        payment.setCardNumber(request.getParameter("cardNumber"));
        payment.setExpiryDate(request.getParameter("expiryDate"));
        payment.setCvv(request.getParameter("cvv"));

        // Set current date and default status
        payment.setDate(LocalDate.now().toString());
        payment.setStatus("Completed");
        //String userID = (String) request.getSession().getAttribute("userID"); // assuming session
        String userID = "0";
        payment.setUserID(userID);


        // Save to DB
        PaymentService service = new PaymentService();
        service.insertPayment(payment);

        // Forward to success or home page
        RequestDispatcher dispatcher = request.getRequestDispatcher("paymentSuccess.jsp");
        dispatcher.forward(request, response);
    }
}


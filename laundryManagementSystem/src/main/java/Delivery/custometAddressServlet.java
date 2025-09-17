package Delivery;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/custometAddressServlet")
public class custometAddressServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String customerId = request.getParameter("Cid");

        List<customerModel> customerList = deliverDBUtil.getAddressbtId(customerId);

        response.setContentType("application/json");
        if (!customerList.isEmpty()) {
            response.getWriter().write("{\"address\": \"" + customerList.get(0).getAddress() + "\"}");
        } else {
            response.getWriter().write("{\"address\": \"\"}");
        }
    }
}
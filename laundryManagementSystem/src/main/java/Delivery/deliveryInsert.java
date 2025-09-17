package Delivery;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/deliveryInsert")
public class deliveryInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int CustomerId = Integer.parseInt(request.getParameter("CustomerId"));
        String DeliveryAddress = request.getParameter("DeliveryAddress");
        String DeliveryStatus = request.getParameter("DeliveryStatus");
        String EstimatedDateOfDelivery = request.getParameter("EstimatedDateOfDelivery");
        String EstimatedTimeOfDelivery = request.getParameter("EstimatedTimeOfDelivery");

        
        boolean isTrue;
        
        isTrue = deliverDBUtil.insertDeliver(CustomerId, DeliveryAddress, DeliveryStatus, EstimatedDateOfDelivery, EstimatedTimeOfDelivery);
        
        if(isTrue == true) {
        	String alertMessage = "Data insert Sucessfull";
        	response.getWriter().println("<script> alert('"+alertMessage+"'); window.location.href='show'</script>");
        	//RequestDispatcher dis = request.getRequestDispatcher("deliver_profile.jsp");
        	//dis.forward(request, response);
        }
        else {
        	//RequestDispatcher dis2 = request.getRequestDispatcher("no.jsp");
        	//dis2.forward(request, response);
        	String alertMessage2 = "Data insert Faild";
        	response.getWriter().println("<script> alert('"+alertMessage2+"')</script>");
        }

	
	}

}

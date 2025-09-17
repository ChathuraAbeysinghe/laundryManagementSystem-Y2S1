package Delivery;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/updateStatusServlet")
public class updateStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String CustomerId = request.getParameter("CustomerId");
	    String DeliveryStatus = request.getParameter("DeliveryStatus");
	    String EstimatedDateOfDelivery = request.getParameter("EstimatedDateOfDelivery");
	    String EstimatedTimeOfDelivery = request.getParameter("EstimatedTimeOfDelivery");
	    
	    boolean isTrue;
	  
	    isTrue = deliverDBUtil.updatedata(CustomerId, DeliveryStatus, EstimatedDateOfDelivery, EstimatedTimeOfDelivery);
	    
	    if (isTrue) {
	        List<diliveryModel> delivery = deliverDBUtil.getById(CustomerId);
	        request.setAttribute("delivery", delivery);
	        
	        String alertMessage = "Data update Successful";
	        response.getWriter().println("<script> alert('"+alertMessage+"');window.location.href='showServlet'</script>");
	        
	    } else {
	        String alertMessage2 = "Data update Failed";
	        response.getWriter().println("<script> alert('"+alertMessage2+"');window.location.href='showServlet'</script>");
	    }
	}

	/*protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String CustomerId = request.getParameter("CustomerId");//Integer.parseInt(...............)
		//String CustomerIdstr = Integer.toString(CustomerId);///////////////////////////////////////////////
        String DeliveryStatus = request.getParameter("DeliveryStatus");
        
        boolean isTrue;
        isTrue = deliverDBUtil.updatedata(DeliveryStatus, DeliveryStatus);
        
        if(isTrue == true) {
        	List<diliveryModel> delivery = deliverDBUtil.getById(CustomerId);/////////////////////////////////////
        	request.setAttribute("delivery", delivery);
        	
        	String alertMessage = "Data update Sucessfull";
        	response.getWriter().println("<script> alert('"+alertMessage+"');window.location.href='showServlet'</script>");
        	
        }
        else {
        	String alertMessage2 = "Data update Faild";
        	response.getWriter().println("<script> alert('"+alertMessage2+"')</script>");
        }

	}*/

}

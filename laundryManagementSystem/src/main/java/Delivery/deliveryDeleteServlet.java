package Delivery;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/deliveryDeleteServlet")
public class deliveryDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		
		boolean isTrue;
		
		isTrue = deliverDBUtil.deletedata(id);
		
		if(isTrue == true) {
        	String alertMessage = "Data Delete Sucessfull";
        	response.getWriter().println("<script> alert('"+alertMessage+"');window.location.href='showServlet'</script>");
        	
        }
        else {
        	String alertMessage2 = "Data Delete Faild";
        	response.getWriter().println("<script> alert('"+alertMessage2+"')</script>");
        }
		
	}

}

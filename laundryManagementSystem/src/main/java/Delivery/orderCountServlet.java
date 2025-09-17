package Delivery;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/orderCountServlet")
public class orderCountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		Map<String, Integer> count = deliverDBUtil.getOrderStatusCounts();
		request.setAttribute("count", count);
		
		request.getRequestDispatcher("deliver_profile.jsp").forward(request, response);
		

	}

}

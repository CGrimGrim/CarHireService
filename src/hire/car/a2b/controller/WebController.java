package hire.car.a2b.controller;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hire.car.a2b.service.*;

import java.util.ArrayList;

import hire.car.a2b.*;

/**
 * Servlet implementation class WebController
 */
@WebServlet("/Controller")
public class WebController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	IHireService srv = null;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WebController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		srv = new HireService();
	}

	/**
	 * @see Servlet#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int code = Integer.parseInt(request.getParameter("code"));
		switch(code){
		case 1:
			break;
		case 2:
			getAvailableVehicles(request, response);
			response.sendRedirect("available.jsp");
			break;
		case 3:
			getUnavailableVehicles(request, response);
			response.sendRedirect("available.jsp");
			break;
		default:
			break;
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	
	
	public void getAvailableVehicles(HttpServletRequest request, HttpServletResponse response){
		ArrayList<Car> availableCars = srv.listAllAvailableCars();
		HttpSession session = request.getSession(true);
		if(session.getAttribute("UnavailableCars") != null){
			session.removeAttribute("UnavailableCars");
		}
		session.setAttribute("AvailableCars", availableCars);
	}
	
	public void getUnavailableVehicles(HttpServletRequest request, HttpServletResponse response){
		ArrayList<Car> unavailableCars = srv.listAllCarsOnHire();
		HttpSession session = request.getSession(true);
		if(session.getAttribute("AvailableCars") != null){
			session.removeAttribute("AvailableCars");
		}
		session.setAttribute("UnavailableCars", unavailableCars);
	}

}

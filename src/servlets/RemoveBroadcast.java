package servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.AdminManager;
import dao.AdminDao;
import dao.BroadcastDao;
import pojos.Broadcast;
import pojos.User;

@WebServlet("/removeBroadcast")
public class RemoveBroadcast extends HttpServlet {


	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			User admin = (User) request.getSession().getAttribute("admin");
			
			int broadcastId = Integer.parseInt(request.getParameter("broadcastSelect"));
			
			Broadcast broadcastToDelete = BroadcastDao.getInstance().getBroadcastById(broadcastId);
			AdminManager.getInstance().removeBroadcast(broadcastToDelete, admin);
			request.getRequestDispatcher("adminMain.jsp").forward(request, response);
		} catch (Exception e) {
			request.setAttribute("exception", e);
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}

	}


}

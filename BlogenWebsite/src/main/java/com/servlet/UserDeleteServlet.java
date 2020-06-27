package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Users;
import com.helper.FactoryProvider;


public class UserDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public UserDeleteServlet() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int userId=Integer.parseInt(request.getParameter("userId").trim());
			System.out.println("User id is "+userId);
			Session session=FactoryProvider.getFactory().openSession();
			Transaction tx=session.beginTransaction();
			Users users=session.get(Users.class, userId);
			session.delete(users);
			tx.commit();
			response.sendRedirect("users.jsp");
		} catch (Exception e) {
			// TODO: handle exception
		}

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}

package com.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Users;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	boolean flag=false;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			try {
				
				
//				email and password Fetching from form...
				
				String email=request.getParameter("email");
				String password=request.getParameter("password");
				
			
				
				
//				hibernate Fetching data from db
				Session session =FactoryProvider.getFactory().openSession();
				Query q=session.createQuery("from Users");
				
				List<Users> list=q.list();
				for(Users users:list) {
					
					if(users.getEmail().equals(email)&&users.getPassword().equals(password)) {
						
//						creating cookies
						Cookie c=new Cookie("uName",users.getName());
						response.addCookie(c);
						flag=true;
						response.sendRedirect("dashboard.jsp");
						
						
					} 
					
				}
				if(flag==false) {
					response.sendRedirect("login.jsp");
//					print wrong email and password
				}
				
				
				
				
		
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}

	
	}

}

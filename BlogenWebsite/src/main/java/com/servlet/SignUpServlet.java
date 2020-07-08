package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Users;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class SignUpServlet
 */
public class SignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String userName;
	private String userEmail;
	private String password;
	private String cpassword;
       
    
    public SignUpServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			PrintWriter out=response.getWriter();
			
//			email and password Fetching from form...
			userName=request.getParameter("userName");
			userEmail=request.getParameter("userEmail");
			password=request.getParameter("password");
			cpassword=request.getParameter("cPassword");
			
			
			if(cpassword.equals(password))	{
				Users users=new Users(userName,userEmail,password,cpassword);
//				hibernate Save to db
				Session session=FactoryProvider.getFactory().openSession();
				Transaction tx=session.beginTransaction();
				session.save(users);
				tx.commit();
				session.close();
				response.sendRedirect("login.jsp");
			}		
			
			else
			{
				
//				password and confirm password does not match
				response.sendRedirect("index.jsp");
			
			}		
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}

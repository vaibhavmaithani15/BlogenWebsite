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


public class AddUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String userName;
	private String userEmail;
	private String userPassword;
	private String cuserPassword;
       
    
    public AddUserServlet() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//Fetchng data from form
		try {
			
			userName=request.getParameter("uname");
			userEmail=request.getParameter("uemail");
			userPassword=request.getParameter("upasssword");
			cuserPassword=request.getParameter("ucpassword");
			
			System.out.println("User Name is "+userName);
			System.out.println("User Email is "+userEmail);
			System.out.println("User Password is "+userPassword);
			System.out.println("User confirm Password is "+cuserPassword);
			
			
//			Creating object 
			if(userPassword.equals(cuserPassword)) {
				Users users=new Users(userName,userEmail,userPassword,cuserPassword);
//				hibernate save to db
				Session session=FactoryProvider.getFactory().openSession();
				Transaction tx=session.beginTransaction();
				session.save(users);
				tx.commit();
				response.sendRedirect("dashboard.jsp");	
			}
			else {
				
//				when confirm password and password is not same
				response.sendRedirect("dashboard.jsp");
			}
				
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		
		
		
	}

}

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


public class UserUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private String uName;
    private String uEmail;
    private String uPassword;
    private String ucPassword;
   
    public UserUpdateServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
			
//			Fetching data from form 
			uName=request.getParameter("name");
			uEmail=request.getParameter("email");
			uPassword=request.getParameter("password1");
			ucPassword=request.getParameter("cpassword1");
			
			int userId=Integer.parseInt(request.getParameter("userId").trim());
			
			System.out.println("User Name is "+uName);
			System.out.println("User Email is "+uEmail);
			System.out.println("User Password is "+uPassword);
			System.out.println("User Cpassword is "+ucPassword);
			System.out.println("User Id is "+userId);
			
			
			if(uPassword.equals(ucPassword)) {
				Users users=new Users(uName, uEmail,uPassword,ucPassword);
				users.setId(userId);
				
				Session session=FactoryProvider.getFactory().openSession();
				Transaction tx=session.beginTransaction();
				session.update(users);
				tx.commit();
				session.close();
				response.sendRedirect("users.jsp");	
			}else {
				
				//show error message password and confirm password is not same
//				response.sendRedirect("usersdetails.jsp?name=");
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}

}

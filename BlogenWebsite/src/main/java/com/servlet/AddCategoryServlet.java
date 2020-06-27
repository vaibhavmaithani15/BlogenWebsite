package com.servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Category;
import com.helper.FactoryProvider;


public class AddCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String categoryTitle;
	private Date categoryDate;
	
       
    
    public AddCategoryServlet() {
        super();
     
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		Fetching data from form\
		
		try {
			
			categoryTitle=request.getParameter("categoryTitle");
			categoryDate=new Date();
			System.out.println("category name is "+categoryTitle);
			
			
//			Creating object
			Category category=new Category(categoryTitle,categoryDate);
			
			
//			hibernate save to db
			Session session=FactoryProvider.getFactory().openSession();
			Transaction tx=session.beginTransaction();
			session.save(category);
			tx.commit();
			session.close();
			response.sendRedirect("dashboard.jsp");

			
		} catch (Exception e) {
			e.printStackTrace();
		}
				
	}

}

package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Category;
import com.helper.FactoryProvider;


public class CategoryDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public CategoryDeleteServlet() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			int categoryId=Integer.parseInt(request.getParameter("categoryId").trim());
			System.out.println("Category id is "+categoryId);
			Session session=FactoryProvider.getFactory().openSession();
			Transaction tx=session.beginTransaction();
			Category category=session.get(Category.class, categoryId);
			session.delete(category);
			tx.commit();
			response.sendRedirect("categories.jsp");
		} catch (Exception e) {
			// TODO: handle exception
		}

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}

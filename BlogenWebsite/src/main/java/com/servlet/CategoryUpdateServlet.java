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

public class CategoryUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String categoryTitle;
	private Date categoryDate;
	

	public CategoryUpdateServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
//			Fetching data from form
			categoryTitle=request.getParameter("categoryTitle");
			categoryDate=new Date();
			int categoryId=Integer.parseInt(request.getParameter("categoryId").trim());
			
			
			System.out.println("category Id "+categoryId);
			System.out.println("category title "+categoryTitle);
			Category category=new Category(categoryTitle,categoryDate);
			category.setId(categoryId);
			
			Session session=FactoryProvider.getFactory().openSession();
			Transaction tx=session.beginTransaction();
			session.update(category);
			tx.commit();
			session.close();
			response.sendRedirect("categories.jsp");
			
			

		} catch (Exception e) {
			// TODO: handle exception
		}

	}

}

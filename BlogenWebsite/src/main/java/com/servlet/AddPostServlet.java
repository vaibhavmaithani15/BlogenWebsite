package com.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Posts;
import com.helper.FactoryProvider;

@MultipartConfig
public class AddPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String title;
	 private String category;
	 private String body;
//	 private static int count;

	private Date date;
	private String fileName;

	public AddPostServlet() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			PrintWriter out=response.getWriter();
			
			
			
//			Fetching data from form
			title=request.getParameter("title");
			if(request.getParameter("points")!=null) {
				category=request.getParameter("points");
			}
			date=new Date();
			
			body=request.getParameter("editor1");
			System.out.println("Body of the text is here "+body);
			System.out.println("category of the text is here "+category);
			System.out.println("title of the text here "+title);
		
			Part part=request.getPart("image");
			fileName=part.getSubmittedFileName();
			if(fileName.isEmpty()) {
				Posts posts=new Posts(title,category,body,date,fileName);
				Session session =FactoryProvider.getFactory().openSession();
				Transaction tx=session.beginTransaction();
				session.save(posts);
				tx.commit();
				session.close();
				
			}else {
				Posts posts=new  Posts(title,category,body,date, fileName);
				
				
//				Reading image
				InputStream is=part.getInputStream();
				byte[] data=new byte[is.available()];
				is.read(data);
				
//				creating path for the file to store
				String path=request.getRealPath("/")+"img"+File.separator+fileName;
				System.out.println(path);
				
//				Writing file to the path
				FileOutputStream fos=new FileOutputStream(path);
				fos.write(data);
				fos.close();
				
				Session session =FactoryProvider.getFactory().openSession();
				Transaction tx=session.beginTransaction();
				session.save(posts);
			
				tx.commit();
				session.close();
			}
//			hibernate Save to db
			
			//count++;
			
			response.sendRedirect("dashboard.jsp");
//			System.out.println(fileName);
//			Creating post object
				
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}

}

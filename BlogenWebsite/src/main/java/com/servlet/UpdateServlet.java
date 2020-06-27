package com.servlet;

import java.io.File;
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
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      private String title;
      private String category;
      private String body;
  	  private Date date;
  	  private String fileName;
  	  private String fileName1;
    
    public UpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		try {
		       PrintWriter out=response.getWriter();
				
//				Fetching data from form 
				title=request.getParameter("title1");
				if(request.getParameter("points1")!=null) {
					category=request.getParameter("points1");
				}
				date=new Date();
				body=request.getParameter("editor1").trim();
				Part part=request.getPart("image1");
				fileName=part.getSubmittedFileName();
				
				int postId=Integer.parseInt(request.getParameter("id").trim());
				
				
//				printing value for testing
				System.out.println("Post title is "+title);
				System.out.println("Post category is"+category);
				System.out.println("Post body is "+body);
				System.out.println("Post date is "+date);
				//System.out.println("Post file name is "+fileName);
				System.out.println("Post id is "+postId);
				
				
				
//				Setting value for the data base;
				if(fileName.isEmpty()) {
					fileName=request.getParameter("imageName");
					
				}else {
//					Reading Image
					InputStream is=part.getInputStream();
					byte[] data=new byte[is.available()];
					is.read(data);
					
					
//					creating path for the file to store
					String path=request.getRealPath("/")+"img"+File.separator+fileName;
					System.out.println(path);
					
//					Writing file to the path
					FileOutputStream fos=new FileOutputStream(path);
					fos.write(data);
					fos.close();
				}
				System.out.println("Post file name is "+fileName);
					Posts posts=new Posts(title,category,body,date,fileName);
					posts.setId(postId);//id should already know by the developer
					

					
					Session session=FactoryProvider.getFactory().openSession();
					Transaction tx=session.beginTransaction();
					session.update(posts);
					tx.commit();
					session.close();
				    response.sendRedirect("dashboard.jsp");
					
					
				
				}catch (Exception e) {
					// TODO: handle exception
				}
			
			 
			
			
			 
			

		
	}

}



<!DOCTYPE html>
<%@page import="com.entities.Users"%>
<%@page import="com.entities.Category"%>
<%@page import="org.hibernate.Query"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.entities.Posts"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <link
      rel="stylesheet"
      href="https://use.fontawesome.com/releases/v5.0.13/css/all.css"
      integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp"
      crossorigin="anonymous"
    />
    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
      integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="css/style.css" />
    <title>Bootstrap Theme</title>
  </head>

  <body>
    <!-- START HERE -->
    <%@include file="navbar.jsp" %>

    <!-- Header -->
    <header id="main-header" class="py-2 bg-primary text-white">
      <div class="container">
        <div class="row">
          <div class="col-md-6">
            <h1><i class="fas fa-cog"></i> Dashboard</h1>
          </div>
        </div>
      </div>
    </header>

    <!-- Actions -->

    <section id="actions" class="py-4 mb-4 bg-light">
      <div class="container">
        <div class="row">
          <div class="col-md-3">
            <a
              href="index.html"
              class="btn btn-primary btn-block"
              data-toggle="modal"
              data-target="#addPostModal"
            >
              <i class="fas fa-plus"></i> Add Post
            </a>
          </div>
          <div class="col-md-3">
            <a
              href="index.html"
              class="btn btn-success btn-block"
              data-toggle="modal"
              data-target="#addCategoryModal"
            >
              <i class="fas fa-plus"></i> Add Category
            </a>
          </div>
          <div class="col-md-3">
            <a
              href="index.html"
              class="btn btn-warning btn-block"
              data-toggle="modal"
              data-target="#addUserModal"
            >
              <i class="fas fa-plus"></i> Add User
            </a>
          </div>
        </div>
      </div>
    </section>

    <!-- Posts -->
	<%!
	int count;
	int count1;
	int count2;
	%>
	<%
	Session s1=FactoryProvider.getFactory().openSession();
	Query q1=s1.createQuery("from Category");
	List<Category> list1=q1.list();
	count1=list1.size();
	
	
	
	Session s2= FactoryProvider.getFactory().openSession();
	Query q2=s2.createQuery("from Users");
	List<Users> list2=q2.list();
	count2=list2.size();
	%>
    <section id="posts">
      <div class="container">
        <div class="row">
          <div class="col-md-9">
            <div class="card">
              <div class="card-header">
                <h4>Lastest Posts</h4>
              </div>
              <table class="table table-striped">
                <thead class="thead-dark">
                  <tr>
                    <th>#</th>
                    <th>Title</th>
                    <th>Category</th>
                    <th>Date</th>
                    <th></th>
                  </tr>
                 
                <% 
                    Session s=FactoryProvider.getFactory().openSession();
					Query q= s.createQuery("from Posts");
  					 List<Posts> list=q.list();
  					 count=list.size();
   					 for(Posts post:list){
   				%>
                </thead>
                <tbody>
                  <tr>
                    <td><%=post.getId() %></td>
                    <td><%=post.getTitle() %></td>
                    <td><%=post.getCategory() %></td>
                    <td><%=post.getAddedDate() %></td>
                    <td>
                      <a href="details.jsp?id=<%=post.getId() %>&fileName=<%=post.getImage() %>" class="btn btn-secondary">
                        <i class="fas fa-angle-double-right"></i> Detials
                      </a>
                    </td>
                  </tr>
                </tbody>
                <%
               
   					 }
   					 s.close();
               %>
              </table>
            </div>
          </div>
          <div class="col-md-3">
            <div class="card text-center bg-primary text-white mb-3">
              <div class="card-body">
                <h3>Posts</h3>
                <h4 class="display-4"><i class="fas fa-pencil-alt"></i> <%= count %></h4>
                <a href="posts.jsp" class="btn btn-outline-light btn-sn"
                  >View</a
                >
              </div>
            </div>
            <div class="card text-center bg-success text-white mb-3">
              <div class="card-body">
                <h3>Categories</h3>
                <h4 class="display-4"><i class="fas fa-folder"></i> <%=count1 %></h4>
                <a href="categories.jsp" class="btn btn-outline-light btn-sn"
                  >View</a
                >
              </div>
            </div>
            <div class="card text-center bg-warning text-white mb-3">
              <div class="card-body">
                <h3>Users</h3>
                <h4 class="display-4"><i class="fas fa-users"></i> <%= count2 %></h4>
                <a href="users.jsp" class="btn btn-outline-light btn-sn"
                  >View</a
                >
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Footer -->
    <footer id="main-footer" class="bg-dark text-white mt-5 p-5">
      <div class="container">
        <div class="row">
          <div class="col">
            <p class="lead text-center">
              copyright &copy; <span id="year"></span>
              Blogen
            </p>
          </div>
        </div>
      </div>
    </footer>

    <!-- Modals -->

    <!-- Add post Modal -->
  
    
    <div class="modal fade" id="addPostModal">
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <div class="modal-header bg-primary text-white">
            <h5 class="modal-title">Add Post</h5>
            <button class="close" data-dismiss="modal">
              <span>&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <form enctype='multipart/form-data' id="myform" role="form" method="POST" action="AddPostServlet">
              <div class="form-group">
                <label for="title">Title</label>
                <input type="text" class="form-control" name="title" />
              </div>
              <div class="form-group">
                <label  for="points">Category</label>
                <select name="points" class="form-control">
                <%
                		for(Category category:list1){
                %>
                  <option value="<%= category.getTitle()%>"><%= category.getTitle() %></option>
                
                 <%
               
   					 }
   					 s.close();
               %>
               </select>
              </div>
              <div class="form-group">
                <label for="image">Upload Image</label>
                <div class="custom-file">
                  <input type="file" class="custom-file-input" id="image" name="image" />
                  <label for="image" class="custom-file-label"
                    >Choose File</label
                  >
                </div>
                <small class="form-text text-muted">Max Size 3mb</small>
              </div>
              <div class="form-group">
                <label  for="editor1"></label>
                <textarea  name="editor1" class="form-control"></textarea>
              </div>
               <div class="form-group">
            <div>
            <button type="submit" class="btn btn-primary">Save Data</button>
            </div>
          </div>        
            </form>
          </div>
          
          
             
   
        </div>
      </div>
    </div>

    <!-- Add Category Modal -->

    <div class="modal fade" id="addCategoryModal">
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <div class="modal-header bg-success text-white">
            <h5 class="modal-title">Add Category</h5>
            <button class="close" data-dismiss="modal">
              <span>&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <form id="myform"  role="form" action="AddCategoryServlet" method="POST">
              <div class="form-group">
                <label for="title">Title</label>
                <input type="text" class="form-control" name="categoryTitle" />
              </div>
              <div>
            <button type="submit" class="btn btn-success"> Save Changes</button>
          </div>
            </form>
          </div>
          
        </div>
      </div>
    </div>

    <!-- Add User Modal -->
    <div class="modal fade" id="addUserModal">
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <div class="modal-header bg-warning text-white">
            <h5 class="modal-title">Add User</h5>
            <button class="close" data-dismiss="modal">
              <span>&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <form id="myform2" action="AddUserServlet" method="POST" >
              <div class="form-group">
                <label for="uname">Name</label>
                <input name="uname" type="text" class="form-control" />
              </div>
              <div class="form-group">
                <label for="uemail">Email</label>
                <input name="uemail" type="email" class="form-control" />
              </div>
              <div class="form-group">
                <label for="upassword">Password</label>
                <input name="upasssword" type="password" class="form-control" />
              </div>
              <div class="form-group">
                <label for="ucpassword">Confirm Password</label>
                <input name="ucpassword" type="password" class="form-control" />
              </div>
              <div>
                <button type="submit" class="btn btn-warning">Save Changes</button>
              </div>
              
            </form>
          </div>
          
          
          
        </div>
      </div>
    </div>
    <script
    
    
      src="http://code.jquery.com/jquery-3.3.1.min.js"
      integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
      integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
      integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
      crossorigin="anonymous"
    ></script>
    <script src="https://cdn.ckeditor.com/4.9.2/standard/ckeditor.js"></script>

<script>
            $('#image').on('change',function(){
                //get the file name
                var fileName = $(this).val();
                //replace the "Choose a file" label
                $(this).next('.custom-file-label').html(fileName);
            })
        </script>
    <script>
      // Get the current year for the copyright
      $('#year').text(new Date().getFullYear());
    </script>
    <script>
      CKEDITOR.replace('editor1');
    </script>
    
    <script>
        $(document).ready(function () {
            console.log("page is ready...");
            $("#myform").on('submit', function (event) {
//                var f = $(this).serialize();
                  let f=new FormData(this);
                console.log(f);
            })
        });
    </script>
  </body>
</html>

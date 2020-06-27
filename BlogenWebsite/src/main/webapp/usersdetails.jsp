<!DOCTYPE html>
<%@page import="com.entities.Category"%>
<%@page import="com.entities.Users"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
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
    <header id="main-header" class="py-2 bg-warning text-white">
      <div class="container">
        <div class="row">
          <div class="col-md-6">
            <h1>User</h1>
          </div>
        </div>
      </div>
    </header>

    <!-- Actions -->

    <section id="actions" class="py-4 mb-4 bg-light">
      <div class="container">
        <div class="row">
          <div class="col-md-3">
            <a href="dashboard.jsp" class="btn btn-light btn-block">
              <i class="fas fa-arrow-left"></i> Back To Dashboard
            </a>
          </div>
          <div class="col-md-3">
            <button form="myform" class="btn btn-success btn-block">
              <i class="fas fa-check"></i> Save Changes
            </button>
          </div>
          <div class="col-md-3">
            <button form="myform1" class="btn btn-danger btn-block">
              <i class="fas fa-trash"></i> Delete Post
            </button>
          </div>
        </div>
      </div>
    </section>

    <!-- Details -->
    <%
    int userId=Integer.parseInt(request.getParameter("userId").trim());
    System.out.println("USER ID "+userId);
    Session s=FactoryProvider.getFactory().openSession();
    Users user=(Users)s.get(Users.class, userId);
    %>

    <section id="details">
      <div class="container">
       <div class="col">
           <div class="card">
               <div class="card-header">
                   <h4>Edit User</h4>
               </div>
               <div class="card-body">
                   <form id="myform" action="UserUpdateServlet" method="POST">
                   
                   <input type="hidden" name="userId" class="form-control" value="<%= user.getId()%>">
                    <div class="form-group">
                        <label for="name">Name</label>
                        <input name="name" type="text" class="form-control" value="<%= user.getName() %>" />
                    </div>
                    
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input name="email" type="email" class="form-control" value="<%= user.getEmail() %>" />
                    </div>
                    
                    <div class="form-group">
                        <label for="password1">Password</label>
                        <input name="password1" type="password" class="form-control" value="<%=user.getPassword() %>" />
                    </div>
                    
                    <div class="form-group">
                        <label for="cpassword1">Confirm Password</label>
                        <input name="cpassword1" type="password" class="form-control" value="<%= user.getCpassword() %>" />
                    </div>
                   </form>
               </div>
           </div>
       </div>
        </div>
    </section>
    <form id="myform1" action="UserDeleteServlet" method="GET">
    	<input type="hidden" name="userId" type="text" class="form-control" value="<%=user.getId()%>">
    </form>

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
            <form>
              <div class="form-group">
                <label for="title">Title</label>
                <input type="text" class="form-control" />
              </div>
              <div class="form-group">
                <label for="category">Category</label>
                <select class="form-control">
                  <option value="" >Web Development</option>
                  <option value="">Tech Gadgets</option>
                  <option value="">Business</option>
                  <option value="">Health & Wellness</option>
                </select>
              </div>
              <div class="form-group">
                <label for="image">Upload Image</label>
                <div class="custom-file">
                  <input type="file" class="custom-file-input" id="image" />
                  <label for="image" class="custom-file-label"
                    >Choose File</label
                  >
                </div>
                <small class="form-text text-muted">Max Size 3mb</small>
              </div>
              <div class="form-group">
                <label for="body">Body</label>
                <textarea name="editor1" class="form-control"></textarea>
              </div>
            </form>
          </div>
          <div class="modal-footer">
            <button class="btn btn-primary" data-dismiss="modal">
              Save Changes
            </button>
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
            <form>
              <div class="form-group">
                <label for="title">Title</label>
                <input type="text" class="form-control" />
              </div>
            </form>
          </div>
          <div class="modal-footer">
            <button class="btn btn-success" data-dismiss="modal">
              Save Changes
            </button>
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
            <form>
              <div class="form-group">
                <label for="name">Name</label>
                <input type="text" class="form-control" />
              </div>
              <div class="form-group">
                <label for="email">Email</label>
                <input type="email" class="form-control" />
              </div>
              <div class="form-group">
                <label for="password">Password</label>
                <input type="password" class="form-control" />
              </div>
              <div class="form-group">
                <label for="password2">Confirm Password</label>
                <input type="password" class="form-control" />
              </div>
            </form>
          </div>
          <div class="modal-footer">
            <button class="btn btn-warning" data-dismiss="modal">
              Save Changes
            </button>
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
      // Get the current year for the copyright
      $('#year').text(new Date().getFullYear());
    </script>
    <script>
      CKEDITOR.replace('editor1');
    </script>
  </body>
</html>

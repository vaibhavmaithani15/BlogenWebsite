<!DOCTYPE html>
<%@page import="com.entities.Posts"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
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
    <title>Posts</title>
  </head>

  <body>
    <!-- START HERE -->
 <%@include file="navbar.jsp" %>

    <!-- Header -->
    <header id="main-header" class="py-2 bg-primary text-white">
      <div class="container">
        <div class="row">
          <div class="col-md-6">
            <h1><i class="fas fa-pencil-alt"></i> Posts</h1>
          </div>
        </div>
      </div>
    </header>

    <!-- Search -->

    <section id="search" class="py-4 mb-4 bg-light">
      <div class="container">
        <div class="row">
          <div class="col-md-6 ml-auto">
            <div class="input-group">
              <input
                type="text"
                class="form-control"
                placeholder="Search Posts..."
              />
              <div class="input-group-append">
                <buton class="btn btn-primary">Search</buton>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Posts -->

    <section id="posts">
      <div class="container">
        <div class="row">
          <div class="col">
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
                    Session s= FactoryProvider.getFactory().openSession();
					Query q=s.createQuery("from Posts");
					List<Posts> list=q.list();
  					 
   					 for(Posts post:list){
   						
   				%>
       
                </thead>
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

              <!-- Pagination -->

              <nav class="ml-4">
                <ul class="pagination">
                  <li class="page-item disabled">
                    <a href="#" class="page-link">Previous</a>
                  </li>
                  <li class="page-item active">
                    <a href="#" class="page-link">1</a>
                  </li>
                  <li class="page-item">
                    <a href="#" class="page-link">2</a>
                  </li>
                  <li class="page-item">
                    <a href="#" class="page-link">3</a>
                  </li>
                  <li class="page-item">
                    <a href="#" class="page-link">Next</a>
                  </li>
                </ul>
              </nav>
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

    <script>
      // Get the current year for the copyright
      $('#year').text(new Date().getFullYear());
    </script>
  </body>
</html>

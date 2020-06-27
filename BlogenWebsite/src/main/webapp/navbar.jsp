<%@page import="java.util.List"%>
<%@page import="com.entities.Users"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<nav class="navbar navbar-expand-sm navbar-dark bg-dark p-0">
      <div class="container">
        <a href="dashboard.jsp" class="navbar-brand">Blogen</a>
        <button
          class="navbar-toggler"
          data-toggle="collapse"
          data-target="#navbarCollapse"
        >
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
          <ul class="navbar-nav">
            <li class="nav-item px-2">
              <a href="dashboard.jsp" class="nav-link">Dashboard</a>
            </li>
            <li class="nav-item px-2">
              <a href="posts.jsp" class="nav-link">Posts</a>
            </li>
            <li class="nav-item px-2">
              <a href="categories.jsp" class="nav-link">Categories</a>
            </li>
            <li class="nav-item px-2">
              <a href="users.jsp" class="nav-link">Users</a>
            </li>
          </ul>

          <ul class="navbar-nav ml-auto">
            <li class="nav-item dropdown mr-3">
              <a
                href="#"
                class="nav-link dropdown-toggle"
                data-toggle="dropdown"
              >
              <%!
              String userName;
              String tuserName;
              Cookie[] cookies;
              %>
              <%
              cookies=request.getCookies();
              
              if(cookies!=null){
            	  
            	  for(Cookie c:cookies){
            		  tuserName=c.getName();
            		  if(tuserName.equals("uName")){
            			  userName=c.getValue();
            			  System.out.println("USER NAME IS "+userName);
            		  }
            	  }
                  
              }else{
            	  System.out.println("USER IS NULL");
              }
             
              %>
                <i class="fas fa-user"></i> <%=userName %>
              </a>
              <div class="dropdown-menu">
                <a href="profile.html" class="dropdown-item"
                  ><i class="fas fa-user-circle"></i> Profile</a
                >
                <a href="settings.html" class="dropdown-item"
                  ><i class="fas fa-cog"></i> Settings</a
                >
              </div>
            </li>
            <li class="nav-item">
              <a href="login.jsp" class="nav-link">
                <i class="fas fa-user-times"></i> Logout
              </a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
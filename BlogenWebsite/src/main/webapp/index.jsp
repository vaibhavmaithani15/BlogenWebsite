<!DOCTYPE html>

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
    <style>
    body{
	background:#343a40;
	}
	
#main-header1 .fas{
  color: #008ed6;
  background: #fff;
  padding: 5px;
  border-radius: 5px;
}

    
    </style>
    <title>Posts</title>
  </head>

  <body>
    <!-- START HERE -->
    <nav class="navbar navbar-expand-sm navbar-dark bg-dark p-0">
      <div class="container">
        <a href="index.html" class="navbar-brand">Blogen</a>
      </div>
    </nav>

    <!-- Header -->
    
      
      
  
    
    
    <!-- HOME SECTION -->
  <header id="main-header1" class="py-2 bg-secondary text-white">
      <div  class="container">
          <div class="row">
            <div class="col-lg-8 d-none d-lg-block">
              <h1 class="display-4">
                Build <strong>social profiles</strong> and gain revenue
                <strong>profits</strong>
              </h1>
              <div class="d-flex">
                <div class="p-4 align-self-start">
                  <i class="fas fa-check fa-2x"></i>
                </div>
                <div class="p-4 align-self-end">
                  Lorem ipsum dolor sit, amet consectetur adipisicing elit. Sed,
                  tempore iusto in minima facere dolorem!
                </div>
              </div>

              <div class="d-flex">
                <div class="p-4 align-self-start">
                  <i class="fas fa-check fa-2x"></i>
                </div>
                <div class="p-4 align-self-end">
                  Lorem ipsum dolor sit, amet consectetur adipisicing elit. Sed,
                  tempore iusto in minima facere dolorem!
                </div>
              </div>

              <div class="d-flex">
                <div class="p-4 align-self-start">
                  <i class="fas fa-check fa-2x"></i>
                </div>
                <div class="p-4 align-self-end">
                  Lorem ipsum dolor sit, amet consectetur adipisicing elit. Sed,
                  tempore iusto in minima facere dolorem!
                </div>
              </div>
            </div>

            <div class="col-lg-4">
              <div class="card bg-primary text-center card-form">
              
                <div class="card-body">
                  <h3>Sign Up Today</h3>
                  <p>Please fill out this form to register</p>
                  <form action="SignUpServlet" method="POST">
                    <div class="form-group">
                      <input
                      	required
                      	name="userName"
                        type="text"
                        class="form-control form-control-lg"
                        placeholder="Full Name"
                      />
                    </div>
                    <div class="form-group">
                      <input
                      	required
                        name="userEmail"
                        type="email"
                        class="form-control form-control-lg"
                        placeholder="Email"
                      />
                    </div>
                    <div class="form-group">
                      <input
                      	required
                      	name="password"
                        type="password"
                        class="form-control form-control-lg"
                        placeholder="Password"
                      />
                    </div>
                    <div class="form-group">
                      <input
                        required
                      	name="cPassword"
                        type="password"
                        class="form-control form-control-lg"
                        placeholder="Confirm Password"
                      />
                    </div>
                    <input
                      type="submit"
                      value="Submit"
                      class="btn btn-outline-light btn-block"
                    />    
                    <input
                      form="mform"
                      type="submit"
                      value="Already Registered"
                      class="btn btn-outline-light btn-block"
                    />         
                  </form>
                  
                </div>
               
            </div>
          </div>
       </div>
       <form id="mform" action="login.jsp"></form>
    </header>

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
    
    




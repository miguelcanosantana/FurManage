<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import = "java.io.*,java.util.*" %>
<%-- For Encryption --%>
<%@page import="javax.xml.bind.DatatypeConverter"%>
<%@page import="java.security.MessageDigest"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <!--Bootstrap-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        
    <!-- Custom -->
    <link rel="stylesheet" type="text/css" href="../css/main.css">
    <link rel="shortcut icon" href="../img/favicon.ico" type="image/x-icon">
    
    <title>FurManage - Options</title>
  </head>
  <body>
    
      <%
        //For UTF8 characters
        request.setCharacterEncoding("UTF-8");
        
        Class.forName("com.mysql.jdbc.Driver");
        Connection conect = DriverManager.getConnection("jdbc:mysql://localhost:3306/furmanage","root", "");
        Statement s = conect.createStatement();
        
      %>
      <br>
      <br>
      <br>
      <!-- NavBar (with users search) -->
      <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
        <img src="../img/favicon.ico">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
              <a href="http://localhost:8080/FurManage/jsp_pages/mainpage.jsp" class="btn btn-primary" role="button">Users</a>
            </li>
            <li class="nav-item">
              <a href="http://localhost:8080/FurManage/jsp_pages/fursonas.jsp" class="btn btn-primary" role="button">Fursonas</a>
            </li>
            <li class="nav-item">
              <a href="http://localhost:8080/FurManage/jsp_pages/control_panel.jsp" class="btn btn-warning" role="button">⚙</a>
            </li>
            
          </ul>
          <form form method="get" action="mainpage_search.jsp" class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" name="searchText" placeholder="Search User" aria-label="Search">
            <button class="btn btn-primary my-2 my-sm-0" type="submit">🔎</button>
          </form>
          <a href="http://localhost:8080/FurManage/index.jsp" class="btn btn-danger" role="button">Close Session</a>
        </div>
      </nav>
      
      
    <!-- Options-->
    <br>
    <br>
    <div class="container">
      <div class="row">
        <!--
        <div class="col-12 col-md-6 col-lg-4">
          
            Card
            <div class="card text-white bg-dark" style="width: auto;">
              <img src="https://raw.githubusercontent.com/miguelcanosantana/FurManage/master/FurManage/web/img/user_logo.png" class="card-img-top" alt="Paisaje">
              <div class="card-body">
                <h5 class="card-title">Modify User</h5>
                <p class="card-text">Here you can modify your user after being created.</p>
                <a href="http://localhost:8080/FurManage/jsp_pages/modify_user.jsp" class="btn btn-outline-light">Modify</a>
              </div>
            </div>
            <br>
   
        </div> -->
        <div class="col-12 col-md-6 col-lg-4">
          
          <!-- Card -->
            <div class="card text-white bg-dark" style="width: auto;">
              <img src="https://raw.githubusercontent.com/miguelcanosantana/FurManage/master/FurManage/web/img/fur_logo.png" class="card-img-top" alt="Paisaje">
              <div class="card-body">
                <h5 class="card-title">Add / Remove Fursonas</h5>
                <p class="card-text">You can add a fursona and select from species.</p>
                <a href="#" class="btn btn-outline-light">Remove</a>
                <a href="#" class="btn btn-outline-light">Add</a>

              </div>
            </div>
            <br>          
          
          
        </div>
        <div class="col-12 col-md-6 col-lg-4">
          
          <!-- Card -->
            <div class="card text-white bg-dark" style="width: auto;">
              <img src="https://raw.githubusercontent.com/miguelcanosantana/FurManage/master/FurManage/web/img/config_logo.png" class="card-img-top" alt="Paisaje">
              <div class="card-body">
                <h5 class="card-title">Remove Users</h5>
                <p class="card-text">If your account has Admin permissions, delete users.</p>
                <a href="http://localhost:8080/FurManage/jsp_pages/delete_user.jsp" class="btn btn-outline-light">Delete</a>
              </div>
            </div>
            <br>         
          
          
          
          
          
        </div>
      </div>
    </div>

  <%
    //Close connection
    conect.close();
  %>
</html>

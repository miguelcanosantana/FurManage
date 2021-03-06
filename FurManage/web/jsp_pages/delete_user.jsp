<%-- 
    Document   : index
    Created on : 2 mar. 2020, 8:26:50
    Author     : miguel
--%>

<%@ page import="java.util.Random"%>
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
    <link rel="stylesheet" type="text/css" href="../css/delete.css">
    <link rel="shortcut icon" href="../img/favicon.ico" type="image/x-icon">
        
    <title>FurManage - Delete User</title>
    
    </head>
    
    <body>  
    
    <!-- Container -->
    <div class="container" id="login-container">
      <div class="row justify-content-md-center">
        <div class="col-12 col-md-8 col-xl-6">
        <!-- Jumbo -->
        <div id="login-jumbo" class="jumbotron text-center">
          <div class="container">
            <div class="row">
              <div class="col-sm">
                <div id="back-of-jumbo">
                  
                    <!-- Form -->
                    <form form method="post" action="http://localhost:8080/FurManage/jsp_processes/deleteusr.jsp">
                      <label for="usrname">Admin Account</label><br>
                      <input type="text" name="usrname" class="form-control" minlength="4" id="usrname" value=""><br>

                      <label for="psswd">Admin Password</label><br>
                      <input type="password" name="psswd" class="form-control" minlength="6" maxlength="128" id="psswd" maxlength="128" value=""><br>
                      
                      <label for="delusr">ID of the User to DELETE</label><br>
                      <input type="number" name="delusr" class="form-control" id="delusr" value=""><br>
                      
                      <!--Message-->
                      <div class="alert alert-warning" role="alert">
                        If username does not exist or Admin credentials are wrong, this page will be reloaded
                      </div><br>
                      
                      <!--Message-->
                      <div class="alert alert-danger" role="alert">
                        When deleting an User, it's fursonas will be also ERASED from the database
                      </div><br>
                      
                      <input type="button" onclick="window.location.href = 'http://localhost:8080/FurManage/jsp_pages/control_panel.jsp';" class="btn btn-secondary btn-lg" value="Go Back">
                      <input type="submit" class="btn btn-outline-danger btn-lg" value="Delete">



                    </form>

                </div>
              </div>
            </div>
          </div>
        </div>          
        </div>
      </div>
    </div>
 
    </body>
</html>

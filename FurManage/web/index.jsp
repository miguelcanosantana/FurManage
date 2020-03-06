<%-- 
    Document   : index
    Created on : 2 mar. 2020, 8:26:50
    Author     : miguel
--%>

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
    <link rel="stylesheet" type="text/css" href="css/index.css">
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
        
    <title>FurManage</title>
    
    </head>
    
    <body id="login-body" >  
      
      <!--Login Screen-->
      <div id="login-jumbo" class="jumbotron text-center">
        <div class="container">
          <div class="row">
            <div class="col-sm">
              <div id="back-of-jumbo">
                <h1 id="jumbo-title" class="display-4">FurManage</h1>
                <p>Furry Hub and Community Manager</p>
                
                  <!--Form-->
                  <form form method="post" action="index.jsp">
                    <label for="usrname">Username</label><br>
                    <input type="text" class="form-control" id="usrname" value=""><br><br>
                    
                    <label for="psswd">Password</label><br>
                    <input type="password" class="form-control" id="psswd" maxlength="128" value=""><br><br>
                    
                    <input type="button" onclick="window.location.href = 'jsp_pages/newuser.jsp';" class="btn btn-secondary btn-lg" value="New User">
                    <input type="submit" class="btn btn-primary btn-lg" value="Login">
                    
                    
                    
                  </form>
              
              </div>
            </div>
          </div>
        </div>
      </div>
        
        
        
        
    </body>
</html>

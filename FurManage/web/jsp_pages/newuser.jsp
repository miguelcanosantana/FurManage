<%-- 
    Document   : newuser
    Created on : 2 mar. 2020, 10:50:54
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
    <link rel="stylesheet" type="text/css" href="/css/index.css">
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
    
    <title>Creating User...</title>
  </head>
  <body>
    
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
                  
                  <!--Username-->
                  <label for="usrname">Username</label><br>
                  <input type="text" id="usrname" value=""><br><br>

                  <!--Password-->
                  <label for="psswd">Password</label><br>
                  <input type="password" id="psswd" maxlength="128" value=""><br><br>
                  
                  <!--Repeat Password-->
                  <label for="rpsswd">Repeat Password</label><br>
                  <input type="password" id="rpsswd" maxlength="128" value=""><br><br>
                  
                  <!--Birthday-->
                  <label for="birthday">Birthday</label><br>
                  <input type="date" id="birthday" name="birthday"><br><br>
                  
                  <!--Search in List of Genders (User can also write it's own if not in the list)-->
                  <label for="genders">Genders</label><br>
                  <input list="genders">
                  <datalist id="genders">
                    <!-- List of genders Thanks to: https://abcnews.go.com/blogs/headlines/2014/02/heres-a-list-of-58-gender-options-for-facebook-users -->
                    <option value="Agender">
                    <option value="Androgyne">
                    <option value="Androgynous">
                    <option value="Bigender">
                    <option value="Cis">
                    <option value="Cisgender">
                    <option value="Cis Female">
                    <option value="Cis Male">
                    <option value="Cis Man">
                    <option value="Cis Woman">
                    <option value="Cisgender Female">
                    <option value="Cisgender Man">
                    <option value="Cisgender Woman">
                    <option value="Female to Male">
                    <option value="FTM">
                    <option value="Gender Fluid">
                    <option value="Gender Nonconforming">
                    <option value="Gender Questioning">
                    <option value="Gender Variant">
                    <option value="Genderqueer">
                    <option value="Intersex">
                    <option value="Male to Female">
                    <option value="MTF">
                    <option value="Neither">
                    <option value="Neutrois">
                    <option value="Non-binary">
                    <option value="Other">
                    <option value="Pangender">
                    <option value="Trans">
                    <option value="Trans*">
                    <option value="Trans Female">
                    <option value="Trans* Female">
                    <option value="Trans Male">
                    <option value="Trans* Male">
                    <option value="Trans Man">
                    <option value="Trans Person">
                    <option value="Trans* Person">
                    <option value="Trans Woman">
                    <option value="Trans* Woman">
                    <option value="Transfeminine">
                    <option value="Transgender">
                    <option value="Transgender Female">
                    <option value="Transgender Male">
                    <option value="Transgender Man">
                    <option value="Transgender Person">
                    <option value="Transgender Woman">
                    <option value="Transmasculine">
                    <option value="Transsexual">
                    <option value="Transsexual Female">
                    <option value="Transgender">
                    <option value="Transgender Female">
                    <option value="Transgender Male">
                    <option value="Transgender Man">
                    <option value="Transgender Person">
                    <option value="Transgender Woman">
                    <option value="Two-Spirit">
                  </datalist><br><br>
                  
                  <!--Submit Button!-->
                  <input type="submit" class="btn btn-light btn-lg" value="Create User">
                  
                  

                </form>

            </div>
          </div>
        </div>
      </div>
    </div>
    
  </body>
</html>
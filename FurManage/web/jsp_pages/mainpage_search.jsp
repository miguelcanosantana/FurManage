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
    
    <title>FurManage - User Search</title>
  </head>
  <body>
    
      <%
        //For UTF8 characters
        request.setCharacterEncoding("UTF-8");
        
        Class.forName("com.mysql.jdbc.Driver");
        Connection conect = DriverManager.getConnection("jdbc:mysql://localhost:3306/furmanage","root", "");
        Statement s = conect.createStatement();

        //Search users
        ResultSet listOfResults = s.executeQuery ("SELECT * FROM `user` "
                + "WHERE `NameUser` LIKE '" + request.getParameter("searchText") + "%';");

        
      %>
      <br>
      <br>
      <br>
      <!-- NavBar (Go back) -->
      <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
        <img src="../img/favicon.ico">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
              <a href="http://localhost:8080/FurManage/jsp_pages/mainpage.jsp" class="btn btn-danger" role="button">Go Back to Users List</a>
            </li>
          </ul>
          <a href="http://localhost:8080/FurManage/index.jsp" class="btn btn-danger" role="button">Close Session</a>
        </div>
      </nav>
      
      
    <!-- List of users -->
    <table class="table table-dark table-striped">
      <thead>
        <tr>
          <th scope="col">ID</th>
          <th scope="col">Avatar</th>
          <th scope="col">Username</th>
          <th scope="col">Age</th>
          <th scope="col">Gender</th>
          <th scope="col">Country</th>
          <th scope="col">Fursuit?</th>
        </tr>
      </thead>
      <tbody>
        
        <%
         
        
        
        while (listOfResults.next()) {
          
          //Checks if user has fursuits and converts result to emojis
          int hasFursuitBackup = listOfResults.getInt("HasFursuitUser");
          String hasFursuit;
          
          if (hasFursuitBackup == 1) {
            hasFursuit = "✔";
          } else {
            hasFursuit = "❌";
          }
        
          //Adds a row to the table
          out.println("<tr>");
          out.println("<th scope=\"row\">" + listOfResults.getInt("IdUser") + "</th>");
          out.println("<td>" + "<img src=\"" + listOfResults.getString("ImageUrlUser") + "\" " + "width=" + "\"" + "100px" + "\" " + "height=" + "\"" + "100px" + "\" " + "</td>");
          out.println("<td>" + listOfResults.getString("NameUser") +"</td>");
          out.println("<td>" + listOfResults.getInt("AgeUser") +"</td>");
          out.println("<td>" + listOfResults.getString("GenderUser") +"</td>");
          out.println("<td>" + listOfResults.getString("ZoneUser") +"</td>");
          out.println("<td>" + hasFursuit +"</td>");

        }
        

        
        %> 

      </tbody>
    </table>
  </body>
  <%
    //Close connection
    conect.close();
  %>
</html>

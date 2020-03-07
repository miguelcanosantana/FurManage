<%-- 
    Document   : recordnewuser
    Created on : 05-mar-2020, 9:35:18
    Author     : migue
--%>

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
    <title>Record USER</title>
  </head>
  <body>
    
    <%
      //Creates the connection to the database
      Class.forName("com.mysql.jdbc.Driver");
      Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/furmanage","root", "");
      Statement s = connection.createStatement();
      
      //For UTF8 characters
      request.setCharacterEncoding("UTF-8");
      
      // Encryption
        // Encrypt Method
        MessageDigest md = MessageDigest.getInstance("MD5");

        // Use psswd
        md.update(request.getParameter("psswd").getBytes());

        // Create hash from String
        String hash = DatatypeConverter.printHexBinary(md.digest());

        // Muestra por pantalla el hash
        out.print("Hash of psswd is: " + hash + "<br><br>");

        // Comprueba si la clave es correcta
        out.print(
        MessageDigest.isEqual(hash.getBytes(), "3617A2D14296CBC105AABF0EEBF8C74E".getBytes()) + "<br><br>"
        );
      
      
      
      

      //Tries to insert Values, if fails prints error message
      try{
          String adduser = "INSERT INTO `user` (`NameUser`, `PasswdUser`, `HasAdminUser`, `AgeUser`, `GenderUser`, `ZoneUser`, `HasFursuitUser`, `ImageUrlUser`) VALUES "
                  + "("   + " '" +request.getParameter("usrname")
                          + "', '" + hash
                          + "', " + 0
                          + ", " + Integer.valueOf(request.getParameter("age"))
                          + ", '" + request.getParameter("genders")
                          + "', '" + request.getParameter("country")
                          + "', " + Integer.valueOf(request.getParameter("fursuit"))
                          + ", '" + request.getParameter("avatar") + "');";

                          out.print(adduser);
                         
                          //Execute the procedure
                          s.execute(adduser);          
                          connection.close();
                          
                          out.close();  
                                         
                          
      } catch (Exception e) {
          System.out.println("An error has ocurred");
          System.out.println(e);
        }
      
        //Redirect to user creation
        response.setStatus(301);
        response.setHeader("Location", "http://localhost:8080/FurManage/jsp_pages/newuser.jsp");
        response.setHeader("Connection", "close");
    
    %>
    
    
    
    

  </body>
</html>

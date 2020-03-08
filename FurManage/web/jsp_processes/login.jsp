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
      Connection connection2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/furmanage","root", "");
      Statement s = connection2.createStatement();
      
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
      
        //Tries to check password of user, if success send to main page
        try {
          
          String retrievePassword = "SELECT `PasswdUser` FROM `user` WHERE `NameUser` = '" + request.getParameter("usrname") +"';" ;
          
                          //Execute the procedure
                          boolean obtained = s.execute(retrievePassword); 
                          
                          if (hash == retrievePassword){
                            out.print("OKEY");
                          } else {
                            out.print("NO OKEY");
                          }
                           out.println();
                           out.println(obtained);
                          
                          //Redirects to main page
                          response.sendRedirect("http://localhost:8080/FurManage/jsp_pages/mainpage.jsp");
        
        
        } catch(Exception e) {
          //Redirects to login user
         // response.sendRedirect("http://localhost:8080/FurManage/");
          
          
        }
      


      
      
        
    
    %>
    
    
    
    

  </body>
</html>

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
      
        //Tries to insert Values, if fails redirects to user creation
        try {
     
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
                          //Redirects to login
                          response.sendRedirect("http://localhost:8080/FurManage/");
        
        
        } catch(Exception e) {
          //Redirects to create user
          response.sendRedirect("http://localhost:8080/FurManage/jsp_pages/newuser.jsp");
          
          
        }
      


      
      
        
    
    %>
    
    
    
    

  </body>
</html>

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
      Connection conect = DriverManager.getConnection("jdbc:mysql://localhost:3306/furmanage","root", "");
      
      //For UTF8 characters
      request.setCharacterEncoding("UTF-8");

      //Statement for retrieving hashes by usernames
      Statement u = conect.createStatement();
      
      //Statement for selecting username to delete
      Statement s = conect.createStatement();
      
      //Statement for retrieving username username to delete ID
      Statement i = conect.createStatement();
      

      // Encryption
        // Encrypt Method
        MessageDigest md = MessageDigest.getInstance("MD5");

        // Use psswd
        md.update(request.getParameter("psswd").getBytes());

        // Create hash from String
        String hash = DatatypeConverter.printHexBinary(md.digest());

        // Shows Hash
        out.print("Hash of psswd is: " + hash + "<br><br>");

      
        //Tries to check password of user, if success send to main page
        try {
                
          //Retrieves admin users
          ResultSet listOfResults2 = u.executeQuery ("SELECT `PasswdUser` FROM `user` WHERE `NameUser` =" + "'" + request.getParameter("usrname") + "' AND `HasAdminUser` =" + 1 + ";");
          
          //Retrieves ID to delete user
          ResultSet userID = i.executeQuery("SELECT `IdUser` FROM `user` WHERE `NameUser` =" + "'" + request.getParameter("delusr") + "';");
          
          while (listOfResults2.next()) {
    
            if((listOfResults2.getString("PasswdUser")).equals(hash)){
              out.println("okey");
              
              //Deletes fursonas
                i.execute("DELETE FROM `fursona` WHERE `OwnedbyUserSona` =" + request.getParameter("delusr") + ";"); 
              
              //Deletes user
                s.execute("DELETE FROM `user` WHERE `IdUser` =" + request.getParameter("delusr") + ";"); 
              
              //Redirects to main page
              response.sendRedirect("http://localhost:8080/FurManage/jsp_pages/mainpage.jsp");
              
            } else {
              out.println("not okey");
              //Redirects to login user if fails
              response.sendRedirect("http://localhost:8080/FurManage/jsp_pages/delete_user.jsp");
            }
          }
          
        //Redirects if everything above fails in login
        response.sendRedirect("http://localhost:8080/FurManage/jsp_pages/delete_user.jsp");

        } catch(Exception e) {
          
         out.println(e); 
          
        }



      
      
        
    
    %>
    
    
    
    

  </body>
</html>

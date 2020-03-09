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
                
          //Retrieves hashes with usernames
          ResultSet listOfResults2 = u.executeQuery ("SELECT `PasswdUser` FROM `user` WHERE `NameUser` =" + "'" + request.getParameter("usrname") + "'" + ";");
          
          out.println(request.getParameter("usrname"));
          
          
          while (listOfResults2.next()) {
            out.println("<br><td>" + listOfResults2.getString("PasswdUser") +"</td>");
            
            
            if((listOfResults2.getString("PasswdUser")).equals(hash)){
              out.println("okey");
              
              //Signs off past user (deletes it's cookies)
              Cookie deleteUsername = new Cookie("username", "");
              Cookie deleteUserhash = new Cookie("userhash", "");
              deleteUsername.setMaxAge(0);
              deleteUserhash.setMaxAge(0);
              response.addCookie(deleteUsername);
              response.addCookie(deleteUserhash);
              
              //Creates cookies for current user
              Cookie username = new Cookie("username", request.getParameter("usrname"));
              Cookie userhash = new Cookie("userhash", hash);
              username.setMaxAge(60 * 60 * 24 * 365 * 10);
              userhash.setMaxAge(60 * 60 * 24 * 365 * 10);
              response.addCookie(username);
              response.addCookie(userhash);
              
              //Redirects to main page
              response.sendRedirect("http://localhost:8080/FurManage/jsp_pages/mainpage.jsp");
              
            } else {
              out.println("not okey");
              //Redirects to login user if fails
              response.sendRedirect("http://localhost:8080/FurManage/");
            }
          }
          
        //Redirects if everything above fails in login
        response.sendRedirect("http://localhost:8080/FurManage/");

        } catch(Exception e) {
          
         out.println(e); 
          
        }



      
      
        
    
    %>
    
    
    
    

  </body>
</html>

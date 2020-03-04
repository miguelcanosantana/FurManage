<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>List of Species</title>
  </head>
  <body>
    <h1>List of Species</h1>
	<%
		Class.forName("com.mysql.jdbc.Driver");
		Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/furmanage","root", "");
		Statement s = conexion.createStatement();
		
		ResultSet listOfResults = s.executeQuery ("SELECT * FROM species");
		
		while (listOfResults.next()) {
			out.println(listOfResults.getString("IDSpec") + " " + listOfResults.getString ("NameSpec") + "<br>");
    }
		
		conexion.close();
	%>
  </body>
</html>
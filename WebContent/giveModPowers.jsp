<%@ page language="java" import="java.util.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import ="java.sql.*" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Home Page</title>
</head>
<body>
<%
	String userid = request.getParameter("uname");
	//Create a connection string
	String url = "jdbc:mysql://cs336-18.cs.rutgers.edu:3306/CS336_Project";
	//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
	Class.forName("com.mysql.jdbc.Driver");
	//Create a connection to your DB
	Connection con = DriverManager.getConnection(url, "csuser", "csda0467");	
	
	Statement st = con.createStatement();
	ResultSet rs;
	rs = st.executeQuery("select Users.isMod from Users where uname=  '"    + userid +    "' ");
	 if (rs.next()) {
	        rs.updateBoolean(7, true);
    } else {
    	%>
    	 <script type="text/javascript">
    	 alert("Nothing happened. User doesn't exist!");
    	 </script>
    	<%
    	 response.sendRedirect("giveModPowers.jsp");
    }



%>
</body>
</html>
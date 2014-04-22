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
		<title>Insert title here</title>
	</head>
		<body>
			<%
				//Create a connection string
				String url = "jdbc:mysql://cs336-18.cs.rutgers.edu:3306/CS336_Project";
		    	//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
			    Class.forName("com.mysql.jdbc.Driver");
		    	
		    	//Create a connection to your DB
			    Connection con = DriverManager.getConnection(url, "csuser", "csda0467");	
		    	String current_user = (String) session.getAttribute("userid");
		    	
		    	Class.forName("com.mysql.jdbc.Driver");
			    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/CS336_Project",
			            "csuser", "csda0467");
			    Statement st = con.createStatement();
			    ResultSet rs;
			    rs = st.executeQuery("SELECT uname FROM Users U WHERE uname = ' "+current_user+" + ' and isAdmin = 1");
			
		   		if(rs.next()){
		   			
		   		}
		    	
			 %>
		</body>
</html>
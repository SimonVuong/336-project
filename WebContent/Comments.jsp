<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page language="java" import="java.util.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html charset=utf-8">
<title>Insert title here</title>
<link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
</head>
<body>
<table class = "table table-striped">
<thead>
 <tr>
 <th> User </th>
  <th> Comment</th>
  </tr>
</thead>	
<% 
	try
	{
		int tid = Integer.valueOf((String)request.getParameter("tid"));
		String url = "jdbc:mysql://cs336-18.cs.rutgers.edu:3306/CS336_Project";
		//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
		Class.forName("com.mysql.jdbc.Driver");
		
		//Create a connection to your DB
		Connection con = DriverManager.getConnection(url, "csuser", "csda0467");
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select * from Comment where tid="+tid); //should get all the threads of a subtopic
		
		
		while(rs.next())
		{
			out.println("<tr>");
			out.println("<td>");
			out.println(rs.getString("user"));
			out.println("</td>");
			out.println("<td>");
			out.println(rs.getString("contents")); //get the title and print it out as a link
			out.println("</td>");
			out.println("</tr>");
		}
		out.println("</table>");
		out.println("<a href = \"AddComment.jsp?tid="+tid+"\"> Add Comment");
	}
	catch(Exception e)
	{
		out.print(e.getMessage());
	}
%>
</table>
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script src=”js/bootstrap.js”></script>
</body>
</html>
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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
   try
	{
		String sub_topic = request.getParameter("subtopic");
		out.println(sub_topic);
		session.setAttribute("subtopic", sub_topic);
		//Create a connection string
		String url = "jdbc:mysql://cs336-18.cs.rutgers.edu:3306/CS336_Project";
		//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
	    Class.forName("com.mysql.jdbc.Driver");
		
		//Create a connection to your DB
	    Connection con = DriverManager.getConnection(url, "csuser", "csda0467");
	    Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select * from Thread where sname='"+sub_topic+"'"); //should get all the threads of a subtopic
		out.println("<table>");
		while(rs.next())
		{
			out.println("<tr>");
			out.println("<td>");
			out.println("<a href = \"Comments.jsp?tid="+rs.getInt("tid")+"\">"+rs.getString("title")+"</a>"); //get the title and print it out as a link
			out.println("</td");
			out.println("</tr>");
		}
		out.println("<tr>");
		out.println("<td>");
		out.println("<a href = \"CreateThread.jsp?subtopic="+sub_topic+"\"> Create Thread");
		out.println("</td");
		out.println("</tr>");
		out.println("</table>");
	}
	catch(Exception e)
	{
		out.print(e.getMessage());
	}
%>

</body>
</html>
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
	try{
		   String url = "jdbc:mysql://cs336-18.cs.rutgers.edu:3306/CS336_Project";
	   	//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
		    Class.forName("com.mysql.jdbc.Driver");
	   	
	   	//Create a connection to your DB
		    Connection con = DriverManager.getConnection(url, "csuser", "csda0467");
	   		String threadname= request.getParameter("threadname");
	   		if(threadname==null)
	   		{
	   			//this is just a comment, add it like normal
	   			
	   		}
	   		else
	   		{
	   			String session = session.getAttribute("subtopic");
	   			Statement st = con.createStatement();
	   		    int i = st.executeUpdate("insert into Threads()");  //this auto increments, how do i get that value?
	   		    //is there a way to do any god damn error checking and tell it to the user
	   		    int j = st.executeUpdate("insert into Comments");
	   			//try doing Scope_Identity()?
	   		}
	   		//TODO make user give first comment
	}
	catch(Exception e)
	{
		out.println(e.getStackTrace());
	}

   
%>
</body>
</html>


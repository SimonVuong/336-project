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
<title>Hodor</title>
<link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
</head>
<style type="text/css">
a:link {
color: inherit;
}
a:visited{
color: inherit;
}
       <style type="text/css">

#nav a:link 
{
color:#0299d2;
}
#nav a:visited
{
 color: #0299d2;
}
#nav    
{
background:#444446;
padding:5px;
border-bottom:solid 1px #222;

}
#nav td
{

font-size:2em;
width:20%;
font-size:2em;
height: auto;
}


#nav table
{
 width:100%;
 border-collapse: collapse;
}

#nav tr
{
border: 0 px;
height:auto;
}
</style>

<body>
<div id = "nav">
	<table>
		<tr>
			<td>
			<a href= "Home.jsp">Home</a>
			</td>
			<td>
			<a href = "forum.jsp">Forum</a>
			</td>
			<td>
			<a href = "Account.jsp"> My Account</a>
			</td>
			<td>
			<a href = "login.jsp"> Login</a>
			</td>
			<td>
			<a href = "reg.jsp">Register</a>
			</td>
		</tr>
	</table>
</div>
<br>
<div class="panel panel-primary">
<% 
   try
	{
		String sub_topic = request.getParameter("subtopic");
		out.print("<div class=\"panel-heading\">");
		out.println("<h3>"+sub_topic+"</h3>");
		out.println("</div>");
		session.setAttribute("subtopic", sub_topic);
		//Create a connection string
		String url = "jdbc:mysql://cs336-18.cs.rutgers.edu:3306/CS336_Project";
		//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
	    Class.forName("com.mysql.jdbc.Driver");
		
		//Create a connection to your DB
	    Connection con = DriverManager.getConnection(url, "csuser", "csda0467");
	    Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select * from Thread where sname='"+sub_topic+"'"); //should get all the threads of a subtopic
		out.print("<ul class=\"list-group\">");
		while(rs.next())
		{
			
			out.println("<li class=\"list-group-item list-group-item-info\"><a href = \"Comments.jsp?tid="+rs.getInt("tid")+"\">"+rs.getString("title")+"</a></li>"); //get the title and print it out as a link
			out.println("</li>");
		}
		out.print("</ul>");
		out.println("</div>");
		out.println("<a href = \"CreateThread.jsp?subtopic="+sub_topic+"\"> Create Thread");
		
	}
	catch(Exception e)
	{
		out.print(e.getMessage());
	}
%>

<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script src=”js/bootstrap.js”></script>
</body>
</html>
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
<title>Login Page</title>
</head>
   <style type="text/css">

a:link 
{
color:#0299d2;
}
a:visited
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
#uinfo
{
	margin-left:auto;
	margin-right:auto;
	width: 50%;
}
body,table,td,th {
	font-family: Verdana, Geneva, sans-serif;	
}

</style>
</head>
<div id = "nav">
<body>
	<table>
		<tr>
			<td>
			<a href= "Home.html">Home</a>
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
</body>
</div>
<br>
<%
try {

	    	//Create a connection string
			String url = "jdbc:mysql://cs336-18.cs.rutgers.edu:3306/CS336_Project";
	    	//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
		    Class.forName("com.mysql.jdbc.Driver");
	    	
	    	//Create a connection to your DB
		    Connection con = DriverManager.getConnection(url, "csuser", "csda0467");	
	    	Object current_user = session.getAttribute("userid");
	    	if(current_user!=null)
	    	{
	    		out.println("<h2>Welcome "+current_user+"</h2>");
	    		Statement st = con.createStatement();
	    		ResultSet rs = st.executeQuery("select * from Users where uname='"+current_user.toString()+"'");
	    		rs.next();
	    		out.println("<div id = \"uinfo\">");
	    		out.println("<br>");
	    		out.println("<table>");
	    		out.println("<tr>");
	    		out.println("<td>");
	    		out.println("Username:");
	    		out.println(rs.getString("uname"));
	    		out.println("</td>");
	    		out.println("</tr>");
	    		out.println("<tr>");
	    		out.println("<td>");
	    		out.println("Name:");
	    		out.println(rs.getString("fullname"));
	    		out.println("</td>");
	    		out.println("</tr>");
	    		out.println("<tr>");
	    		out.println("<td>");
	    		out.println("Honor:");
	    		out.println(rs.getInt("netVotes"));
	    		out.println("</td>");
	    		out.println("</tr>");
	    		out.println("<tr>");
	    		out.println("<td>");
	    		out.println("<a href='logout.jsp'>Log out</a>");
	    		out.println("</td>");
	    		out.println("</tr>");
	    		out.println("</table>");
	    		
	    		out.println("<div>");
	    		rs.close();
	    		con.close();
	    	}
	    	else
	    	{
	    		//if they are not logged in, sends them to login screen
	    		String site = "login.jsp";
	    		response.sendRedirect(site);
	    	}
		    
	}
catch(Exception e)
	{
		out.println(e.getStackTrace());
		
	}
	%>
</html>
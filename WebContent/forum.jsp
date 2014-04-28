<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page language="java" import="java.util.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html><head>
<meta content="text/html; charset=ISO-8859-1" http-equiv="content-type"><title>Index</title>

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
#Topics
{
 border-bottom:solid 1px #222;
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

</div>

<%
	try {
	
			//Create a connection string
			String url = "jdbc:mysql://cs336-18.cs.rutgers.edu:3306/CS336_Project";
			//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
		    Class.forName("com.mysql.jdbc.Driver");
			
			//Create a connection to your DB
		    Connection con = DriverManager.getConnection(url, "csuser", "csda0467");
		    Statement st = con.createStatement();
    		ResultSet rs = st.executeQuery("select * from Topic");
    		Statement sub_state = con.createStatement();
    		ResultSet sub_rs;
    		out.println("<div id = \"Topics\">");   //makes a div for css stuff whatever
    		out.println("<table>");
    		while(rs.next())
    		{
    			out.println("<tr>");
    			out.println("<td>");
    			out.println(rs.getString("tname"));    
    			out.println("</td>");
    			sub_rs = sub_state.executeQuery("select * from Subtopic where tname ='"+rs.getString("tname")+"'");   //finish this
    			out.println("</tr>");
    			while(sub_rs.next())  //TODO need to make it generate subtopics
    			{
    				out.println("<tr>");
        			out.println("<td>");
        			out.println("<a href = \"Threads.jsp?subtopic="+sub_rs.getString("sname")+"\">"+sub_rs.getString("sname")+"</a>");
        			out.println("</td>");
    			}
    			
    			
    		}
    		out.println("</table>");
    		out.println("</div>");
	}
	catch(Exception e)
	{
		out.println(e);
	}
%>
</body>
</html>
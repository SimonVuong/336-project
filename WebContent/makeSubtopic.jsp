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
<title>Topic Creation</title>
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
body,table,td,th {
	font-family: Verdana, Geneva, sans-serif;	
}

</style>
</head>
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
<%
	String subtopic = request.getParameter("makeSubtopic");
	String topic = request.getParameter("ofTopic");
	//Create a connection string
	String url = "jdbc:mysql://cs336-18.cs.rutgers.edu:3306/CS336_Project";
	//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
	Class.forName("com.mysql.jdbc.Driver");
	//Create a connection to your DB
	Connection con = DriverManager.getConnection(url, "csuser", "csda0467");	
	
	Statement st = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	ResultSet rs;
	rs = st.executeQuery("select * from Subtopic where tname=  '"    + topic +    "' and sname = '" +subtopic+ "' ");
	 if (rs.next()) {
		out.println(subtopic +" already exist or " +topic + " doesn't exist!");
        
    } else {
    	st.executeUpdate("INSERT INTO Subtopic (sname, tname) VALUES ( '"+subtopic+"','" + topic + "' )");
    	out.println(subtopic +" created.");
    }



%>
</body>
</html>
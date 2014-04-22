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
#footer
{
	background:#444446;
	padding:5px;
	border-bottom:solid 1px #222;
	position:fixed;
	left:0px;
	bottom:0px;
	height:20px;
	width:100%;
	
} 
	
}
#footer td
{
	text-align:center;
	width:20%;
	font-size:70%;
	height: auto;
}


#footer table
{
 width:100%;
 border-collapse: collapse;
}

#footer tr
{
	border: 0 px;
	height:auto;
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
	<%@ page import ="java.sql.*" %>
	<%
	    Class.forName("com.mysql.jdbc.Driver");
	    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/CS336_Project",
	            "csuser", "csda0467");
	    Statement st = con.createStatement();
	    ResultSet rs;
	    rs = st.executeQuery("SELECT title FROM Thread ORDER BY title, DESC, LIMIT 10");
	    while (rs.next()) {
    		out.println("<table>");
    		while(rs.next()){
    			out.println("<tr>");
    			out.println("<td>");
    			out.println(rs.getString("title"));   
    			out.println("</td>");
    			out.println("<tr>");
	    	}
	    }
	%>
	
</body>
</div>
<br>
<div id = "footer">
<table>
<tr>
<td>
<a href = "Admin.jsp">Admin Tools</a>
</td>
<td>
<a href = "Mod.jsp">Moderator Tools</a>
</td>
<td>
<a href = "Sales.jsp"> Sales Tools</a>
</td>
</tr>
</table>
</div>
</html>
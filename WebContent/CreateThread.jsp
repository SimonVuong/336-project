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
<body>
<form name = "thread_create" action = "TCMake.jsp?subtopic=" method="get">
<input type = "text" placeholder ="Thread Name" name = "threadname">
<br>
<textarea name = "comment" placeholder ="Enter Comment" rows="10" cols="30" maxlength = "5000">
</textarea>
<br>
<input type = "submit" value = "Create">
</form>
<%
   if(session.getAttribute("userid")==null)
	{
	 	String site = "login.jsp";   //sends them to the login page if the user isnt logged in
		response.sendRedirect(site);
	}
   else
   {
	   String sub_topic = request.getParameter("subtopic");
	   
   }
%>
</body>
</html>
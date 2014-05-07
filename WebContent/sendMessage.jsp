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
<%
	//if the user is not logged in as a mod, they will be sent to the login page;
	if((String) session.getAttribute("userid")==null)
		{
			String site = "login.jsp";
	    	response.sendRedirect(site);
	   	}
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Insert title here</title>
		<link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
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
			<br>
			<form method="post" action="impMessages.jsp">
      	<center>
            <table>
                <thead>
                    <tr>
                        <th colspan="2">Send a message</th>
                    </tr>
                </thead>
                <tbody>
                    <tr> <td>Send to user: </td>
                        <td><input type="text" name="sentTo" value="" /></td>
                    </tr>
                    <tr> 
                        <td colspan="2"><textarea name = "message" placeholder ="Enter Message" rows="10" cols="30" maxlength = "5000">
</textarea></td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Submit" /></td>
                        </tr>
                    
                </tbody>
            </table>
            </center>
      </form> 
      </body>
     </html>
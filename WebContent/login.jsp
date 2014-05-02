<%@ page language="java" import="java.util.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%
	//if the user is already logged in, they will be sent to the account info page;
	if(session.getAttribute("userid")!=null)
		{
			String site = "Account.jsp";
	    	response.sendRedirect(site);
	   	}
%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hordor</title>
    </head>
<link rel = "stylesheet" type = "text/css" href = "Nav.css">
</head>
<div id = "nav">
<body>
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
        <form method="post" action="verify.jsp">
            <center>
            <table>
                <thead>
                    <tr>
                        <th colspan="2">Login Here</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>User Name:</td>
                        <td><input type="text" name="uname" value="" /></td>
                    </tr>
                    <tr>
                        <td>Password:</td>
                        <td><input type="password" name="pass" value="" /></td>
                    </tr>
                    <tr>
                    <center>
                        <td><input type="submit" value="Login" /></td>
                    </center>
                    </tr>
                    <tr>
                     	<td><a href="reg.jsp">Register Here</a></td>
                    </tr>
                </tbody>
            </table>
            </center>
        </form>
    </body>
</html>
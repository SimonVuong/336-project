<%@ page language="java" import="java.util.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import ="java.sql.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
if(session.getAttribute("userid")!=null)
	{
	String site = "Account.jsp";
	response.sendRedirect(site);
	}
	%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hordor</title>
    </head>
    <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
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
        <form method="post" action="registration.jsp">
            <center>
            
                        <p colspan="2">Enter Information Here</p>
                    
                        <p>Last Name,First Name: <input type="text" name="name" value="" /></p>
                        <p>Email: <input type="text" name="email" value="" /></p>
                        
                    
                        <p>User Name: <input type="text" name="uname" value="" /></p>

                        <p>Password: <input type="password" name="pass" value="" /></p>
	                    <select name="interests">
					    <option value="" disabled="disabled" selected="selected">Please select an interest</option>
					    <option value="1">Horses</option>
					    <option value="2">Swords</option>
					    <option value="3">The Coming Winter</option>
					    <option value="4">cars</option>
					    <option value="5">socks</option>
						</select>
                        <p><input type="submit" value="Submit" /></p>
                        <p><input type="reset" value="Reset" /></p>
                    	
                        <p>Go back to Login: <a href="login.jsp">Login Here</a></p>
            </center>
        </form>
        
    </body>
</html>
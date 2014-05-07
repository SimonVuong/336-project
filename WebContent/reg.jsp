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
                        Interests:
						<input type="checkbox" name="carsIntereset" value="cars">Cars<br>
						<input type="checkbox" name="socksInterest" value="socks">Socks<br>
						<input type="checkbox" name="horsesInterest" value="horses">Horses<br>
						
                        <p><input type="submit" value="Submit" /></p>
                        <p><input type="reset" value="Reset" /></p>
                        

					 
                    
                        <p>Go back to Login: <a href="login.jsp">Login Here</a></p>
            </center>
        </form>
        
    </body>
</html>
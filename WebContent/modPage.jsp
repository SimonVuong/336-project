<%@ page language="java" import="java.util.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%
	//if the user is not logged in as a mod, they will be sent to the login page;
	if((Boolean) session.getAttribute("isMod")==null)
		{
			String site = "login.jsp";
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
        <form method="post" action="moveThread.jsp">
            <center>
            <table>
                <thead>
                    <tr>
                        <th colspan="2">Move Thread</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Thread ID:</td>
                        <td><input type="text" name="tID" value="" /></td>
                    </tr>
                    <tr>
                        <td>Move to Topic:</td>
                        <td><input type="text" name="topic" value="" /></td>
                    </tr>
                    <tr>
                        <td>Move to Subtopic:</td>
                        <td><input type="text" name="subTopic" value="" /></td>
                    </tr>
                    <tr>
                    <center>
                        <td><input type="submit" value="Move" /></td>
                    </center>
                    </tr>
                </tbody>
            </table>
            </center>
        </form>
      <form method="post" action="deleteComment.jsp">
      	<center>
            <table>
                <thead>
                    <tr>
                        <th colspan="2">Delete comment</th>
                    </tr>
                </thead>
                <tbody>
                    <tr> <td>Comment ID: </td>
                        <td><input type="text" name="cID" value="" /></td>
                    </tr>
                    
                    <tr>
                        <td><input type="submit" value="Submit" /></td>
                        </tr>
                    
                </tbody>
            </table>
            </center>
      </form> 
      <form method="post" action="editTitle.jsp">
      	<center>
            <table>
                <thead>
                    <tr>
                        <th colspan="2">Edit Thread Title</th>
                    </tr>
                </thead>
                <tbody>
                    <tr> <td>ThreadID: </td>
                        <td><input type="text" name="tID" value="" /></td>
                    </tr>
                    <tr> <td>New Title </td>
                        <td><input type="text" name="nTitle" value="" /></td>
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
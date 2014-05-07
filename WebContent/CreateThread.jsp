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
<title>Make a Thread!</title>
</head>
<body>
<form name = "thread_create" action = "TCMake.jsp?subtopic=" method="get">
Thread Title: <input type = "text" name = "threadname">
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
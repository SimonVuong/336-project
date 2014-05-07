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
<title>Insert title here</title>
</head>
<body>
<% 
	int tid=0;
	try
	{
		if(session.getAttribute("userid")==null)
		{
			String site = "login.jsp";   //sends them to the login page if the user isnt logged in
			response.sendRedirect(site);
		}
		tid = Integer.valueOf((String)session.getAttribute("tid"));
		int cid = Integer.valueOf((String)request.getParameter("cid"));
		String url = "jdbc:mysql://cs336-18.cs.rutgers.edu:3306/CS336_Project";
		Class.forName("com.mysql.jdbc.Driver");
		String user = session.getAttribute("userid").toString();
		//Create a connection to your DB
		Connection con = DriverManager.getConnection(url, "csuser", "csda0467");
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select * from Comment WHERE cid="+cid); 
		rs.next();
		String targetname = rs.getString("user");
		if(targetname.equals(user))
		{
			out.println("<h1>You can not vote for yourself!</h1>");
			response.setHeader("Refresh","3; URL = Comments.jsp?tid="+tid);
		}
		else
		{
		int result = st.executeUpdate("Insert Into CommentVotes(votername,targetname,cid) values ('"+user+"','"+targetname+"',"+cid+")");
		st.executeUpdate("UPDATE Comment SET votes=votes+1 where cid ='"+cid+"'"); //update votes
		st.executeUpdate("UPDATE Users SET netVotes=netVotes+1 where uname ='"+targetname+"'");
		out.println("<h1>Vote Successful!</h1>");
		response.setHeader("Refresh","2; URL = Comments.jsp?tid="+tid);
		}
	}
	catch(Exception e)
	{
		out.println("<h1>Vote Failed!</h1>");
		response.setHeader("Refresh","2; URL = Comments.jsp?tid="+tid);
	}
		%>
</body>
</html>
<%@ page language="java" import="java.util.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import ="java.sql.*" %>
<%
    String user = request.getParameter("uname");    
    String pwd = request.getParameter("pass");
    String name = request.getParameter("name");
    String email = request.getParameter("email");
  	String cars = request.getParameter("cars");
  	String socks = request.getParameter("socks");
  	String horses = request.getParameter("horses");
  	
	int zero= 0;
	int loc = Integer.parseInt(request.getParameter("interests"));
	String interest;
	switch(loc)
	{
	case 1: interest = "Horses";
			break;
	case 2: interest = "Swords";
			break;
	
	case 3: interest = "The Coming Winter";
			break;
	case 4: interest = "cars";
			break;
	case 5: interest = "socks";
			break;
	default: interest = "error";
			break;
	}
    try{
	Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/CS336_Project",
            "root", "csda0467");
    Statement st = con.createStatement();
    int i = st.executeUpdate("insert into Users(uname,pwd, Spent, fullname, email, isSales, isMod, isAdmin, years, netVotes, numComments) values ('" + user + "','" + pwd + "','" + zero + "','" + name + "','" + email + "','" + zero + "','" + zero +"','" + zero +"', NOW(),'" + zero +"','" + zero +"' )");

    if (i > 0) 
    {
    	i = st.executeUpdate("insert into UserInterest(uname,interest) values ('"+user+"','"+interest+ "')");
        response.sendRedirect("welcome.jsp");
    } 
    else 
    {
    	out.println("<h1>User Exists!</h1>");
		response.setHeader("Refresh","2; URL = login.jsp");
    	
    }
    }
    catch(Exception e)
    {
    	out.println("<h1>Registration Failed, User Exists!</h1>");
		response.setHeader("Refresh","2; URL = login.jsp");
    }
%>
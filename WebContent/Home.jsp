<%@ page language="java" import="java.util.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html><head>
<meta content="text/html; charset=ISO-8859-1" http-equiv="content-type"><title>Index</title>
<title>Hodor</title>
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
	<table>


	<%
	    Class.forName("com.mysql.jdbc.Driver");
	    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/CS336_Project",
	            "csuser", "csda0467");
	    Statement st = con.createStatement();
	    ResultSet rs;
	    rs = st.executeQuery("SELECT title FROM Thread ORDER BY votes DESC LIMIT 10");

   		while(rs.next()){
   			out.println("<tr>");
   			out.println("<td>");
   			out.println(rs.getString("title"));   
   			out.println("</td>");
   			out.println("<tr>");
    	}

	%>
	<%if((String) session.getAttribute("userid")!=null){
		String current_user = (String) session.getAttribute("userid");
    	
	    PreparedStatement st2 =null;
	    ResultSet rs2=null;
	    String user= (String)session.getAttribute("userid");
	    String quer="Select * FROM Advertisement Where uname = ?";
	    
	    try{
	    st2=con.prepareStatement(quer);
	    st2.setString(1,user);
	    rs2 = st2.executeQuery();
	    }
	    catch(SQLException c){
	    	out.println("your sql is messed up");
	    }
	    while(rs2.next()){
	    	
	    }
	} %>
	</table>
	
	

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
	<td>
	<a href = "messages.jsp"> View Messages</a>
	</td>
	<td>
	<a href = "sendMessage.jsp"> Send Messages</a>
	</td>
	</tr>
	</table>
	</div>
	<br>
</body>

</html>
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
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Sales Home Page</title>
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
			<%
				//Create a connection string
				String url = "jdbc:mysql://cs336-18.cs.rutgers.edu:3306/CS336_Project";
		    	//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
			    Class.forName("com.mysql.jdbc.Driver");
		    	
		    	//Create a connection to your DB
			    Connection con = DriverManager.getConnection(url, "csuser", "csda0467");	
		    	String current_user = (String) session.getAttribute("userid");
		    	
			    Statement st = con.createStatement();
			    ResultSet rs;
			    rs = st.executeQuery("SELECT * FROM Users U WHERE uname = '"+session.getAttribute("userid")+"' and isSales = 1" );
			
		   		if(rs.next()){
		   			%>
		   			<form method="post" action="addAdVerify.jsp">
					    Link name: <input type="text" name="link" value="" />Add interest:<input type="checkbox" name="carsIntereset" value="cars">Cars<input type="checkbox" name="socksInterest" value="socks">Socks <input type="checkbox" name="horsesInterest" value="horses">Horses<input type="submit" value = "Add ad">
					</form>
					
					
					
					
					
		   			<form method = "post" action = "deleteAd.jsp">
		   				<select name ="ad names">
		   					<%
		   					rs = st.executeQuery("SELECT A.aid FROM Advertisement A" );
		   					while(rs.next()){
		   						String aid =String.valueOf(rs.getInt(1));
		   						out.println("<option value=\" "+aid+" \">" +aid);
		   					}
		   					
		   					
		   					%>
		   				</select><input type="submit" value = "Delete ad">
		   			</form>
		   			
		   			<form method = "post" action = "addProduct.jsp">
		   				Name: <input type="text" name="Name" value="" />
		   				Price: <input type="text" name="Price" value="" />
		   				Amount: <input type="text" name="Amount" value="" />
		   				Ad: <input type="text" name="Ad" value="" />
		   				Salesman: <input type="text" name="Salesman" value="" />
		   			</form>

		   			<%
		   		}else{
		   			out.println("You are not an salesman <a href='Home.jsp'>Return to home</a>");
		   		}
		    	
			 %>
		</body>
		
</html>
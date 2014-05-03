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
<%
    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
	out.println("You are not logged in");
%>
You are not logged in
<br/>
<a href="login.jsp">Please Login</a>
<%} else {
%>
Welcome <%=session.getAttribute("userid")%>
<br>
<%  //prints out a welcome if someone is an admin/mod/salesman.  MUST CAST TO Boolean** %>
<%if((Boolean)session.getAttribute("isAdmin")==true){ %>
Hello Admin
<br>
<%} %>
<%if((Boolean)session.getAttribute("isMod")==true){ %>
Hello Moderator
<br>
<%} %>
<br>
<%if((Boolean)session.getAttribute("isSales")==true){ %>
Hello Salesman
<br>
<%} %>
<a href='logout.jsp'>Log out</a>
<%
    }
%>
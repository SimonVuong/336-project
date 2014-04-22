<%@ page import ="java.sql.*" %>
<%
    String user = request.getParameter("uname");    
    String pwd = request.getParameter("pass");
    String name = request.getParameter("name");
    String email = request.getParameter("email");
	int zero= 0;
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/CS336_Project",
            "root", "csda0467");
    Statement st = con.createStatement();
    int i = st.executeUpdate("insert into Users(uname,pwd, Spent, fullname, email, isSales, isMod, isAdmin, years, netVotes, numComments) values ('" + user + "','" + pwd + "','" + zero + "','" + name + "','" + email + "','" + zero + "','" + zero +"','" + zero +"', NOW(),'" + zero +"','" + zero +"' )");
    if (i > 0) {
        response.sendRedirect("welcome.jsp");
    } else {
        response.sendRedirect("login.jsp");
    }
%>
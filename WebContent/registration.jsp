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
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/CS336_Project",
            "root", "csda0467");
    Statement st = con.createStatement();
    int i = st.executeUpdate("insert into Users(uname,pwd, Spent, fullname, email, isSales, isMod, isAdmin, years, netVotes, numComments) values ('" + user + "','" + pwd + "','" + zero + "','" + name + "','" + email + "','" + zero + "','" + zero +"','" + zero +"', NOW(),'" + zero +"','" + zero +"' )");
    
    if(cars != null){
    	st.executeUpdate("insert into UserInterest (uname, interest) values ('" +user+ "', '"+ cars+"' )");
    }
    
    if(socks!= null){
    	st.executeUpdate("insert into UserInterest (uname, interest) values ('" +user+ "', '"+ socks+"' )");
    }
    
    if(horses!= null){
    	st.executeUpdate("insert into UserInterest (uname, interest) values ('" +user+ "', '"+ horses+"' )");
    }
    
    
    
    if (i > 0) {
        response.sendRedirect("welcome.jsp");
    } else {
        response.sendRedirect("login.jsp");
    }
%>
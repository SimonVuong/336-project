<%@ page import ="java.sql.*" %>
<%
    int cID = Integer.ParseInt(request.getParameter("cID"));  
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = null;
    try{
    	con= DriverManager.getConnection("jdbc:mysql://localhost:3306/CS336_Project",
            "root", "csda0467");
    }
    catch(Exceptrion e){
    	out.println("connection failed");}
    Statement st=con.createStatement;
    ResultSet del=null;
    try{
    	del=executeQuery("delete from Comment where cid=" + cID);
    }
    catch(SQL Exception c){
    	out.println("logic error");
    }
    
    %>
<%@ page import ="java.sql.*" %>
<%
    String temp = request.getParameter("cID"); 
	int cID= Integer.parseInt(temp);
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = null;
    try{
    	con= DriverManager.getConnection("jdbc:mysql://localhost:3306/CS336_Project",
            "root", "csda0467");
    }
    catch(Exception e){
    	out.println("connection failed");}
    PreparedStatement st=null;
    String query="Delete From Comment Where cid= ?";
    int check=100;
    try{
    	st=con.prepareStatement(query);
    	st.setInt(1,cID);
    	check=st.executeUpdate();
    }
    catch(SQLException c){
    	out.println("logic error");
    }
    out.println(check);
    %>
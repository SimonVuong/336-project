<%@ page import ="java.sql.*" %>
<%
	String userid=(String) session.getAttribute("userid");
    String sentTo = request.getParameter("sentTo"); 
	String message request.getParameter("message");
	
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = null;
    try{
    	con= DriverManager.getConnection("jdbc:mysql://localhost:3306/CS336_Project",
            "root", "csda0467");
    }
    catch(Exception e){
    	out.println("connection failed");}
    PreparedStatement st=null;
    String query="Update Thread Set title= ? Where tid= ?";
    int check=100;
    //I am running this and getting 0 lines updated??
    try{
    	st=con.prepareStatement(query);
    	st.setString(1,newTitle);
    	st.setInt(2,tID);
    	check=st.executeUpdate();
    }
    catch(SQLException c){
    	out.println("logic error");
    }
    out.println(check);
    %>
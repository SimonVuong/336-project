<%@ page import ="java.sql.*" %>
<%
	String userid=(String) session.getAttribute("userid");
    String sentTo = request.getParameter("sentTo"); 
	String message =request.getParameter("message");
	
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = null;
    try{
    	con= DriverManager.getConnection("jdbc:mysql://localhost:3306/CS336_Project",
            "root", "csda0467");
    }
    catch(Exception e){
    	out.println("connection failed");}
    PreparedStatement st=null;
    PreparedStatement userCheck=null;
    String query="Insert Into Message (sender, receiver, contents) VALUES (?,?,?)";
    String sentToQuery="Select * From Users Where uname=?";
    ResultSet rs=null;
    int check=100;
    //I am running this and getting 0 lines updated??
    try{
    	userCheck=con.prepareStatement(sentToQuery);
    	userCheck.setString(1,sentTo);
    	rs=userCheck.executeQuery();
    	if(rs.next()){
    	st=con.prepareStatement(query);
    	st.setString(1,userid);
    	st.setString(2,sentTo);
    	st.setString(3,message);
    	check=st.executeUpdate();
    	}
    }
    catch(SQLException c){
    	out.println("logic error");
    }
    out.println(check);
    response.setHeader("Refresh", "5; URL=Home.jsp")
    %>
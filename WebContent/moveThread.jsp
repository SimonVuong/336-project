<%@ page import ="java.sql.*" %>
<%
    int tID = Integer.ParseInt(request.getParameter("tID"));    
    String topic = request.getParameter("topic");
    String subTopic= request.getParameter("subTopic");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/CS336_Project",
            "root", "csda0467");
    Statement st = con.createStatement();
    ResultSet threadResult=null;
    ResultSet topicResult=null;
    ResultSet subTopicResult=null;
    try{
    topicResult = st.executeQuery("select * from Topic where tname=  '"    + topic +    "' ");
    threadResult = st.executeQuery("select * from Thread where tid=  '"    + tID +    "' ");
    subTopicResultst.executeQuery("select * from Subtopic where sname=  '"    + subTopic +    "' and tname=  '"    + topic +    "' ");
    }
    catch(SQLException e){
    	out.println("an sql error occured, try reentering your values");
    }
    if (threadResult.next()) {
    	 if (topicResult.next()) {
    		 if (subTopicResult.next()) {
    			 String query="Update Thread Set sname = "+ subTopic "Where tid=" + tID
    			 PreparedStatement upd=null;
    			 try{
    				 upd=con.prepareStatement(query);
    			 }
    			 catch(SQLException e){
    				 out.println("we already found your topic and stuff... this should work")
    			 }
    		 }
    	 }
        
    } else {
        out.println("Invalid thread ID or topic subtopic combination. <a href='home.jsp'>try again</a>");
    }
%>
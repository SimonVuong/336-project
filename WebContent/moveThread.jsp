<%@ page import ="java.sql.*" %>
<%
    int tID = Integer.ParseInt(request.getParameter("tID"));    
    String topic = request.getParameter("topic");
    String subTopic= request.getParameter("subTopic");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/CS336_Project",
            "root", "csda0467");
    PreparedStatement threadState = null;
    PreparedStatement topicState=null;
    PreparedStatement subTopicState= null;
    ResultSet threadResult=null;
    ResultSet topicResult=null;
    ResultSet subTopicResult=null;
    String topicSel= "Select * FROM Topic Where tname=?"
    String threadSel= "Select * FROM Thread Where tid=?"
    String subTopSel= "Select * FROM Subtopic Where sname=? and tname=?"
    try{
    threadState= con.prepareStatement(threadSel);
    threadState.setInt(1,tID);
    threadResult=threadState.executeQuery();
    
    topicState=con.prepareStatement(topicSel);
    topicState.setString(1,topic);
    topicResult=topicState.executeQuery();
    
    subTopicState=con.prepareStatement(subTopSel);
    subTopicState.setString(1,subTopic);
    subTopicState.setString(2,topic);
    subTopicResult=subTopicState.executeQuery;
    
    }
    catch(SQLException e){
    	out.println("an sql error occured, try reentering your values");
    }
    if (threadResult.next()) {
    	 if (topicResult.next()) {
    		 if (subTopicResult.next()) {
    			 String query="Update Thread Set sname = ? Where tid=?";
    			 PreparedStatement upd=null;
    			 try{
    				 upd=con.prepareStatement(query);
    				 upd.setString(1,subTopic);
    				 upd.setInt(2,tID);
    				 upd.executeQuery;
    			 }
    			 catch(SQLException e){
    				 out.println("we already found your topic and stuff... this should work")
    			 }
    		 }
    	 }
        
    } 
    response.sendRedirect("success.jsp");
    else {
        out.println("Invalid thread ID or topic subtopic combination. <a href='home.jsp'>try again</a>");
    }
%>
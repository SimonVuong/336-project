<%@ page import ="java.sql.*" %>
<%
    String userid = request.getParameter("uname");    
    String pass = request.getParameter("pass");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/CS336_Project",
            "root", "csda0467");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from Users where uname=  '"    + userid +    "'   and pwd=  '" + pass + "'  ");
    if (rs.next()) {
        session.setAttribute("userid", userid);
        out.println("welcome " + userid);
        //trying to get isMod and isAdmin characteristics of the user on login.  
        int isMod= rs.getInt("isMod");
        int isAdmin=rs.getInt("isAdmin");
        int isSales=rs.getInt("isSales");
        if(isMod==1){
        	session.setAttribute("isMod",true);
        	//out.println("You are a moderator");
        }
        if(isAdmin==1){
        	session.setAttribute("isAdmin",true);
        	//out.println("You are an admin");
        }
        if(isSales==1){
        	session.setAttribute("isSales",true);
        	//out.println("You are an admin");
        }
        //out.println("<a href='logout.jsp'>Log out</a>");
        response.sendRedirect("success.jsp");
    } else {
        out.println("Invalid username or password <a href='home.jsp'>try again</a>");
    }
    %>
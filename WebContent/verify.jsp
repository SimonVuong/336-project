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
        //out.println("<a href='logout.jsp'>Log out</a>");
        response.sendRedirect("success.jsp");
    } else {
        out.println("Invalid username or password <a href='home.jsp'>try again</a>");
    }
%>
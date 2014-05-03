<%
session.setAttribute("userid", null);
session.setAttribute("isMod",null);
session.setAttribute("isAdmin",null);
session.setAttribute("isSales",null);
session.invalidate();
response.sendRedirect("Home.jsp");
%>
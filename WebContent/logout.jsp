<%
session.setAttribute("userid", null);
session.invalidate();
response.sendRedirect("Home.jsp");
%>
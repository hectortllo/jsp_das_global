<%-- 
    Document   : borrar.jsp
    Created on : 28/02/2021, 14:04:43
    Author     : hectortllo
--%>

<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Connection con = null;
            Statement st = null;
            
            try {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost/test_das?user=root&password=root");
                st = con.createStatement();
                st.executeUpdate("DELETE FROM sucursal WHERE id_sucursal='"+request.getParameter("id_sucursal") +"';");
                request.getRequestDispatcher("sucursal.jsp").forward(request, response);
            } catch(Exception e) {
                out.print(e);
            }
        %>
    </body>
</html>

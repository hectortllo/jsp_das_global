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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Connection con = null;
            Statement st = null;
            
            try {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost/dsa_global?user=root&password=root");
                st = con.createStatement();
                /**
                *    Borrar los colabores relacionados a la sucural a eliminar
                */
                st.executeUpdate("DELETE FROM colaborador WHERE id_sucursal='"+request.getParameter("id_sucursal")+"';");
                /**
                 *  Borrar la sucursal en sí
                 */
                st.executeUpdate("DELETE FROM sucursal WHERE id_sucursal='"+request.getParameter("id_sucursal") +"';");
                request.getRequestDispatcher("sucursal.jsp").forward(request, response);
            } catch(Exception e) {
                out.print(e);
            }
        %>
    </body>
</html>

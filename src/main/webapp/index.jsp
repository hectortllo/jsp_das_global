<%-- 
    Document   : index
    Created on : 28/02/2021, 12:28:19
    Author     : hectortllo
--%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="com.hectortllo.proyectodasglobal.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <title>DAS Global</title>
    </head>
    <body>
        <%
            Connection con = null;
            Statement st = null;
            ResultSet rs = null;
        %>
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col" colspan="4" class="text-center"><h3>Empresa</h3></th>
                            </tr>
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Nombre</th>
                                <th scope="col">Pais</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                try {
                                    con = Conexion.conection();
                                    st = con.createStatement();
                                    rs = st.executeQuery("SELECT * FROM empresa");
                                    while (rs.next()) {
                                        %>
                                        <tr>
                                            <td scope="row"><%= rs.getInt("id_empresa") %></td>
                                            <td scope="row">
                                                <a href="sucursal.jsp">
                                                    <%= rs.getString("nombre") %>
                                                </a>
                                            </td>
                                            <td scope="row"><%= rs.getString("pais") %></td>
                                        </tr>
                                        <%
                                    }
                                } catch(Exception e) {
                                    out.print("error mysql " + e);
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>

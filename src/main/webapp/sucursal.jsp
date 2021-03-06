<%-- 
    Document   : sucursal
    Created on : 28/02/2021, 12:43:43
    Author     : hectortllo
--%>
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
        <title>Sucursales</title>
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
                                <th scope="col" colspan="4" class="text-center"><h3>Sucursales</h3></th>
                            </tr>
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Nombre</th>
                                <th scope="col">Dirección</th>
                                <th scope="col">Teléfono</th>
                                <th scope="col">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                try {
                                    con = Conexion.conection();
                                    st = con.createStatement();
                                    rs = st.executeQuery("SELECT * FROM sucursal");
                                    while (rs.next()) {
                                        %>
                                        <tr>
                                            <td scope="row"><%= rs.getString(1) %></td>
                                            <td scope="row">
                                                <a href="colaborador.jsp?id_sucursal= <%= rs.getString(1) %>">
                                                    <%= rs.getString(2) %>
                                                </a>
                                            </td>
                                            <td scope="row"><%= rs.getString(3) %></td>
                                            <td scope="row"><%= rs.getString(4) %></td>
                                            <td>
                                                <a href="editarSucursal.jsp?id_sucursal=<%=rs.getString(1) %>
                                                   &nombre=<%=rs.getString(2) %>
                                                   &direccion=<%=rs.getString(3) %>
                                                   &telefono=<%=rs.getString(4) %>" >
                                                    <i class="fa fa-pencil" aria-hidden="true"></i>
                                                </a>
                                                <a href="borrarSucursal.jsp?id_sucursal=<%= rs.getString(1) %>" style="margin-left: 15px">
                                                    <i class="fa fa-trash" aria-hidden="true"></i>
                                                </a>
                                                
                                            </td>
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
            <div class="row">
                <div class="col-sm">
                    <a href="index.jsp" class="btn btn-primary">Home</a>
                </div>
                <div class="col-sm">
                    <a href="colaboradores.jsp" class="btn btn-primary">Ver todos los colaboradores</a>
                </div>
            </div>
        </div>
    </body>
</html>

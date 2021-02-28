<%-- 
    Document   : colaborador
    Created on : 28/02/2021, 15:28:10
    Author     : hectortllo
--%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="com.hectortllo.proyectodasglobal.*" %>
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
            ResultSet rs = null;
            String id = request.getParameter("id_sucursal");
        %>
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col" colspan="4" class="text-center"><h3>Colaboradores</h3></th>
                            </tr>
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Nombre</th>
                                <th scope="col">CUI</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                try {
                                    con = Conexion.conection();
                                    st = con.createStatement();
                                    rs = st.executeQuery("SELECT * FROM colaborador WHERE id_sucursal = '"+id+"'");
                                    while (rs.next()) {
                                        %>
                                        <tr>
                                            <td scope="row"><%= rs.getString(1) %></td>
                                            <td scope="row"><%= rs.getString(2) %></td>
                                            <td scope="row"><%= rs.getString(3) %></td>
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
                    <a href="sucursal.jsp" class="btn btn-primary">Sucursales</a>
                </div>
            </div>
        </div>
    </body>
</html>

<%-- 
    Document   : editarSucursal
    Created on : 28/02/2021, 13:07:45
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
        <title>Editar Sucursal</title>
    </head>
    <body>
        <%
            String id = request.getParameter("id_sucursal");
            String nombre = request.getParameter("nombre");
            String direccion = request.getParameter("direccion");
            String telefono = request.getParameter("telefono");
        %>
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">
                    <h3 class="text-center">Editar Sucursal</h3>
                    <form action="editarSucursal.jsp" method="get">
                        <div class="form-group">
                            <label for="nombre">Nombre</label>
                            <input type="text" class="form-control" id="nombre" value="<%= nombre %>" name="nombre" placeholder="Nombre" required>
                        </div>
                        <div class="form-group">
                            <label for="nombre">Nombre</label>
                            <input type="text" class="form-control" id="direccion" value="<%= direccion %>" name="direccion" placeholder="Dirección" required>
                        </div>
                        <div class="form-group">
                            <label for="nombre">Nombre</label>
                            <input type="text" class="form-control" id="telefono" value="<%= telefono %>" name="telefono" placeholder="Teléfono" required>
                        </div>
                        <a href="sucursal.jsp" class="btn btn-danger mt-3">
                            Cancelar<i class="fa fa-ban" aria-hidden="true"></i>
                        </a>
                        <button type="submit" name="enviar" class="btn btn-primary mt-3" style="margin-left: 8px">Guardar</button>
                        <input type="hidden" id="id_sucursal" name="id_sucursal" value="<%= id %>">
                    </form>
                </div>
            </div>
        </div>
        <%
            if (request.getParameter("enviar") != null) {
                try {
                    Connection con = null;
                    Statement st = null;
                    
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost/test_das?user=root&password=root");
                    st = con.createStatement();
                    st.executeUpdate("UPDATE sucursal SET nombre='" + nombre + "', direccion='" + direccion + "', "
                    + "telefono='"+telefono+"' WHERE id_sucursal = '"+id+"';");
                    request.getRequestDispatcher("sucursal.jsp").forward(request, response);
                    
                } catch(Exception e) {
                    out.print(e);
                }
            }
        %>
    </body>
</html>

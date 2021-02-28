<%-- 
    Document   : index
    Created on : 28/02/2021, 12:28:19
    Author     : hectortllo
--%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
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
                                <th scope="col">ID</th>
                                <th scope="col">Nombre</th>
                                <th scope="col">Pais</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                try {
                                    Class.forName("com.mysql.jdbc.Driver");
                                    con = DriverManager.getConnection("jdbc:mysql://localhost/test_das?user=root&password=root");
                                    st = con.createStatement();
                                    rs = st.executeQuery("SELECT * FROM empresa");
                                    while (rs.next()) {
                                        %>
                                        <tr>
                                            <th scope="row"><%= rs.getInt("id_empresa") %></th>
                                            <th scope="row"><%= rs.getString("nombre") %></th>
                                            <th scope="row"><%= rs.getString("pais") %></th>
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

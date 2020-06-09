
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<title>JSP Page</title>
</head>
<body>
    
<%
//CONECTANDO A LA BASE DE DATO LLAMADA recurso_humano
Connection con;
String url="jdbc:mysql://localhost:3306/recurso_humano";
String Driver="com.mysql.jdbc.Driver";
String user="root";
String clave="";

Class.forName(Driver);
con = DriverManager.getConnection(url, user, clave);

//LISTAREMOS LOS DATOS DE LA TABLA PERSONA tb_persona
PreparedStatement ps;
ResultSet rs;
ps=con.prepareStatement("select * from tb_persona");
rs=ps.executeQuery();


//CREAR LA TABLA DONDE SE ALMACENARAN
%>
  
<div class="mt-4">
<div class="card">
<div class="card-header">
<h1 align="center">Lista de registro</h1>    
<br>
    
<a  href="add.jsp" class="btn btn-primary">Nuevo Usuario</a> 
</div>
<div class="card-body">
<table  class="table table-hover">
      
<tr>
            <th>ID</th>
            <th>DUI</th>
            <th>NOMBRE</th>
            <th>APELLIDO</th>
            <th>ACCIONES</th>
</tr>

<%
while (rs.next()){

%>

<tr>
<td><%=rs.getInt("id")%> </td>
<td><%=rs.getString("dui")%></td>
<td><%=rs.getString("nombre")%></td>
<td><%=rs.getString("apellido")%></td>
<td>
<a href="editar.jsp?id=<%=rs.getInt("id")%>" class="btn btn-warning">Edit</a>
<a  href="delete.jsp?id=<%=rs.getInt("id")%>"  class="btn btn-danger">Delete</a>
</td>
</tr>
<%}%>


</table>
</div>
</div>
</div>    
</body>
</html>




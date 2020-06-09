
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
<div>
<br>

<h1 align="center">Agregar</h1>
<br>
<form action="" method="POST">
        
<div class="form-group">    
<input class="form-control " placeholder="Dui" type="text" name="txtdui" value=""  required="" />
</div>
 
<div class="form-group">
<input class="form-control" placeholder="Nombre" type="text" name="txtnombre" value="" required="" />
</div>
        
<div class="form-group">  
<input  class="form-control" placeholder="Apellido" type="text" name="txtapellido" value=""  required="" />
</div>
<center>       
<input type="submit" value="Registrar " class="btn btn-primary"/>
<a href="index.jsp"></a>
</center>

</form>
</body>
</html>

</div>
</body>
</html>
   
<%
//CONECTANDO A LA BASE DE DATO LLAMADA recurso_humano
Connection con;
String url="jdbc:mysql://localhost:3306/recurso_humano";
String Driver="com.mysql.jdbc.Driver";
String user="root";
String clave="";

Class.forName(Driver);
con = DriverManager.getConnection(url, user, clave);


//CAPTURAR LOS DATOS  DE LAS CAJAS DE TEXTO

PreparedStatement ps;
String dui, nombre, apellido;
dui=request.getParameter("txtdui");
nombre=request.getParameter("txtnombre");
apellido =request.getParameter("txtapellido");

if(dui!= null && nombre!=null && apellido!=null){
ps=con.prepareStatement("insert into tb_persona(dui, nombre, apellido)values('"+dui+"','"+nombre+"','"+apellido+"')");
ps.executeUpdate();
response.sendRedirect("index.jsp");
}

%>
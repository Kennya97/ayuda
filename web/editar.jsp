
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

//LISTAREMOS LOS DATOS DE LA TABLA tb_persona de la fila seleccionada
PreparedStatement ps;
ResultSet rs;

int id= Integer.parseInt(request.getParameter("id"));
ps=con.prepareStatement("select * from tb_persona where id="+id);
rs=ps.executeQuery();

while(rs.next()){


%>
<div>
<br>
<h1 align="center">MODIFICAR</h1>
<br>
<form action="" method="POST">
   
 <div class="form-group">    
<input class="form-control "  type="hidden" name="txtid" value="<%=rs.getInt("id")%>" />
</div>   
    
   
<div class="form-group">    
<input class="form-control " type="text" name="txtdui" value="<%=rs.getString("dui")%>"  />
</div>
 
<div class="form-group">
<input class="form-control" type="text" name="txtnombre" value="<%=rs.getString("nombre")%>" />
</div>
        
<div class="form-group">  
<input  class="form-control"  type="text" name="txtapellido"  value="<%=rs.getString("apellido")%>"  />
</div>
<center>       
<input type="submit" value="Guardar" class="btn btn-primary"/>
<input href="index.jsp" type="submit" value="Regresar" class="btn btn-dark"/>
<a href="index.jsp"></a>
</center>

</form>
<%}%>

</body>
</html>

<%

//CAPTURAR LOS DATOS  DE LAS CAJAS DE TEXTO
String dui, nombre, apellido;
dui=request.getParameter("txtdui");
nombre=request.getParameter("txtnombre");
apellido =request.getParameter("txtapellido");

if(dui!= null && nombre!=null && apellido!=null){
ps=con.prepareStatement("update tb_persona set dui='"+dui+"',nombre='"+nombre+"',apellido='"+apellido+"'where id="+id);
ps.executeUpdate();
response.sendRedirect("index.jsp");
}

%>
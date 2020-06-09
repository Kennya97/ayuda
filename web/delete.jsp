
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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

int id= Integer.parseInt(request.getParameter("id"));
ps=con.prepareStatement("delete  from tb_persona where id="+id);
ps.executeUpdate();
response.sendRedirect("index.jsp");

%>














</body>
</html>

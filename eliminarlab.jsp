<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>

<%

	String item_cod = request.getParameter("cedula");


	Connection conexion = null;
	Statement sentencia = null;
	ResultSet rs=null;
	
	int filas=0;
	try {

		Class.forName("com.mysql.jdbc.Driver");
        conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/eps", "root", "");

		sentencia = conexion.createStatement();
        
		String consultaSQL = "delete from citaslabo where cedula=";
		consultaSQL += "'" + item_cod + "'";

		filas = sentencia.executeUpdate(consultaSQL);
		 
		response.sendRedirect("mostrarlab.jsp");

	} catch (ClassNotFoundException e) {

		out.println("Error en la carga del driver"
				+ e.getMessage());

	} catch (SQLException e) {

		out.println("Error accediendo a la base de datos"
				+ e.getMessage());

	} finally {

		if (sentencia != null) {

			try {sentencia.close();} 
			catch (SQLException e) 
			{out.println("Error cerrando la sentencia" +
					e.getMessage());}
			
		}
		if (conexion != null) {

			try {conexion.close();}
			catch (SQLException e) 
			{out.println("Error cerrando la conexion" +
					e.getMessage());}
		}
	}
%>
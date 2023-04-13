<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!-- sentencias de import necesarias para jdbc-->
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.SQLException"%>

<%

    String nombre = null;
    String doctor = null;
    String calificacion = null;
    String mensaje = null;


    
    if(request.getParameter("nombre")!=null){
        nombre=request.getParameter("nombre");
    }


    if(request.getParameter("doctor")!=null){
        doctor=request.getParameter("doctor");
    }

    if(request.getParameter("calificacion")!=null){
        calificacion=request.getParameter("calificacion");
    }

    if(request.getParameter("mensaje")!=null){
        mensaje=request.getParameter("mensaje");
    }
    
    

    Connection conexion = null;
    Statement sentencia = null;
    int filas=0;

    try{

        Class.forName("com.mysql.jdbc.Driver");
        conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/eps", "root", "");
        sentencia = conexion.createStatement();

        String consultaSQL = "insert into calificacion (nombre, doctor, calificacion, mensaje) values ";
        consultaSQL+= "('" + nombre + "','" + doctor + "','" + calificacion + "','" + mensaje + "')";

        filas = sentencia.executeUpdate(consultaSQL);
        response.sendRedirect("calificacion.html");

    } catch (ClassNotFoundException x){

        out.println("Error en la carga del driver" + x.getMessage());
   
    } catch (SQLException x){

        out.println("Error accediendo a la base de datos " + x.getMessage());

    } finally {

        if(sentencia != null){
            try{sentencia.close();}
            catch(SQLException x){
                out.println("Error cerrando la sentencia " + x.getMessage());
            }
        }

        if(conexion != null){
            try{conexion.close();}
            catch(SQLException x){
                out.println("Error cerrando la conexion " + x.getMessage());
            }
        }
    }
%>    

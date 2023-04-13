<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!-- sentencias de import necesarias para jdbc-->
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.SQLException"%>

<%

    String nombre = null;
    String apellido = null;
    String cedula = null;
    String correo = null;
    String direccion= null;
    String areasalud= null;
    String doctor= null;
    String fecha = null;
    String precio = null;
    

    
    if(request.getParameter("nombre")!=null){
        nombre=request.getParameter("nombre");
    }


    if(request.getParameter("apellido")!=null){
        apellido=request.getParameter("apellido");
    }

    if(request.getParameter("cedula")!=null){
        cedula=request.getParameter("cedula");
    }

    if(request.getParameter("correo")!=null){
        correo=request.getParameter("correo");
    }

    

    if(request.getParameter("direccion")!=null){
        direccion=request.getParameter("direccion");
    }

     if(request.getParameter("areasalud")!=null){
        areasalud=request.getParameter("areasalud");
    }

    if(request.getParameter("doctor")!=null){
        doctor=request.getParameter("doctor");
    }

    if(request.getParameter("fecha")!=null){
        fecha=request.getParameter("fecha");
    }

    if(request.getParameter("precio")!=null){
    precio=request.getParameter("precio");
    }
    
    

    Connection conexion = null;
    Statement sentencia = null;
    int filas=0;

    try{

        Class.forName("com.mysql.jdbc.Driver");
        conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/eps", "root", "");
        sentencia = conexion.createStatement();

        String consultaSQL = "insert into citasmedicas (nombre, apellido, cedula, correo,  direccion, areasalud, doctor, fecha, precio) values ";
        consultaSQL+= "('" + nombre + "','" + apellido + "','" + cedula + "','" + correo + "','" + direccion + "','" + areasalud + "','" + doctor + "','" + fecha+"','" + precio+"')";

        filas = sentencia.executeUpdate(consultaSQL);
        response.sendRedirect("mostrarmed.jsp");

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

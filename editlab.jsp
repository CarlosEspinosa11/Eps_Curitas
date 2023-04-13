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
    String numero= null;
    String direccion= null;
    String precio= null;
    String tipoexamen = null;
    String fecha = null;


    
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

    if(request.getParameter("numero")!=null){
        numero=request.getParameter("numero");
    }

     if(request.getParameter("direccion")!=null){
        direccion=request.getParameter("direccion");
    }

    if(request.getParameter("precio")!=null){
        precio=request.getParameter("precio");
    }

    if(request.getParameter("tipoexamen")!=null){
        tipoexamen=request.getParameter("tipoexamen");
    }
    
    if(request.getParameter("fecha")!=null){
        fecha=request.getParameter("fecha");
    }

    Connection conexion = null;
    Statement sentencia = null;
    int filas=0;

    try{

        Class.forName("com.mysql.jdbc.Driver");
        conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/eps", "root", "");
        sentencia = conexion.createStatement();

        String consultaSQL = "UPDATE citaslabo SET nombre = '"+nombre+"', apellido = '"+apellido+"', cedula='" + cedula + "',correo='" + correo + "',numero='" + numero + "',direccion='" + direccion + "',precio='" + precio+ "',tipoexamen='" + tipoexamen + "',fecha='" + fecha + "' WHERE cedula="+cedula+"; ";
        
        filas = sentencia.executeUpdate(consultaSQL);
        response.sendRedirect("mostrarlab.jsp");

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

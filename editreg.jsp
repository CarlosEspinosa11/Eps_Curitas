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
    String numero = null;
    String direccion= null;
    String estadocivil= null;
    String fechanacimiento= null;
    String contrasena = null;

    
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

     if(request.getParameter("estadocivil")!=null){
        estadocivil=request.getParameter("estadocivil");
    }

    if(request.getParameter("fechanacimiento")!=null){
        fechanacimiento=request.getParameter("fechanacimiento");
    }

    if(request.getParameter("contrasena")!=null){
        contrasena=request.getParameter("contrasena");
    }


    Connection conexion = null;
    Statement sentencia = null;
    int filas=0;

    try{

       Class.forName("com.mysql.jdbc.Driver");
       conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/eps", "root", "");
        sentencia = conexion.createStatement();

        String consultaSQL = "UPDATE registro SET nombre = '"+nombre+"', apellido= '"+apellido+"', cedula='" + cedula + "',correo='" + correo + "', numero='" + numero + "',direccion='" + direccion + "',estadocivil='" + estadocivil + "',fechanacimiento='" + fechanacimiento +"' WHERE cedula="+cedula+"; ";
        
        filas = sentencia.executeUpdate(consultaSQL);
        response.sendRedirect("mostrarreg.jsp");

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

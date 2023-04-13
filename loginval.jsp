<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.ResultSet" %>


  <%
  Connection conexion=null;
  Statement  sentencia=null;
  ResultSet rs=null;

  int ingreso = 0;
  String nombre = null;
  String contrasena =null;

  nombre=request.getParameter("usuario");
  contrasena=request.getParameter("contrasena");
  
  try{

  Class.forName("com.mysql.jdbc.Driver");

  conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/eps", "root", "");

  sentencia= conexion.createStatement();

  String consultaSQL=  "SELECT COUNT(*) AS CANTIDAD FROM registro WHERE nombre='" + nombre +  "' AND contrasena='" + contrasena + "';";

  rs=sentencia.executeQuery(consultaSQL);

  while(rs.next()) {
 
    ingreso = rs.getInt("CANTIDAD");
  }

  if(ingreso == 1){ 
    response.sendRedirect("mostrarreg.jsp");

  }else{
    response.sendRedirect("login.html");
  }

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




  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.slim.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.1/umd/popper.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>

</body>
</html>


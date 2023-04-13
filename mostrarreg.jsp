
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html">
        <title>Facturas de venta JSP</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    </head>
    <body class="page">

    <div class="navbar navbar-expand-lg bg-dark navbar-dark">
            <div class="container-fluid">
                <a href="index.html" class="navbar-brand">EPS CURITAS</a>
                <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                    <div class="navbar-nav ml-auto">
                        <a href="mostrarreg.jsp" class="nav-item nav-link active ">Perfil</a>
                        <a href="citasmed.html" class="nav-item nav-link">Citas Medicas</a>
                        <a href="citaslab.html" class="nav-item nav-link ">Citas Laboratorios</a>
                    </div>
                    <div>     
                        </span></a>
                    </div>
                </div>
            </div>
        </div>
    


  <br><br><br><br><br><br><h1 class="text-center">Registro</h1><br>
    
       
   
        
<tbody class="text-primary">

        <%
            Connection conexion = null;
            Statement sentencia = null;
            ResultSet rs = null;

            try{

                Class.forName("com.mysql.jdbc.Driver");
                conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/eps","root","");
                sentencia = conexion.createStatement();

                String consultaSQL = "select * from registro";
                rs=sentencia.executeQuery(consultaSQL);

                 

                while(rs.next()){ %>
                       
                

                    <center>
                    <div class="card" style="width:300px">
                        <img class="card-img-top" src="img/usuario.png" alt="Card image" style="width: 50% ;margin-left: 26%; margin-top: 5%;">
                        <div class="card-body">
                        <p class="variable"><b>Nombre:</b> <%=rs.getString("nombre")%> </p>
                        <p class="variable"><b>Apellido: </b><%=rs.getString("apellido")%></p> 
                        <p class="variable"><b>Cedula: </b><%=rs.getString("cedula")%></p> 
                        <p class="variable"><b>Correo: </b><%=rs.getString("correo")%></p> 
                        <p class="variable"><b>Direccion: </b><%=rs.getString("direccion")%> </p> 
                        <p class="variable"><b>Estado Civil: </b><%=rs.getString("estadocivil")%> </p> 
                        <p class="variable"><b>Fecha Nacimiento: </b><%=rs.getString("fechanacimiento")%> </p> 
                        <p class="variable"><b>Contraseña: </b><%=rs.getString("contrasena")%> </p> 
                            <div class=" d-flex justify-content-center">
                            <form action="actualizarreg.jsp" method="POST" >
                                <input type="hidden" name="cedula" value="<%=rs.getString("cedula")%>">
                                    <button type="submit" style="margin-right: 15%;">
                                        <span class="material-symbols-outlined">edit</span>
                                    </button>
        </form>
        <form action="eliminarreg.jsp" method="POST">
            <input type="hidden" name="cedula" value="<%=rs.getString("cedula")%>">
                <button type="submit" style="margin-left: 10% ;">
                    <span class="material-symbols-outlined"> delete </span>
                </button>
        </form> 
    </div>
    </div>
  </div>
  <br>
        
                     </tr>
                    </center>  
               
                <% }

            } catch (ClassNotFoundException x){

                out.println("Error en la carga del driver " + x.getMessage());

            } catch (SQLException x){

                out.println("Error accediendo a la base de datos " + x.getMessage());

            } finally {

                if( rs != null ){

                    try{rs.close();}
                    catch(SQLException x){
                        out.println("Error cerrando el resultset " + x.getMessage());
                    }

                }

                if( sentencia != null ){

                    try{sentencia.close();}
                    catch(SQLException x){
                        out.println("Error cerrando la sentencia " + x.getMessage());
                    }

                }

                if( conexion != null ){

                    try{conexion.close();}
                    catch(SQLException x){
                        out.println("Error cerrando la conexion " + x.getMessage());
                    }

                }
            }
        %>
        
</tbody>
     </table>
</div>

     
        <a href="index.html">Volver a la Pagina</a>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.1/umd/popper.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>
    </body>
</html>
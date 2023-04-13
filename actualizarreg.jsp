<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>EPS CURITAS</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <meta name="Description" content="Enter your description here"/>
        

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Lato&family=Oswald:wght@200;300;400&display=swap" rel="stylesheet">
        
        <!-- CSS Libraries -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="lib/animate/animate.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
        <link href="css/actualizar.css" rel="stylesheet">
    </head>

    <body class="page">

   
        <!-- Nav Bar Start -->
        <div class="navbar navbar-expand-lg bg-dark navbar-dark">
            <div class="container-fluid">
                <a href="index.html" class="navbar-brand">EPS CURITAS</a>
                <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                    <div class="navbar-nav ml-auto">
                        <a href="mostrarreg.jsp" class="nav-item nav-link active">Perfil</a>
                        <a href="citasmed.html" class="nav-item nav-link">Citas Medicas</a>
                        <a href="citaslab.html" class="nav-item nav-link">Citas Laboratorios</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Nav Bar End -->
    
         <%
            Connection conexion=null;
            Statement  sentencia=null;
            ResultSet rs=null;
            

            Class.forName("com.mysql.jdbc.Driver");
            conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/eps", "root", "");
            sentencia = conexion.createStatement();

            String item_cod = request.getParameter("cedula");

            String consultaSQL=  " select * from registro where cedula= ";
            consultaSQL += "'" + item_cod + "'";

            rs=sentencia.executeQuery(consultaSQL);

       while(rs.next()) { %>
        
 
    <form action="editreg.jsp" method="post" class="formulario" style="margin-left: 35%;"  >
        <h1 style="margin-left:30% ;">EDITAR DATOS</h1>
        <div class="form-datos"> 
            <label for="nombre" class="negrilla">Nombre</label>
            <input   type="text" name="nombre" class=" col-md-10"   size="10" id="formGroupExampleInput" placeholder="Digite su nombre"  value="<%=rs.getString("nombre")%>"> <br> 
  
            <label for="apellido" class="negrilla">Apellido</label>
            <input type="text" name="apellido" class=" col-md-10"  size="10" id="formGroupExampleInput" placeholder="Digite su apellido"  value="<%=rs.getString("apellido")%>"> <br>

            <label for="cedula" class="negrilla">Cédula</label>
            <input type="text" name="cedula" class=" col-md-10"  size="10" id="formGroupExampleInput" placeholder="Digite su cedula"   value="<%=rs.getString("cedula")%>">   <br>

            <label for="correo" class="negrilla">Correo Electrónico</label>
            <input type="email" name="correo" class=" col-md-10"  size="10" id="formGroupExampleInput" placeholder="Digite su correo electronico"  value="<%=rs.getString("correo")%>"> <br>
    
            <label for="numero" class="negrilla">Cédula</label>
            <input type="text" name="numero" class=" col-md-10"  size="10" id="formGroupExampleInput" placeholder="Digite su numero"   value="<%=rs.getString("numero")%>">   <br>

            <label for="direccion" class="negrilla">Dirección de residencia</label>
            <input type="text" name="direccion" class=" col-md-10"  size="10" id="formGroupExampleInput" placeholder="Digite su direccion de residencia"  value="<%=rs.getString("direccion")%>"> <br>
        </div>


       
        <div class=" form-genero ">
            <label for="lbl-pregunta" class="negrilla"> Escoja su estado civil</label><br>
     
            <label for="casado" class="casado">
                <input type="radio" name="estadocivil" id="casado" value="Casado" <%if(rs.getString("estadocivil").equals("Casado")){%>checked<%}%>>Casado
            </label>
            <br>

            <label for="divorciado" class="divorciado">
                <input type="radio" name="estadocivil" id="divorciado" value="Divorciado" <%if(rs.getString("estadocivil").equals("Divorciado")){%>checked<%}%>>Divorciado
            </label>
            <br>

            <label for="soltero" class="soltero">
                <input type="radio" name="estadocivil" id="soltero" value="Soltero"<%if(rs.getString("estadocivil").equals("Soltero")){%>checked<%}%>>Soltero
            </label>
            <br>

            <label for="unionlibre" class="unionlibre">
                <input type="radio" name="estadocivil" id="unionlibre" value="Union libre"<%if(rs.getString("estadocivil").equals("Union libre")){%>checked<%}%>>Union libre
            </label>
            <br>

            <label for="viudo" class="viudo">
                <input type="radio" name="estadocivil" id="viudo" value="Viudo" <%if(rs.getString("estadocivil").equals("Viudo")){%>checked<%}%>>Viudo
                </label>
        </div>

        <!--DATOS ELECCION(FECHA)-->
        <div class="form-fecha"><br>
             <label for="fechanacimiento" class="negrilla" value="<%=rs.getString("fechanacimiento")%>">Fecha nacimiento</label><br><br>
                <input type="date" name="fechanacimiento" id="fecha">
        </div>
        <br><br>

        <input type="submit" class="boton" value="Enviar">

    </form>

    <% } %>
  
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.slim.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.1/umd/popper.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>

</body>
</html>